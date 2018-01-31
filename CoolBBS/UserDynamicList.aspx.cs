using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class UserDynamicList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDynamicList();
        }
        public void LoadDynamicList()
        {
            if (Session["LoginUser"] == null) {
                Response.Redirect("UserLogin.aspx?LoginInfo=请先登录!&LastFormUrl=UserDynamicList.aspx");
                return;
            }
            List<Model.Dynamic> dynamicList = BLL.DynamicBll.GetDynamicByUserNum((Session["LoginUser"] as Model.User).UserNum);
            var list = from d in dynamicList
                       select new
                       {
                           DynamicID = d.DynamicID,
                           DynamicTitle = d.DynamicTitle,
                           SectionID = d.SectionID,
                           SectionName = BLL.SectionBll.GetSectionByID(d.SectionID).SectionName,
                           ReplyCount = BLL.ReplyBll.GetReplyByDynamicID(d.DynamicID).Count,
                           ReadCount = d.ReadCount,
                           PublishDate = d.PublishDate
                       };
            dgDynamicList.DataSource = list.ToList();
            dgDynamicList.DataBind();
        }
    }
}