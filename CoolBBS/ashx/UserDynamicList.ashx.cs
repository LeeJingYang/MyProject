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
            //context.Response.Write("123");
            string name = context.Request["datalist"];
            List<Model.Dynamic> dynamicList = null;
            dynamicList = BLL.DynamicBll.GetDynamicByUserNum(FormInfo.otherUesrNum);
            var list = from d in dynamicList
                       select new
                       {
                           UserNum = d.UserNum,
                           UserName = BLL.UserBll.GetUserByUserNum(d.UserNum).UserName,
                           Hobby = BLL.UserBll.GetUserByUserNum(d.UserNum).Hobby,
                           Remark = BLL.UserBll.GetUserByUserNum(d.UserNum).Remark,
                           PicturesPath = BLL.PictureBll.GetUserHeadByPicNum(d.UserNum).PicturesPath,
                           DynamicID = d.DynamicID,
                           DynamicTitle = d.DynamicTitle,
                           SectionID = d.SectionID,
                           SectionName = BLL.SectionBll.GetSectionByID(d.SectionID).SectionName,
                           ReplyCount = BLL.ReplyBll.GetReplyByDynamicID(d.DynamicID).Count,
                           ReadCount = d.ReadCount,
                           PublishDate = d.PublishDate.ToString()
                       };
            List<Model.UserDynamic> dyList = new List<Model.UserDynamic>();
            foreach (var item in list)
            {
                Model.UserDynamic dy = new Model.UserDynamic();
                dy.UserNum = item.UserNum;
                dy.UserName = item.UserName;
                dy.Hobby = item.Hobby==null?null:"爱好:"+item.Hobby;
                dy.Remark = item.Remark;
                dy.PicturesPath = item.PicturesPath;
                dy.DynamicID = item.DynamicID;
                dy.DynamicTitle = item.DynamicTitle;
                dy.SectionID = item.SectionID;
                dy.SectionName = item.SectionName;
                dy.ReadCount = item.ReadCount;
                dy.ReplyCount = item.ReplyCount;
                dy.PublishDate = item.PublishDate;
                dyList.Add(dy);
            }
            DataContractJsonSerializer json = new DataContractJsonSerializer(dyList.GetType());

            json.WriteObject(context.Response.OutputStream, dyList);
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