using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "ReplyID", TableName = "Reply", Identitykey = "")]
    public class Reply
    {
        public Reply()
        {
        }

        public Reply(string replyID, string replyContent, DateTime publishDate, string dynamicID, string userNum,int state)
        {
            ReplyID = replyID;
            ReplyContent = replyContent;
            PublishDate = publishDate;
            DynamicID = dynamicID;
            UserNum = userNum;
            State = state;
        }

        public string ReplyID { get; set; }
        public string ReplyContent { get; set; }
        public DateTime PublishDate { get; set; }
        public string DynamicID { get; set; }
        public string UserNum { get; set; }
        public int State { get; set; }
    }
}
