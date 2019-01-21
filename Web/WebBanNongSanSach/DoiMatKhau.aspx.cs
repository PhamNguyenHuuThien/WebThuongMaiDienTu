using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
                Response.Redirect("Default.aspx");
        }

        protected void btnDoiMK_Click(object sender, EventArgs e)
        {
            if (XLDL.CheckSqlInjection(txbMatkhau.Text) || XLDL.CheckSqlInjection(txbMatkhauMoi.Text) || XLDL.CheckSqlInjection(txbNhaplaiMatkhau.Text))
                Response.Redirect("DoiMatKhau.aspx");
            if ((txbMatkhau.Text != null || txbMatkhauMoi.Text != null || txbNhaplaiMatkhau.Text != null) && XLDL.GetValue("select matkhau from users where tendangnhap=N'" + Session["TenDN"] + "'") == txbMatkhau.Text)
            {
                string s = "update users set matkhau = N'" + txbMatkhauMoi.Text + "' where tendangnhap = N'" + Session["TenDN"].ToString() + "'";
                XLDL.Execute(s);
                Response.Write("<script>alert('Mật khẩu đã được thay đổi thành công!');</script>");
            }
            else
            {
                Response.Write("<script> alert('Mật khẩu cũ bạn nhập không đúng !');</script>");
                txbMatkhau.Text = "";
                txbMatkhau.Focus();
            }
                

            //Response.Write(s);
        }
    }
}