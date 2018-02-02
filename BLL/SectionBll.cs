using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SectionBll
    {
        public static List<Model.Section> GetSectionList()  
        {
            return DAL.DBHelper.DataGetMethod<Model.Section>("order by [SectionName]");
        }
        public static List<Model.Section> GetHotSection()
        {
            List<Model.Section> hotSectionList = DAL.DBHelper.DataGetMethod<Model.Section>("and [SectionID] in " +
                "(select top(10) d.SectionID from[Dynamic] d group by d.SectionID order by count(d.SectionID))");
            if (hotSectionList.Count<=0)
                hotSectionList= GetSectionList().Take(10).ToList();
            return hotSectionList;
        }
        public static Model.Section GetSectionByID(string SectionID)
        {
            List<Model.Section> list = DAL.DBHelper.DataGetMethod<Model.Section>("and [SectionID]='" + SectionID + "'");
            return list.Count>0?list[0]:null;
        }
        public static List<Model.Section> GetSectionByTypeID(string sectionTypeID)
        {
            List<Model.Section> sectionList = DAL.DBHelper.DataGetMethod<Model.Section>("and [SectionTypeID]='"+sectionTypeID+"'");
            return sectionList;
        }
        public static Model.Section GetSectionByName(string sectionName)
        {
            return DAL.DBHelper.DataGetMethod<Model.Section>("and [SectionName]='" + sectionName + "'")[0];
        }
    }
}
