using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

namespace CoolBBS
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDynamic();
        }
        public void LoadDynamic()
        {
            List<Model.Dynamic> dynamicList = null;
            if (Request.QueryString["QueryAll"] != null)
                dynamicList = BLL.DynamicBll.GetDynamicList();
            else
                dynamicList = BLL.DynamicBll.GetHotDynamic();
            int pageNum = int.Parse(lblPageNum.Text);
            if (pageNum == 0)
                lblPageNum.Text = 1.ToString();
            else if (pageNum == dynamicList.Count / 10 + 1)
            {
                if (dynamicList.Count % 10 > 0)
                    lblPageNum.Text = ((dynamicList.Count / 10) + 1).ToString();
                else
                    lblPageNum.Text = (dynamicList.Count / 10).ToString();
            }
            dynamicList = dynamicList.Skip((int.Parse(lblPageNum.Text) - 1) * 10).Take(int.Parse(lblPageNum.Text) * 10).ToList();
            var list = from d in dynamicList
                       select new
                       {
                           DynamicID = d.DynamicID,
                           DynamicTitle = d.DynamicTitle,
                           UserNum = d.UserNum,
                           MyUserNum = Session["LoginUser"] == null ? "" : (Session["LoginUser"] as Model.User).UserNum,
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

        protected void btnFrontPage_Click(object sender, EventArgs e)
        {
            lblPageNum.Text = (int.Parse(lblPageNum.Text) - 1).ToString();
            LoadDynamic();
        }

        protected void btnNextPage_Click(object sender, EventArgs e)
        {
            lblPageNum.Text = (int.Parse(lblPageNum.Text) + 1).ToString();
            LoadDynamic();
        }

        protected void btnToPage_Click(object sender, EventArgs e)
        {
            lblPageNum.Text = textToPage.Text;
            LoadDynamic();
        }

        protected void btnToLastPage_Click(object sender, EventArgs e)
        {
            LoadDynamic();
        }

        protected void dgDynamicList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //if (e.CommandName=="toOtherUserInfo")
            //{
                Response.Write("<script>alert('GGG');</script>");
            //}
        }
    }
}