using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [TableAttribute(PriKey = "PictureID", TableName = "Picture", Identitykey = "PictureID")]
    public class Picture
    {
        public Picture()
        {
        }

        public Picture(int pictureID, string picturesPath, string pictureNum,int state)
        {
            PictureID = pictureID;
            PicturesPath = picturesPath;
            PictureNum = pictureNum;
            State = state;
        }

        public int PictureID { get; set; }
        public string PicturesPath { get; set; }
        public string PictureNum { get; set; }
        public int State { get; set; }
    }
}
