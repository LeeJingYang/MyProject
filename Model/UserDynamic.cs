using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserDynamic
    {
        public string UserNum { get; set; }
        public string UserName { get; set; }
        public string Hobby { get; set; }
        public string Remark { get; set; }
        public string DynamicID { get; set; }
        public string DynamicTitle { get; set; }
        public string SectionID { get; set; }
        public string SectionName { get; set; }
        public int ReplyCount { get; set; }
        public int ReadCount { get; set; }
        public string PublishDate { get; set; }
        public string PicturesPath { get; set; }
    }
}
