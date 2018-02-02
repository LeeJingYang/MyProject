using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Windows;

namespace CoolBBS
{
    public partial class AddNewDynafic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginUser"] == null)
            {
                Response.Write("<script>alert('您要先登录才能发表帖子！')</script>");
                Response.Redirect("UserLogin.aspx?LoginInfo=您要先登录才能发表帖子！&LastFormUrl=AddNewDynamic.aspx");
                return;
            }
            imgVerCode.ImageUrl = "ImageCode.aspx";
            if (!IsPostBack)
            {

            }
        }

        protected void btnAddNewDynamic_Click1(object sender, EventArgs e)
        {
            if (lblGG.Text == "选择话题")
            {
                Response.Write("<script>alert('请选择话题！')</script>");
                return;
            }
            if (string.IsNullOrEmpty(textDynamicTitle.Text))
            {
                Response.Write("<script>alert('请输入帖子标题！')</script>");
                textDynamicTitle.Focus();
                return;
            }
            if (string.IsNullOrEmpty(textDynamicContent.Text))
            {
                Response.Write("<script>alert('请输入帖子内容！')</script>");
                textDynamicContent.Focus();
                return;
            }
            else if (textDynamicContent.Text.Length <= 6)
            {
                Response.Write("<script>alert('帖子内容不能少于6位！')</script>");
                textDynamicContent.Focus();
                return;
            }
            string code = textVerCode.Text;
            HttpCookie htco = Request.Cookies["ImageV"];
            string scode = htco.Value.ToString();

            if (string.IsNullOrEmpty(code) || textVerCode.Text.Length < 4 || code.ToLower() != scode.ToLower())
            {
                Response.Write("<script>alert('验证码输入不正确！')</script>");
                textVerCode.Text = "";
                textVerCode.Focus();
                return;
            }
            Model.Dynamic dynamic = new Model.Dynamic();
            dynamic.DynamicID = "dynamic" + DateTime.Now.ToFileTime();
            dynamic.DynamicTitle = textDynamicTitle.Text;
            dynamic.DynamicContent = textDynamicContent.Text;
            dynamic.PublishDate = DateTime.Now;
            dynamic.SectionID = BLL.SectionBll.GetSectionByName(lblGG.Text).SectionID;
            dynamic.UserNum = (Session["LoginUser"] as Model.User).UserNum;
            List<Model.Picture> picList = new List<Model.Picture>();
            List<HttpPostedFile> fileList = Session["DynamicPicFiles"] as List<HttpPostedFile>;

            if (Session["DynamicPicFiles"] != null)
            {
                foreach (HttpPostedFile item in fileList)
                {
                    Model.Picture pic = new Model.Picture();
                    pic.PictureNum = dynamic.DynamicID;
                    pic.PicturesPath = DateTime.Now.ToFileTime() + item.FileName.Substring(item.FileName.LastIndexOf("."));
                    picList.Add(pic);
                }
            }
            if (BLL.DynamicBll.InsertDynamicAndPic(dynamic, picList) > 0)
            {
                Response.Write("<script>alert('发表成功！')</script>");
                for (int i = 0; i < fileList.Count; i++)
                {
                    fileList[i].SaveAs(Server.MapPath("Image/UploadImg/") + picList[i].PicturesPath);
                    System.Drawing.Image img = System.Drawing.Image.FromFile(Server.MapPath("Image/UploadImg/") + picList[i].PicturesPath);
                    Graphics g = Graphics.FromImage(img);
                    SolidBrush brush = new SolidBrush(Color.Blue);
                    g.DrawString("@" + (Session["LoginUser"] as Model.User).UserName, new Font("宋体", 13f), brush, 0, 0);
                    img.Save(Server.MapPath("Image/UploadImg/watermark/") + picList[i].PicturesPath);
                    g.Dispose();
                    img.Dispose();
                    File.Delete(Server.MapPath("Image/UploadImg/") + picList[i].PicturesPath);
                }
                Session["DynamicPicFiles"] = null;
            }
            else
            {
                Response.Write("<script>alert('发表失败，数据操作错误，请联系管理员！')</script>");
            }
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (Session["DynamicPicFiles"]==null)
            {
                Session["DynamicPicFiles"] = new List<HttpPostedFile>();
            }
            HttpFileCollection files = Request.Files;
            
            if (files.Count != 0)
            {
                for (int i = 0; i < files.Count; i++)
                {
                    (Session["DynamicPicFiles"] as List<HttpPostedFile>).Add(files[i]);
                }
                btnPicCount.Text = (Session["DynamicPicFiles"] as List<HttpPostedFile>).Count.ToString();
            }
            else
            {
                Response.Write("<script>alert('木有文件！')</script>");
            }
        }
    }
}