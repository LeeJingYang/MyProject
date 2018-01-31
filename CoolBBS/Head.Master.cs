using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class Head : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUserInfo();
        }
        public void LoadUserInfo()
        {
            if (!IsPostBack && Session["LoginUser"] != null)
            {
                Model.User user = Session["LoginUser"] as Model.User;
                hyLogin.Visible = false;
                hyRegister.Visible = false;
                hyShu.Visible = false;
                hyLoginUser.Text = user.UserName;
                hyLoginUser.Visible = true;
                hySetting.Visible = true;
                btnUserExit.Visible = true;
            }
        }

        protected void hyLoginUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserInfo.aspx?UserNum=" + (Session["LoginUser"] as Model.User).UserNum);
        }

        protected void btnUserExit_Click(object sender, EventArgs e)
        {
            if (Session["LoginUser"] != null)
            {
                Session["LoginUser"] = null;
                hyLogin.Visible = true;
                hyRegister.Visible = true;
                hyShu.Visible = true;
                hyLoginUser.Text ="";
                hyLoginUser.Visible = false;
                hySetting.Visible = false;
                btnUserExit.Visible = false;
            }
        }
    }
}