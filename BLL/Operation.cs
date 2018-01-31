using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Operation
    {
        /// <summary>
        /// 方法:将字符串进行MD5加密
        /// </summary>
        /// <param name="pwd">要进行加密的字符串</param>
        /// <returns>加密后的字符串</returns>
        public static string MD5Encryption(string pwd)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(pwd);
            bytes = md5.ComputeHash(bytes);
            return BitConverter.ToString(bytes);
        }
    }
}
