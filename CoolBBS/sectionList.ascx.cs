using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoolBBS
{
    public partial class sectionList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SectionTypeID!=null)
            {
                Model.SectionType sectionType = BLL.SectionTypeBll.GetSectionTypeByID(SectionTypeID);
                if (sectionType!=null)
                {
                    List<Model.Section> sectionList = BLL.SectionBll.GetSectionByTypeID(sectionType.SectionTypeID);
                    lblSectionTypeName.Text = sectionType.SectionTypeName;
                    dgSectionList.DataSource = sectionList;
                    dgSectionList.DataBind();
                }
            }
        }
        public string SectionTypeID { get; set; }
    }
}