using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "SectionID", TableName = "Section", Identitykey = "")]
    public class Section
    {
        public Section()
        {
        }

        public Section(string sectionID, string sectionName, string sectionTypeID, int state)
        {
            SectionID = sectionID;
            SectionName = sectionName;
            SectionTypeID = sectionTypeID;
            State = state;
        }

        public string SectionID { get; set; }
        public string SectionName { get; set; }
        public string SectionTypeID { get; set; }
        public int State { get; set; }
    }
}
