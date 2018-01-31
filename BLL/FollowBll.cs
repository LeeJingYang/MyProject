using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class FollowBll
    {
        public static List<Model.Follow> GetFollowByUserNum(string followUserNum, string beUserNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.Follow>("and [FollowUserNum]='" + followUserNum + "' and [BeUserNum]='" + beUserNum + "'");
        }
        public static bool CheckIsFollow(string followUserNum, string beUserNum)
        {
            return GetFollowByUserNum(followUserNum, beUserNum).Count > 0;
        }
        public static string InsertFollow(Model.Follow follow)
        {
            return DAL.DBHelper.DataAddMethod<Model.Follow>(follow) > 0 ? "已关注!" : "操作失败，数据库操作错误，请联系管理员";
        }
        public static string CancelFollow(string followUserNum, string beUserNum)
        {
            if (GetFollowByUserNum(followUserNum, beUserNum).Count > 0)
            {
                return DAL.DBHelper.DataDelete<Model.Follow>(GetFollowByUserNum(followUserNum, beUserNum)[0].FollowID.ToString()) > 0 ? "已取消关注!" : "操作失败，数据库操作错误，请联系管理员";
            }
            return "已关注!";
        }
    }
}
