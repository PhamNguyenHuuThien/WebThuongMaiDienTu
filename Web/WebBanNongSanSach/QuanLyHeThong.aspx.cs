using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class QuanLyHeThong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["TenDN"].ToString() != null) { 
                    admintentruycap.Text = Session["TenDN"].ToString();
                    adminmatkhau.Focus();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Hãy nhập lại mật khẩu của bạn')", true);
                    }
                }

                catch
                {
                    admintentruycap.Focus();
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (XLDL.CheckSqlInjection(admintentruycap.Text) || XLDL.CheckSqlInjection(adminmatkhau.Text))
                    Response.Redirect("QuanLyHeThong.aspx");
                else
                if (Login(admintentruycap.Text, adminmatkhau.Text) == true)
                {

                    Response.Redirect("/Admin/Default.aspx");
                    //Response.Write("<script>alert('Đăng nhập thành công chuyển đến trang admin');</script>");
                    //Response.Write("test " + admintentruycap.Text + adminmatkhau.Text);


                }

                else
                { Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác. Hãy thử đăng nhập lại nhé!');</script>"); }

            }
            catch { }

        }

        protected bool Login(string Username, string Password)
        {
            //try
            {
                DataTable dt = XLDL.GetData("select matkhau from Users where tendangnhap=N'" + Username + "' COLLATE SQL_Latin1_General_CP1_CS_AS");
                // string s=dt.Rows[0][0].ToString();
                int s = String.Compare("abc", "abc", false);
                bool m= string.Equals("thien", "thien", StringComparison.CurrentCultureIgnoreCase);
                if (dt.Rows.Count > 0 && String.Compare(Password, dt.Rows[0][0].ToString(), false)==0 )
                {
                    
                    Session["TenDN"] = Username;//đăng nhập thành công
                    return true;
                }
                else
                {
                    Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không hợp lệ!!')");
                    return false;
                }
            }
            //catch
            //{ //Response.Write("<script>alert('Lỗi từ hệ thống!');</script>"); 
            //    return false;
            //}

        }
    }
}
