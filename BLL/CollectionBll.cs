using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CollectionBll
    {
        public static List<Model.Collection> GetCollection(string userNum, string dynamicID)
        {
            return DAL.DBHelper.DataGetMethod<Model.Collection>("and [UserNum]='" + userNum + "' and [DynamicID]='" + dynamicID + "'");
        }
        public static bool CheckIsCollect(string userNum, string dynamicID)
        {
            return GetCollection(userNum, dynamicID).Count > 0;
        }
        public static string InsertCollect(Model.Collection collection)
        {
            return DAL.DBHelper.DataAddMethod<Model.Collection>(collection) > 0 ? "已收藏!" : "操作失败，数据库操作错误，请联系管理员";
        }
        public static string CancelFollow(string userNum, string dynamicID)
        {
            if (GetCollection(userNum,dynamicID).Count>0)
            {
                return DAL.DBHelper.DataDelete<Model.Collection>(GetCollection(userNum, dynamicID)[0].CollectionID.ToString()) > 0 ? "已取消收藏!" : "操作失败，数据库操作错误，请联系管理员";
            }
            return "已收藏!";
        }
    }
}
