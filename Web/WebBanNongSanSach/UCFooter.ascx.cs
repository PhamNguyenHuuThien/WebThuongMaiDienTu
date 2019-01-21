using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class UCFooter : System.Web.UI.UserControl
    {
        public string SDT, Email,Diachi;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = XLDL.GetData("select * from giaodien where type='info'");
                if (dt.Rows.Count > 0)
                {
                    SDT = dt.Rows[0].ItemArray[4].ToString();
                    Email = dt.Rows[0].ItemArray[5].ToString();
                    Diachi = dt.Rows[0].ItemArray[6].ToString();
                }
            }
            catch
            {
                Response.Write("Không tìm thấy CSDL");
            }
        }
    }
}