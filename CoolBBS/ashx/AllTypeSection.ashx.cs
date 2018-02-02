using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Web;

namespace CoolBBS.ashx
{
    /// <summary>
    /// AllTypeSection 的摘要说明
    /// </summary>
    public class AllTypeSection : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            List<Model.TypeSection> list = new List<Model.TypeSection>();
            foreach (Model.SectionType item in BLL.SectionTypeBll.GetSectionTypeList())
            {
                List<Model.Section> sectionList = BLL.SectionBll.GetSectionByTypeID(item.SectionTypeID);
                foreach (Model.Section it in sectionList)
                {
                    Model.TypeSection typeSection = new Model.TypeSection();
                    typeSection.SectionID = it.SectionID;
                    typeSection.SectionName = it.SectionName;
                    typeSection.SectionTypeName = item.SectionTypeName;
                    list.Add(typeSection);
                }
            }

            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<Model.TypeSection>));
            json.WriteObject(context.Response.OutputStream, list);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}