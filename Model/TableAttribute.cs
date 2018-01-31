using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [AttributeUsage(AttributeTargets.Class)]
    public class TableAttribute : Attribute
    {
        public string PriKey { get; set; }
        public string Identitykey { get; set; }
        public string TableName { get; set; }
        public TableAttribute()
        {

        }
        public TableAttribute(string priKey, string identitykey, string tableName)
        {
            this.PriKey = priKey;
            this.Identitykey = identitykey;
            this.TableName = TableName;
        }
    }
}
