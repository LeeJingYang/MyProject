using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization.Json;
using System.Web.SessionState;
namespace CoolBBS.ashx
{
    /// <summary>
    /// UserDynamicList 的摘要说明
    /// </summary>
    public class UserDynamicList : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["UserNum"]!=null)
            {
                FormInfo.UserNum = context.Request["UserNum"];
            }
            if (context.Request["index"] == "1")
            {
                if (FormInfo.UserNum.Length == 22)
                {
                    context.Response.Write("请先登录!");
                }
                else if (FormInfo.UserNum.Length == 44)
                {
                    string result=UserFollow(FormInfo.UserNum.Substring(0, 22), FormInfo.UserNum.Substring(22));
                    context.Response.Write(result);
                }
            }
            else if (context.Request["UserNum"] != null)
            {
                string otheruserNum = FormInfo.UserNum.Substring(0, 22);
                List<Model.Dynamic> dynamicList = null;
                dynamicList = BLL.DynamicBll.GetDynamicByUserNum(otheruserNum);
                List<Model.UserDynamic> dyList = new List<Model.UserDynamic>();
                foreach (Model.Dynamic item in dynamicList)
                {
                    Model.UserDynamic dy = new Model.UserDynamic();
                    dy.UserNum = item.UserNum;
                    dy.UserName = BLL.UserBll.GetUserByUserNum(item.UserNum).UserName;
                    dy.Hobby = BLL.UserBll.GetUserByUserNum(item.UserNum).Hobby == null ? null : "爱好:" + BLL.UserBll.GetUserByUserNum(item.UserNum).Hobby;
                    dy.Remark = BLL.UserBll.GetUserByUserNum(item.UserNum).Remark;
                    dy.PicturesPath = BLL.PictureBll.GetUserHeadByPicNum(item.UserNum).PicturesPath;
                    dy.DynamicID = item.DynamicID;
                    dy.DynamicTitle = item.DynamicTitle;
                    dy.SectionID = item.SectionID;
                    dy.SectionName = BLL.SectionBll.GetSectionByID(item.SectionID).SectionName;
                    dy.ReadCount = item.ReadCount;
                    dy.ReplyCount = BLL.ReplyBll.GetReplyByDynamicID(item.DynamicID).Count;
                    dy.PublishDate = item.PublishDate.ToString();
                    dyList.Add(dy);
                }
                DataContractJsonSerializer json = new DataContractJsonSerializer(dyList.GetType());
                json.WriteObject(context.Response.OutputStream, dyList);
            }

        }
        public string UserFollow(string myUserNum,string otherUserNum)
        {
            Model.Follow follow = new Model.Follow();
            follow.FollowUserNum = myUserNum;
            follow.BeUserNum = otherUserNum;
            return BLL.FollowBll.InsertFollow(follow);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}