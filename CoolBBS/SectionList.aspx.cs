using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class SectionList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadSecionList();
        }
        public void LoadSecionList()
        {
            List<Model.SectionType> typeList = BLL.SectionTypeBll.GetSectionTypeList();
            foreach (Model.SectionType item in typeList)
            {
                sectionList sectionType = (sectionList)base.LoadControl("~/sectionList.ascx");
                sectionType.SectionTypeID = item.SectionTypeID;
                panelSectionList.Controls.Add(sectionType);
            }
        }
    }
}