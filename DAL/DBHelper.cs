using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Windows.Forms;
using Model;
using System.IO;

namespace DAL
{
    public class DBHelper
    {
        //打开数据库连接
        public static string connstr = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
        public static SqlConnection conn = new SqlConnection(connstr);

        #region 打开数据库连接方法
        /// <summary>
        /// 打开数据库连接方法
        /// </summary>
        public static void Open()
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
        }
        #endregion

        #region 关闭数据库连接方法
        /// <summary>
        /// 关闭数据库连接方法
        /// </summary>
        public static void Close()
        {
            if (conn.State != ConnectionState.Closed)
            {
                conn.Close();
            }
        }
        #endregion

        #region 读取全部阅读器
        public static SqlDataReader ExecuteReader(string strsql, params SqlParameter[] p)
        {
            SqlDataReader dr = null;
            try
            {
                conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand(strsql, conn);
                cmd.Parameters.AddRange(p);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }

            return dr;
        }
        #endregion

        #region 首航首列阅读器
        public static object ExecuteScalar(string strsql, params SqlParameter[] p)
        {
            object da = null;
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strsql, conn);
                cmd.Parameters.AddRange(p);
                da = cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return da;
        }
        #endregion

        #region 执行器
        public static int ExecuteNonQuery(string strsql, params SqlParameter[] p)
        {
            int count = 0;
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strsql, conn);
                cmd.Parameters.AddRange(p);
                count = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return count;
        }
        #endregion

        /// <summary>
        /// 数据查询方法
        /// </summary>
        /// <typeparam name="T">实体类名</typeparam>
        /// <param name="tableNameOrView">表名或视图名</param>
        /// <returns></returns>
        public static List<T> DataGetMethod<T>(string whereStr = null) where T : new()
        {
            object[] obj = typeof(T).GetCustomAttributes(false);
            TableAttribute attribute = obj[0] as TableAttribute;
            string strSql = "select * from [" + attribute.TableName + "] where [State]=0 " + whereStr;
            SqlDataReader dr = ExecuteReader(strSql);

            Type type = typeof(T);
            PropertyInfo[] proList = type.GetProperties();

            List<T> tList = new List<T>();
            T model = default(T);
            if (dr != null)
            {
                while (dr.Read())
                {
                    model = new T();
                    foreach (PropertyInfo item in proList)
                    {
                        if (dr[item.Name] == DBNull.Value)
                        {
                            continue;
                        }
                        item.SetValue(model, dr[item.Name]);
                    }
                    tList.Add(model);
                }
                dr.Close();
            }
            return tList;
        }

        /// <summary>
        /// 数据添加方法
        /// </summary>
        /// <typeparam name="T">实体类名</typeparam>
        /// <param name="model">实体类对象</param>
        /// <returns></returns>
        public static int DataAddMethod<T>(T model)
        {
            Type t = typeof(T);
            PropertyInfo[] proList = t.GetProperties();
            object[] obj = typeof(T).GetCustomAttributes(false);
            TableAttribute attribute = obj[0] as TableAttribute;
            string strSql = "insert into [" + attribute.TableName + "]";
            string colums = "(";
            string parameter = "values(";
            foreach (PropertyInfo item in proList)
            {
                if (attribute.Identitykey!=null&&item.Name==attribute.Identitykey)
                {
                    continue;
                }
                if (item.GetValue(model)!=null)
                {
                    if (item.GetValue(model).GetType()==typeof(DateTime))
                    {
                        string date = (item.GetValue(model)).ToString();
                        if (date.Substring(0, 3) == "000")
                            continue;
                        parameter += "'" +date+ "',";
                        colums += "[" + item.Name + "]" + ",";
                    }
                    else { 
                        parameter += "'" + item.GetValue(model) + "',";
                        colums += "[" + item.Name + "]" + ",";
                    }
                }
            }
            colums = colums.Substring(0, colums.Length - 1)+")";
            parameter = parameter.Substring(0, parameter.Length - 1)+")";
            strSql += colums + " " + parameter;

            int count=DBHelper.ExecuteNonQuery(strSql);
            if (count > 0)
            {
                StreamWriter writer = new StreamWriter(@"C:\Users\Yang\Desktop\sql.txt", true);
                writer.WriteLine(strSql);
                writer.Flush();
                writer.Close();
            }
            return count;
        }

        /// <summary>
        /// 数据修改方法
        /// </summary>
        /// <typeparam name="T">实体类名</typeparam>
        /// <param name="model">实体类对象</param>
        /// <returns></returns>
        public static int DataUpdateMethod<T>(T model)
        {
            Type type = typeof(T);
            PropertyInfo[] p = type.GetProperties();
            TableAttribute attribute = type.GetCustomAttributes(false)[0] as TableAttribute;
            string strSql = "update [" + attribute.TableName + "] set ";
            foreach (PropertyInfo item in p)
            {
                if (item.Name == attribute.Identitykey||item.Name==attribute.PriKey)
                    continue;
                if (item.GetValue(model) != null&&item.GetValue(model).GetType() == typeof(DateTime))
                {
                    string date = (item.GetValue(model)).ToString();
                    if (date.Substring(0, 3) == "000")
                        continue;
                }
                if (item.GetValue(model)!=null)
                    strSql += "[" + item.Name + "]='" + item.GetValue(model) + "',";
            }
            string priKeyValue = p.Where(pro => pro.Name == attribute.PriKey).First().GetValue(model).ToString();
            strSql = strSql.Substring(0, strSql.Length - 1) + " where [" + attribute.PriKey + "]='" + priKeyValue + "'";
            return ExecuteNonQuery(strSql);
        }

        /// <summary>
        /// 数据删除方法(改状态)
        /// </summary>
        /// <typeparam name="T">实体类名</typeparam>
        /// <param name="priKey">主键</param>
        /// <returns></returns>
        public static int DataDelete<T>(string priKeyValue)
        {
            object[] obj = typeof(T).GetCustomAttributes(false);
            TableAttribute attribute = obj[0] as TableAttribute;
            string strSql = "delete from [" + attribute.TableName + "] where [" + attribute.PriKey + "]='" + priKeyValue + "'";
            return DBHelper.ExecuteNonQuery(strSql);
        }

        /// <summary>
        /// 将字符串进行MD5加密
        /// </summary>
        /// <param name="pwd">要进行加密的字符串</param>
        /// <returns>加密后的字符串</returns>
        public static string MD5Encryption(string str)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(str);
            bytes = md5.ComputeHash(bytes);
            return BitConverter.ToString(bytes);
        }
    }
}
