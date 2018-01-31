using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class UserFollow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFollowUser();
        }
        public void LoadFollowUser()
        {
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("UserLogin.aspx?LastFormUrl=UserCollection.aspx");
                return;
            }
            var list = from u in BLL.UserBll.GetFollowUser((Session["LoginUser"] as Model.User).UserNum)
                       select new
                       {
                           UserNum = u.UserNum,
                           UserName = u.UserName,
                           PicturesPath = BLL.PictureBll.GetUserHeadByPicNum(u.UserNum).PicturesPath
                       };
            dgUserFollow.DataSource = list;
            dgUserFollow.DataBind();
        }
    }
}