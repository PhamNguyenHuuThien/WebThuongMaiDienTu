using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach.Admin
{
    public partial class ThemTag : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            txbMaTag.Text = XLDL.GetValue("select max(id)+1 from tags");

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string s = "insert into tags values (N'" + txbTuKhoa.Text + "', N'" + txbTenTag.Text + "')";
            //Response.Write(s);
            //GetThongtin();
            XLDL.Execute(s);
            Response.Redirect("/Admin/QuanlyGiaodien.aspx");
        }
    }
}