using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DynamicBll
    {
        public static List<Model.Dynamic> GetDynamicList()
        {
            return DAL.DBHelper.DataGetMethod<Model.Dynamic>("order by [PublishDate] desc");
        }
        public static List<Model.Dynamic> GetHotDynamic()
        {
            return GetDynamicList().OrderByDescending(d => d.ReadCount).Take(10).ToList();
        }
        public static List<Model.Dynamic> GetDynamicByUserNum(String userNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.Dynamic>(" and UserNum='" + userNum + "'");
        }
        public static Model.Dynamic GetDynamicByID(String dynamicID)
        {
            if (DAL.DBHelper.DataGetMethod<Model.Dynamic>(" and [DynamicID]='" + dynamicID + "'").Count > 0)
            {
                return DAL.DBHelper.DataGetMethod<Model.Dynamic>(" and [DynamicID]='" + dynamicID + "'")[0];
            }
            else
                return null;
        }
        public static int InsertDynamicAndPic(Model.Dynamic dynamic,List<Model.Picture> picList)
        {
            return DAL.DynamicDal.InsertDynamicAndPic(dynamic, picList);
        }
        public static List<Model.Dynamic> GetUserLastPublishDate(String userNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.Dynamic>(" and UserNum='" + userNum + "' order by [PublishDate] desc");
        }
        public static List<Model.Dynamic> GetDynamicBySectionID(string sectionID)
        {
            return DAL.DBHelper.DataGetMethod<Model.Dynamic>("and [SectionID]='" + sectionID + "'");
        }
        public static List<Model.Dynamic> GetDynamicPaging(int startNum,int endNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.Dynamic>("and [SectionID] in(select [Dynamic] from(select ROW_NUMBER() over(order by [DynamicID]) as RowID,* from[Dynamic] order by [PublishDate] desc) as b where b.RowID between " + startNum+" and "+endNum+")");
        }
        public static List<Model.Dynamic> GetCollectDynamic(string userNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.Dynamic>("and [DynamicID] in(select [DynamicID] from [Collection] where [UserNum]='" + userNum + "') ");
        }
        public static int UpdateReadCount(Model.Dynamic dynamic)
        {
            dynamic.ReadCount = dynamic.ReadCount+1;
            return DAL.DBHelper.DataUpdateMethod<Model.Dynamic>(dynamic);
        }
    }
}
