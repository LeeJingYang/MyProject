using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class DynamicInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgVerCode.ImageUrl = "ImageCode.aspx";
            LoadDynamicInfo();
            LoadReply();
            if (Session["LoginUser"] != null)
            {
                Panel1.Visible = true;
                btnToLogin.Visible = false;
                Model.User loginUser = Session["LoginUser"] as Model.User;
                lblUserName.Text = loginUser.UserName;
                lblUserRemark.Text = loginUser.Remark;
                imgUesrHeadPic.ImageUrl = BLL.PictureBll.GetUserHeadByPicNum(loginUser.UserNum).PicturesPath;
            }
        }

        protected void btnAddNewReply_Click(object sender, EventArgs e)
        {
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("UserLogin.aspx?LoginInfo=您要先登录才能回复帖子！&LastFormUrl=" + Request.Path+"?DynamicID="+Request.QueryString["DynamicID"]as string);
                return;
            }
            if (string.IsNullOrEmpty(textReplyContent.Text))
            {
                Response.Write("<script>alert('请输入回复内容！')</script>");
                textReplyContent.Focus();
                return;
            }
            if (string.IsNullOrEmpty(textReplyContent.Text))
            {
                Response.Write("<script>alert('回复内容不能少于6位！')</script>");
                textReplyContent.Focus();
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
            Model.Reply reply = new Model.Reply();
            reply.ReplyID = "reply" + DateTime.Now.ToFileTime();
            reply.ReplyContent = textReplyContent.Text;
            reply.PublishDate = DateTime.Now;
            reply.DynamicID = Request.QueryString["DynamicID"] as string;
            reply.UserNum = (Session["LoginUser"] as Model.User).UserNum;
            if (BLL.ReplyBll.InsertReply(reply) > 0)
            {
                Response.Write("<script>alert('回复成功！')</script>");
                LoadReply();
            }
            else
            {
                Response.Write("<script>alert('回复失败，数据操作错误，请联系管理员!！')</script>");
            }
        }

        public void LoadDynamicInfo()
        {
            if (Request.QueryString["DynamicID"] == null)
                return;
            Model.Dynamic dynamic = BLL.DynamicBll.GetDynamicByID(Request.QueryString["DynamicID"] as string);
            if (dynamic==null)
            {
                return;
            }
            Model.User user = BLL.UserBll.GetUserByUserNum(dynamic.UserNum);
            if (Session["LoginUser"] != null && BLL.FollowBll.CheckIsFollow((Session["LoginUser"] as Model.User).UserNum, dynamic.UserNum))
                btnFollow.Text = "已关注";
            if (Session["LoginUser"] != null && BLL.CollectionBll.CheckIsCollect((Session["LoginUser"] as Model.User).UserNum, dynamic.DynamicID))
                btnCollect.Text = "已收藏";
            if (Session["LoginUser"] != null && (Session["LoginUser"] as Model.User).UserNum == user.UserNum)
                btnFollow.Visible = false;
            Model.Picture userPic = BLL.PictureBll.GetUserHeadByPicNum(user.UserNum);
            List<Model.Picture> dynamicPic = BLL.PictureBll.GetPictureByDynamicID(dynamic.DynamicID);
            lblPublisherName.Text = user.UserName;
            imgPublishUserHead.ImageUrl = BLL.PictureBll.GetUserHeadByPicNum(user.UserNum).PicturesPath;
            lblUserRemark.Text = user.Remark;
            lblPublishDate.Text = dynamic.PublishDate.ToString() ;
            lblDynamicTitle.Text = dynamic.DynamicTitle;
            lblDynamicContent.Text ="   "+ dynamic.DynamicContent;
            foreach (Model.Picture item in dynamicPic)
            {
                item.PicturesPath = "Image/UploadImg/" + item.PicturesPath;
            }
            dgPics.DataSource = dynamicPic;
            dgPics.DataBind();
            BLL.DynamicBll.UpdateReadCount(dynamic);
        }
        
        public void LoadReply()
        {
            if (Request.QueryString["DynamicID"]==null)
            {
                return;
            }
            Model.Dynamic dynamic = BLL.DynamicBll.GetDynamicByID(Request.QueryString["DynamicID"]);
            var list = from r in BLL.ReplyBll.GetReplyByDynamicID(dynamic.DynamicID)
                       join u in BLL.UserBll.GetUserList()
                       on r.UserNum equals u.UserNum
                       join p in BLL.PictureBll.GetPictureList()
                       on u.UserNum equals p.PictureNum
                       select new
                       {
                           UserNum = u.UserNum,
                           UserName = u.UserName,
                           Remark = u.Remark,
                           PicturesPath = p.PicturesPath,
                           ReplyContent = r.ReplyContent,
                           PublishDate = r.PublishDate
                       };
            dgReplyList.DataSource = list.ToList();
            dgReplyList.DataBind();
        }

        protected void btnToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx?LoginInfo=您要先登录才能回复帖子！&LastFormUrl=" + Request.Path + "?DynamicID=" + Request.QueryString["DynamicID"] as string);
        }

        protected void lblPublisherName_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserInfo.aspx?UserNum="+BLL.DynamicBll.GetDynamicByID(Request.QueryString["DynamicID"]).UserNum);
        }

        protected void imgPublishUserHead_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("UserInfo.aspx?UserNum=" + BLL.DynamicBll.GetDynamicByID(Request.QueryString["DynamicID"]).UserNum);
        }

        protected void btnCollect_Click(object sender, EventArgs e)
        {
            if (Session["LoginUser"]==null)
            {
                Response.Redirect("UserLogin.aspx?LoginInfo=请先登录!&LastFormUrl=DynamicInfo.aspx?DynamicID=" + Request.QueryString["DynamicID"]);
                return;
            }
            Model.Collection collection = new Model.Collection();
            collection.UserNum = (Session["LoginUser"] as Model.User).UserNum;
            collection.DynamicID = Request.QueryString["DynamicID"];
            if (btnCollect.Text == "收藏")
            {
                string result = BLL.CollectionBll.InsertCollect(collection);
                btnCollect.Text = "已收藏";
                Response.Write("<script>alert('" + result + "')</script>");
                return;
            }
            string result2 = BLL.CollectionBll.CancelFollow(collection.UserNum, collection.DynamicID);
            btnCollect.Text = "收藏";
            Response.Write("<script>alert(" + result2 + ")</script>");
        }

        protected void btnFollow_Click(object sender, EventArgs e)
        {
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("UserLogin.aspx?LoginInfo=请先登录!&LastFormUrl=DynamicInfo.aspx?DynamicID=" + Request.QueryString["DynamicID"]);
                return;
            }
            Model.Follow follow = new Model.Follow();
            follow.FollowUserNum = (Session["LoginUser"] as Model.User).UserNum;
            follow.BeUserNum = BLL.UserBll.GetUserByDynamicID(Request.QueryString["DynamicID"]).UserNum;
            if (btnFollow.Text == "关注")
            {
                string result = BLL.FollowBll.InsertFollow(follow);
                btnFollow.Text = "已关注";
                Response.Write("<script>alert('" + result + "')</script>");
                return;
            }
            string result2 = BLL.FollowBll.CancelFollow(follow.FollowUserNum, follow.BeUserNum);
            btnFollow.Text = "关注";
            Response.Write("<script>alert('" + result2 + "')</script>");
        }
    }
}