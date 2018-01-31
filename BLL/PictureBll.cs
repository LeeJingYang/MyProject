using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PictureBll
    {
        public static List<Model.Picture> GetPictureList()
        {
            return DAL.DBHelper.DataGetMethod<Model.Picture>();
        }
        public static Model.Picture GetUserHeadByPicNum(string picNum)
        {
            return DAL.DBHelper.DataGetMethod<Model.Picture>("and PictureNum='"+picNum+"'")[0];
        }
        public static List<Model.Picture> GetPictureByDynamicID(string dynamicID)
        {
            return DAL.DBHelper.DataGetMethod<Model.Picture>("and PictureNum='" + dynamicID + "'");
        }
        public static int UpdateHeadPic(Model.Picture pic)
        {
            return DAL.DBHelper.DataUpdateMethod<Model.Picture>(pic);
        }
    }
}
