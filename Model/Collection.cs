using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "CollectionID", TableName = "Collection", Identitykey = "CollectionID")]
    public class Collection
    {
        public Collection()
        {
        }

        public Collection(int collectionID, string userNum, string dynamicID,int state)
        {
            CollectionID = collectionID;
            UserNum = userNum;
            DynamicID = dynamicID;
            State = state;
        }

        public int CollectionID { get; set; }
        public string UserNum { get; set; }
        public string DynamicID { get; set; }
        public int State { get; set; }
    }
}
