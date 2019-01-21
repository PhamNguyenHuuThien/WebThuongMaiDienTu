using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] != null)
                Response.Redirect("Danhsachsanpham.aspx");
            try
            {
                if (Request.QueryString["User"] != null) { 
                id_tentruycap.Value= Request.QueryString["User"];
                    if(Session["DangKyMoi"].ToString()=="OK")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Tài khoản " + id_tentruycap.Value + " đã được đăng ký thành công. Hãy đăng nhập nhé')", true);
                        Session["DangKyMoi"] = null;
                        //Response.Redirect("Dangnhap.aspx?User=" + id_tentruycap.Value);
                    }
                        
                id_matkhau.Focus();}
            }
            catch
            {
                id_tentruycap.Focus();
            }
            
        }

        protected void button_Click(object sender, EventArgs e)
        {
            try
            {
                if (XLDL.CheckSqlInjection(id_tentruycap.Value.ToString()) == true || XLDL.CheckSqlInjection(id_matkhau.Value.ToString()) == true)
                    Response.Redirect("DangNhap.aspx");
                else
                {
                    DataTable dt = XLDL.GetData("select * from Users where tendangnhap=N'" + id_tentruycap.Value.ToString() + "' and matkhau=N'" + id_matkhau.Value.ToString() + "' COLLATE SQL_Latin1_General_CP1_CS_AS");
                    if (dt.Rows.Count > 0)
                    {//đăng nhập thành công
                        string s = XLDL.GetValue("select daduyet from users where tendangnhap=N'" + id_tentruycap.Value.ToString() + "'");
                        if (s == "False")
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Tài khoản " + id_tentruycap.Value + " chưa được duyệt. Hãy liên hệ Hotline hoặc Email để được hỗ trợ.')", true);

                        }
                        else
                        {
                            Session["TenDN"] = id_tentruycap.Value.ToString();
                            //Response.Redirect(Request.RawUrl);//load lại trang hiện tại
                            Response.Redirect("Danhsachsanpham.aspx");
                        }
                    }
                    else
                    {
                        lbThongbao.Text = "<script>alert('Tên đăng nhập hoặc mật khẩu không hợp lệ!!');</script>";
                    }
                }

            }
            catch { lbThongbao.Text = "Lỗi đăng nhập!"; }
        }
    }
}