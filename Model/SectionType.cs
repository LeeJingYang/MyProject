using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "SectionTypeID", TableName = "SectionType", Identitykey = "")]
    public class SectionType
    {
        public string SectionTypeID { get; set; }
        public string SectionTypeName { get; set; }
        public int State { get; set; }

        public SectionType()
        {
        }

        public SectionType(string sectionTypeID, string sectionTypeName, int state)
        {
            SectionTypeID = sectionTypeID;
            SectionTypeName = sectionTypeName;
            State = state;
        }
    }
}
