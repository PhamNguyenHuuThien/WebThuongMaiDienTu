using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class UCSlider : System.Web.UI.UserControl
    {
        public string Hinh1,Hinh2,Hinh3, Mota1,Mota2,Mota3;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = XLDL.GetData("select * from giaodien where Type like 'Slider_'");

                if (dt.Rows.Count > 0)
                {
                    Hinh1 = dt.Rows[0].ItemArray[9].ToString();
                    Hinh2 = dt.Rows[1].ItemArray[9].ToString();
                    Hinh3 = dt.Rows[2].ItemArray[9].ToString();
                    Mota1 = dt.Rows[0].ItemArray[10].ToString();
                    Mota2 = dt.Rows[1].ItemArray[10].ToString();
                    Mota3 = dt.Rows[2].ItemArray[10].ToString();

                }
            }
            catch
            {
                Response.Write("Không tìm thấy CSDL");
            }
        }
       
    }
}