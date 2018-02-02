using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class TypeSection
    {
        public string SectionTypeName { get; set; }
        public string SectionID { get; set; }
        public string SectionName { get; set; }

        public TypeSection()
        {
        }
        public TypeSection(string sectionTypeName, string sectionID, string sectionName)
        {
            SectionTypeName = sectionTypeName;
            SectionID = sectionID;
            SectionName = sectionName;
        }

    }
}
