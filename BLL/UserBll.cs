using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserBll
    {
        public static List<Model.User> GetUserList()
        {
            return DAL.DBHelper.DataGetMethod<Model.User>();
        }
        public static Model.User GetUserByUserNum(string userNum)
        {
            List<Model.User> user = DAL.DBHelper.DataGetMethod<Model.User>("and UserNum='"+userNum+"'");
            if (user.Count > 0)
                return user[0];
            else
                return null;
        }
        public static Model.User GetUserByWhereStr(string str)
        {
            List<Model.User> user = DAL.DBHelper.DataGetMethod<Model.User>(str);
            if (user.Count > 0)
                return user[0];
            else
                return null;
        }
        public static Model.User GetUserByUniqueProper(string properName, string properValue)
        {
            List<Model.User> user = DAL.DBHelper.DataGetMethod<Model.User>("and [" + properName + "]='" + properValue + "'");
            if (user.Count > 0)
                return user[0];
            else
                return null;
        }
        public static Model.User GetUserByDynamicID(string dynamidID)
        {
            return DAL.DBHelper.DataGetMethod<Model.User>("and [UserNum] in(select [UserNum] from [Dynamic] where [DynamicID]='" +dynamidID+ "')")[0];
        }
        public static Model.User UserRegister(Model.User user)
        {
            if (GetUserByUniqueProper("UserName", user.UserName) != null)
            {
                return new Model.User() { LoginInfo = "用户名已存在，请更换!" };
            }
            else if (GetUserByUniqueProper("Email", user.Email) != null)
            {
                return new Model.User() { LoginInfo = "邮箱已存在，请更换!" };
            }
            else
            {
                user.Password = Operation.MD5Encryption(user.Password);
                if (DAL.DBHelper.DataAddMethod<Model.User>(user) <= 0)
                    return new Model.User() { LoginInfo = "数据库操作出错，请重试!" };
                else
                    return GetUserByUniqueProper("Email", user.Email);
            }
        }
        public static Model.User UserLogin(Model.User user)
        {
            if (GetUserByUniqueProper("UserName", user.UserName) == null&& GetUserByUniqueProper("Email", user.Email) == null)
            {
                return new Model.User() { LoginInfo = "用户名/Email不存在!" };
            }
            else
            {
                user.Password = Operation.MD5Encryption(user.Password);

                if (GetUserByWhereStr("and [UserName]='" + user.UserName + "' and [Password]='" +user.Password + "'") != null ||
                    GetUserByWhereStr("and [Email]='" + user.Email + "' and [Password]='" + user.Password + "'") != null)
                { 
                    Model.User loginUser =user.UserName==null? GetUserByUniqueProper("Email", user.Email): GetUserByUniqueProper("UserName", user.UserName);
                    loginUser.LastLoginTime = DateTime.Now;
                    DAL.DBHelper.DataUpdateMethod<Model.User>(loginUser);
                    return loginUser;
                }
                else
                    return new Model.User() { LoginInfo = "密码错误!" };
            }
        }
        public static List<Model.User> GetUserBySectionID(string sectionID)
        {
            return DAL.DBHelper.DataGetMethod<Model.User>("and [UserNum] in(select UserNum from [Dynamic] where [SectionID]='" + sectionID + "')");
        }
        public static string UpdateUserInfo(Model.User user)
        {
            return DAL.DBHelper.DataUpdateMethod<Model.User>(user) > 0 ? "资料已更新!" : "更新失败，数据库操作出错，请联系管理员!";
        }
        public static List<Model.User> GetFollowUser(string userNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.User>("and [UserNum] in(select [BeUserNum] from [Follow] where [FollowUserNum]='" + userNum + "')");
        }
    }
}
