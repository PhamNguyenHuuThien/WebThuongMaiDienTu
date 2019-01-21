using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach.Admin
{

    public partial class SuaUser : System.Web.UI.Page
    {
        public static string MaUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    MaUser = Request.QueryString["MaUser"];
                    GetUsers();

                }
                catch { }

            }
        }
        protected void GetUsers()
        {
            DataTable dt = XLDL.GetData("select * from users where makh=" + MaUser);
            int i = 0;
            txbMaUser.Text = dt.Rows[0][i++].ToString();
            txbHo.Text = dt.Rows[0][i++].ToString();
            txbTen.Text = dt.Rows[0][i++].ToString();
            txbSDT.Text = dt.Rows[0][i++].ToString();
            txbCongTy.Text = dt.Rows[0][i++].ToString();
            txbDiachi.Text = dt.Rows[0][i++].ToString();
            txbTenDN.Text = dt.Rows[0][i++].ToString();
            txbMatKhau.Text = dt.Rows[0][i++].ToString();
            txbEmail.Text = dt.Rows[0][i++].ToString();

            if (dt.Rows[0][i++].ToString() == "True")
                chkQuanTri.Checked = true;
            else chkQuanTri.Checked = false;
            if (dt.Rows[0][i++].ToString() == "True")
                chkKichHoat.Checked = true;
            else chkKichHoat.Checked = false;
            i++;
            txbFaceBook.Text = dt.Rows[0][i++].ToString();
            txbViber.Text = dt.Rows[0][i++].ToString();
            txbSkype.Text = dt.Rows[0][i++].ToString();
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try { 
            string s;
            if (txbMatKhau.Text == "" || txbMatKhau.Text == null)
            {
                string Quantri, Kichhoat;
                if (chkQuanTri.Checked == true)
                    Quantri = "1";
                else
                    Quantri = "0";
                if (chkKichHoat.Checked == true)
                    Kichhoat = "1";
                else
                    Kichhoat = "0";

                s = "update users set tendangnhap=N'" + txbTenDN.Text + "', ho = N'" + txbHo.Text + "', email=N'"+txbEmail.Text+"',ten = N'" + txbTen.Text + "', sodienthoai = N'" + txbSDT.Text + "', noicongtac = N'" + txbCongTy.Text + "', diachi = N'" + txbDiachi.Text + "',facebook=N'" + txbFaceBook.Text + "',viber=N'" + txbViber.Text + "',skype=N'" + txbSkype.Text + "',laadmin=" + Quantri + ",daduyet=" + Kichhoat + " where makh = " + MaUser;
                //Response.Write(s);
                XLDL.Execute(s);
                Response.Redirect("/Admin/QuanLyNguoidung.aspx");
            }
            else
            {
                s = "update users set tendangnhap=N'" + txbTenDN.Text + "',ho = N'" + txbHo.Text + "',email=N'" + txbEmail.Text + "', ten = N'" + txbTen.Text + "', sodienthoai = N'" + txbSDT.Text + "', noicongtac = N'" + txbCongTy.Text + "', diachi = N'" + txbDiachi.Text + "',facebook=N'" + txbFaceBook.Text + "',viber=N'" + txbViber.Text + "',skype=N'" + txbSkype.Text + "',matkhau=N'" + txbMatKhau.Text + "' where makh = " + MaUser;
                //Response.Write(s);
                XLDL.Execute(s);
                Response.Redirect("/Admin/QuanLyNguoidung.aspx");
                }
            }
            catch (Exception ex){ Response.Write(ex.Message); }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string tendangnhap = XLDL.GetValue("select tendangnhap from users where makh=" + MaUser);
            if (tendangnhap == Session["TenDN"].ToString())
            {
                Response.Write("<script>alert('Bạn không thể xoá tài khoản của chính mình!!');</script>");
            }
            else
            {
                string s = "delete from users where makh=" + MaUser;
                //Response.Write(s);
                XLDL.Execute(s);
                //Response.Redirect("/Admin/QuanLyNguoidung.aspx");}
            }
        }
    }
}