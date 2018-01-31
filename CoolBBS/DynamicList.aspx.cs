using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class test11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDynamic();
        }
        public void LoadDynamic()
        {
            if (Request.QueryString["SectionID"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            string sectionID = Request.QueryString["SectionID"] as string;
            List<Model.Dynamic> dynamicList = BLL.DynamicBll.GetDynamicBySectionID(sectionID);
            Model.Section section = BLL.SectionBll.GetSectionByID(sectionID);
            lblSectioName.Text = section.SectionName;
            var list = from u in BLL.UserBll.GetUserBySectionID(sectionID)
                        join d in dynamicList
                        on u.UserNum equals d.UserNum
                        select new
                        {
                            DynamicID = d.DynamicID,
                            DynamicTitle = d.DynamicTitle,
                            UserNum = u.UserNum,
                            UserName = u.UserName,
                            ImageUrl = BLL.PictureBll.GetUserHeadByPicNum(u.UserNum).PicturesPath,
                            ReadCount = d.ReadCount,
                            PublishDate = d.PublishDate,
                            SectionID = section.SectionID,
                            SectionName = section.SectionName,
                            ReplyCount = BLL.ReplyBll.GetReplyByDynamicID(d.DynamicID).Count()
                        };
            dgDynamicList.DataSource = list.ToList();
            dgDynamicList.DataBind();
        }
    }
}