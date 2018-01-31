using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

namespace CoolBBS
{
    public partial class UserInfo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUserInfo();
        }
        public void LoadUserInfo()
        {
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("UserLogin.aspx?LoginInfo=请先登录!&LastFormUrl=UserInfo.aspx");
                return;
            }
            Model.User user = Session["LoginUser"] as Model.User;
            List<Model.User> userL = new List<Model.User>() { user };
            dgUesrInfo.DataSource = userL;
            dgUesrInfo.DataBind();

            lblRegDate.Text = user.RegTime.ToString();
            List<Model.Dynamic> dynamicList = BLL.DynamicBll.GetDynamicByUserNum(user.UserNum);
            lblDynamicCount.Text = dynamicList.Count().ToString();
            lblLastVisitTime.Text = user.LastLoginTime.ToString();

            if (dynamicList.Count != 0)
            {
                lblLastPublishDate.Text = BLL.DynamicBll.GetUserLastPublishDate(user.UserNum)[0].PublishDate.ToString();
            }
        }
    }
}