using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SectionTypeBll
    {
        public static List<Model.SectionType> GetSectionTypeList()
        {
            return DAL.DBHelper.DataGetMethod<Model.SectionType>();
        }
        public static Model.SectionType GetSectionTypeByID(string sectionTypeID)
        {
            List<Model.SectionType> list = DAL.DBHelper.DataGetMethod<Model.SectionType>("and [SectionTypeID]='" + sectionTypeID + "'");
            return list.Count>0?list[0]:null;
        }
    }
}
