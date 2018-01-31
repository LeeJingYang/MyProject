using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUserInfo();
        }
        public void LoadUserInfo()
        {
            if (Session["LoginUser"] != null)
            {
                Model.User user = Session["LoginUser"] as Model.User;

                lblUserName.Text = lblUserName2.Text = lblUserName3.Text = user.UserName;
                imgLoginUserHead.ImageUrl = BLL.PictureBll.GetUserHeadByPicNum(user.UserNum).PicturesPath;
            }
        }

        protected void btnUserExit_Click(object sender, EventArgs e)
        {
            if (Session["LoginUser"]!=null)
            {
                Session["LoginUser"] = null;
                Response.Redirect("default.aspx");
            }
        }

        protected void imgbtnUpdateInfo_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["LoginUser"] != null)
            {
                Response.Redirect("UserEditInfo.aspx");
            }
        }

        protected void imgbtnUpdateHeadPic_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.Files.Count>0)
            {
                HttpPostedFile picFile = Request.Files[0];
                Model.Picture pic = BLL.PictureBll.GetUserHeadByPicNum((Session["LoginUser"] as Model.User).UserNum);
                pic.PicturesPath = "Image/UserPic/" + DateTime.Now.ToFileTime() + picFile.FileName.Substring(picFile.FileName.LastIndexOf("."));
                if (BLL.PictureBll.UpdateHeadPic(pic)>0)
                {
                    Response.Write("<script>alert('修改成功!')</script>");
                    picFile.SaveAs(Server.MapPath(pic.PicturesPath));
                    imgLoginUserHead.ImageUrl = pic.PicturesPath;
                }
                else
                    Response.Write("<script>alert('修改失败，数据库操作错误，请联系管理员!')</script>");
            }
        }
    }
}