using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey ="DynamicID",TableName ="Dynamic",Identitykey ="")]
    public class Dynamic
    {
        public Dynamic()
        {
        }

        public Dynamic(string dynamicID, string dynamicTitle, string dynamicContent, string sectionID, DateTime publishDate, string userNum, int readCount, int state)
        {
            DynamicID = dynamicID;
            DynamicTitle = dynamicTitle;
            DynamicContent = dynamicContent;
            SectionID = sectionID;
            PublishDate = publishDate;
            UserNum = userNum;
            ReadCount = readCount;
            State = state;
        }

        public string DynamicID { get; set; }
        public string DynamicTitle { get; set; }
        public string DynamicContent { get; set; }
        public string SectionID { get; set; }
        public DateTime PublishDate { get; set; }
        public string UserNum { get; set; }
        public int ReadCount { get; set; }
        public int State { get; set; }
    }
}
