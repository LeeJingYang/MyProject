using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                loadBirthday();
        }
        public void loadBirthday()
        {
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("UserLogin.aspx?LoginInfo=请先登录!&LastFormUrl=UserEditInfo.aspx");
                return;
            }
            for (int i = DateTime.Now.Year; i >=1900 ; i--)
                cboBirthdayYear.Items.Add(i.ToString());
            for (int i = 1; i <=12; i++)
                cboBirthdayMonth.Items.Add(i.ToString());
            for (int i = 1; i < 31; i++)
                cboBirthdayDay.Items.Add(i.ToString());
            Model.User user = Session["LoginUser"] as Model.User;
            lblUserName.Text = user.UserName;
            textUserRemark.Text = user.Remark;
            cboGender.Text = user.Gender;
            cboBirthdayYear.Text = user.Birthday.Year.ToString();
            cboBirthdayMonth.Text = user.Birthday.Month.ToString();
            cboBirthdayDay.Text = user.Birthday.Day.ToString();
            textUserQQ.Text = user.QQNumber;
            lblEmail.Text = user.Email;
            textUserHobby.Text = user.Hobby;
        }

        protected void btnSaveUserInfo_Click(object sender, EventArgs e)
        {
            Model.User user = Session["LoginUser"] as Model.User;
            user.Remark = textUserRemark.Text;
            user.Gender = cboGender.SelectedItem.Value;
            user.Birthday = DateTime.Parse(cboBirthdayYear.SelectedValue + "-" + cboBirthdayMonth.SelectedValue + "-" + cboBirthdayDay.SelectedValue);
            user.QQNumber = textUserQQ.Text;
            user.Hobby = textUserHobby.Text;
            string result = BLL.UserBll.UpdateUserInfo(user);
            Response.Write("<script>alert(" + result + ")</script>");
        }
    }
}