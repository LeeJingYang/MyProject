using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "FollowID", TableName = "Follow", Identitykey = "FollowID")]
    public class Follow
    {
        public Follow()
        {
        }

        public Follow(int followID, string followUserNum, string beUserNum,int state)
        {
            FollowID = followID;
            FollowUserNum = followUserNum;
            BeUserNum = beUserNum;
            State = state;
        }

        public int FollowID { get; set; }
        public string FollowUserNum { get; set; }
        public string BeUserNum { get; set; }
        public int State { get; set; }
    }
}
