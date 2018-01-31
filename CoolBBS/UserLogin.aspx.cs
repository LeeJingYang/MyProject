using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["LoginInfo"]!=null)
            {
                lblTips.Text = Request.QueryString["LoginInfo"] as string;
                lblTips.Visible = true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblTips.Text = "";
            lblTips.Visible = false;
            if (string.IsNullOrEmpty(textLoginName.Text))
            {
                lblTips.Text += "请输入用户名!";
                lblTips.Visible = true;
            }
            if (string.IsNullOrEmpty(textLoginPwd.Text))
            {
                lblTips.Text += "</br>请输入密码!";
                lblTips.Visible = true;
            }
            if (lblTips.Text == "")
            {
                Model.User user = new Model.User();
                user.UserName = textLoginName.Text;
                user.Email = textLoginName.Text;
                user.Password = textLoginPwd.Text;
                user = BLL.UserBll.UserLogin(user);
                if (user.LoginInfo != null)
                {
                    lblTips.Text = user.LoginInfo;
                    lblTips.Visible = true;
                    return;
                }
                else
                {
                    lblTips.Text = "登录成功!";
                    Session["LoginUser"] = user;
                    if (Request.QueryString["LastFormUrl"] != null)
                    {
                        Response.Redirect(Request.QueryString["LastFormUrl"] as string);
                    }
                    else
                        Response.Redirect("default.aspx");
                    lblTips.Visible = true;
                }
            }
        }
    }
}