using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblTips.Text = "";
            lblTips.Visible = false;
            if (string.IsNullOrEmpty(textusername.Text))
            {
                lblTips.Text += "请输入用户名!";
                lblTips.Visible = true;
            }
            if (string.IsNullOrEmpty(textEmail.Text))
            {
                lblTips.Text += "</br>请输入邮箱地址!";
                lblTips.Visible = true;
            }
            else if (!new Regex("^\\s*([A-Za-z0-9_-]+(\\.\\w+)*@(\\w+\\.)+\\w{2,6})\\s*$").IsMatch(textEmail.Text))
            {
                lblTips.Text += "</br>邮箱地址格式不正确!";
                lblTips.Visible = true;
            }
            if (string.IsNullOrEmpty(textLoginPwd.Text))
            {
                lblTips.Text += "</br>请输入密码!";
                lblTips.Visible = true;
            }
            else if(textLoginPwd.Text.Length<=8)
            {
                lblTips.Text += "</br>用户名不能小于8位";
                lblTips.Visible = true;
            }
            if(lblTips.Text=="")
            {
                Model.User user = new Model.User();
                user.UserNum = "user" + DateTime.Now.ToFileTime().ToString();
                user.UserName = textusername.Text;
                user.Password = textLoginPwd.Text;
                user.Email = textEmail.Text;
                user.RegTime = DateTime.Now;
                user = BLL.UserBll.UserRegister(user);
                if (user.LoginInfo != null)
                {
                    lblTips.Text = user.LoginInfo;
                    lblTips.Visible = true;
                    return;
                }
                else
                {
                    lblTips.Text = "注册成功!";
                    lblTips.Visible = true;
                }
            }
        }
    }
}