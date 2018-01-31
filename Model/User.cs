using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "UserNum", TableName = "User", Identitykey = "")]
    public class User
    {
        public string UserNum { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public DateTime Birthday { get; set; }
        public string QQNumber { get; set; }
        public string Hobby { get; set; }
        public string LoginInfo { get; set; }
        public DateTime LastLoginTime { get; set; }
        public string Remark { get; set; }
        public DateTime RegTime { get; set; }
        public int UserRole { get; set; }
        public int State { get; set; }

        public User()
        {
        }
        
        public User(string userNum, string userName, string password, string gender, string email, DateTime birthday, string qQNumber, string hobby, string loginInfo, DateTime lastLoginTime, string remark, DateTime regTime, int userRole, int state)
        {
            UserNum = userNum;
            UserName = userName;
            Password = password;
            Gender = gender;
            Email = email;
            Birthday = birthday;
            QQNumber = qQNumber;
            Hobby = hobby;
            LoginInfo = loginInfo;
            LastLoginTime = lastLoginTime;
            Remark = remark;
            RegTime = regTime;
            UserRole = userRole;
            State = state;
        }
    }
}
