using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class UserCollection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDynamic();
        }
        public void LoadDynamic()
        {
            if (Session["LoginUser"]==null)
            {
                Response.Redirect("UserLogin.aspx?LastFormUrl=UserCollection.aspx");
                return;
            }
            List<Model.Dynamic> dynamicList = BLL.DynamicBll.GetCollectDynamic((Session["LoginUser"] as Model.User).UserNum);
            var list = from d in dynamicList
                       select new
                       {
                           DynamicID = d.DynamicID,
                           DynamicTitle = d.DynamicTitle,
                           UserNum = d.UserNum,
                           UserName = BLL.UserBll.GetUserByUserNum(d.UserNum).UserName,
                           ImageUrl = BLL.PictureBll.GetUserHeadByPicNum(d.UserNum).PicturesPath,
                           ReadCount = d.ReadCount,
                           PublishDate = d.PublishDate,
                           SectionID = d.SectionID,
                           SectionName = BLL.SectionBll.GetSectionByID(d.SectionID).SectionName,
                           ReplyCount = BLL.ReplyBll.GetReplyByDynamicID(d.DynamicID).Count()
                       };
            dgDynamicList.DataSource = list.ToList();
            dgDynamicList.DataBind();
        }
    }
}