using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DynamicDal
    {
        public static int InsertDynamicAndPic(Model.Dynamic dynamic, List<Model.Picture> picList)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();
                try
                {
                    
                    string strSql = "insert into [Dynamic] values(@DynamicID,@DynamicTitle,@DynamicContent,@SectionID,@PublishDate,@UserNum,@ReadCount,@State)";
                    SqlParameter[] p = {new SqlParameter("@DynamicID",dynamic.DynamicID),
                                    new SqlParameter("@DynamicTitle",dynamic.DynamicTitle),
                                    new SqlParameter("@DynamicContent",dynamic.DynamicContent),
                                    new SqlParameter("@SectionID",dynamic.SectionID),
                                    new SqlParameter("@PublishDate",dynamic.PublishDate),
                                    new SqlParameter("@UserNum",dynamic.UserNum),
                                    new SqlParameter("@ReadCount",dynamic.ReadCount),
                                    new SqlParameter("@State",dynamic.State)
                    };

                    SqlCommand cmd = new SqlCommand(strSql, conn);
                    cmd.Parameters.AddRange(p);
                    cmd.Transaction = transaction;
                    cmd.ExecuteNonQuery();
                    

                    
                    foreach (Model.Picture item in picList)
                    {
                        strSql = "insert into [Picture] values(@PicturesPath,@PictureNum,@State)";
                        SqlParameter[] parameter = {new SqlParameter("@PictureNum",item.PictureNum),
                                                    new SqlParameter("@PicturesPath",item.PicturesPath),
                                                    new SqlParameter("@State",item.State)
                        };
                        cmd.CommandText = strSql;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddRange(parameter);
                        cmd.Transaction = transaction;
                        cmd.ExecuteNonQuery();
                    }
                    
                    transaction.Commit();
                    return 1;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    return 0;
                }
                finally
                { conn.Close(); }
            }
        }
    }
}
