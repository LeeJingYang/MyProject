using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ReplyBll
    {
        public static List<Model.Reply> GetReplyList()
        {
            return DAL.DBHelper.DataGetMethod<Model.Reply>();
        }
        public static List<Model.Reply> GetReplyByDynamicID(string dynamicID)
        {
            return DAL.DBHelper.DataGetMethod<Model.Reply>(" and DynamicID='" + dynamicID + "'");
        }
        public static int InsertReply(Model.Reply reply)
        {
            //return DAL.DBHelper.DataAddMethod<Model.Reply>(reply) > 0 ? "回复成功!" : "回复失败，数据操作错误，请联系管理员!";
            return DAL.DBHelper.DataAddMethod<Model.Reply>(reply);
        }
    }
}
