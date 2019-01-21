using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;


namespace WebBanNongSanSach
{
    public partial class Reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack) { 
            //    txbHo.Focus();}
            if(Session["TenDn"]!=null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            //try
            {
                if(txbMatKhau.Text.Length<8)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Mật khẩu phải ít nhất 8 ký tự')", true);
                }
                else
                {

                
                string str1 = @"select 1 from users where tendangnhap=N'" + txbTenTruycap.Text + "'"; ;
                if (XLDL.GetData(str1).Rows.Count > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Tên đăng nhập "+txbTenTruycap.Text+" đã tồn tại. Vui lòng sử dụng tên khác nhé!')", true);
                    txbTenTruycap.Focus();
                }
                else
                {
                        if (XLDL.CheckSqlInjection(txbHo.Text) == true || XLDL.CheckSqlInjection(txbTen.Text) == true || XLDL.CheckSqlInjection(txbSodienthoai.Text) == true || XLDL.CheckSqlInjection(txbCongty.Text) == true || XLDL.CheckSqlInjection(txbDiaChi.Text) == true || XLDL.CheckSqlInjection(txbTenTruycap.Text) == true || XLDL.CheckSqlInjection(txbMatKhau.Text) == true || XLDL.CheckSqlInjection(txbEmail.Text) == true)
                            Response.Redirect("Reg.aspx");
                    string s = "INSERT INTO [dbo].[Users]([Ho],[Ten],[SoDienThoai],[NoiCongTac],[DiaChi],[TenDangNhap],[MatKhau],[Email],[LaAdmin],[Daduyet],[ThoiGian]) VALUES( N'" + txbHo.Text.ToString() + "',N'" + txbTen.Text + "',N'" + txbSodienthoai.Text + "',N'" + txbCongty.Text + "',N'" + txbDiaChi.Text + "',N'" + txbTenTruycap.Text + "','" + txbMatKhau.Text + "',N'" + txbEmail.Text.Trim() + "',0,1,'"+ DateTime.Now.ToLocalTime() + "')";
                    XLDL.Execute(s);
                    // Response.Write(s);
                    GuiMail(txbEmail.Text);
                    Session["DangKyMoi"] = "OK";
                    Response.Redirect("Dangnhap.aspx?User=" + txbTenTruycap.Text);
                }}
            }
            //catch { ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Lỗi hệ thống !!')", true); }

            
        }
        protected void GuiMail(string email)
        {
            SmtpClient smtp = new SmtpClient();
            try
            {
                string MailNguoiGui = "webbanrausach@gmail.com";
                string MailNguoiNhan = email;
                string ChuDe = "Đã tạo tài khoản của bạn tại Web bán thực phẩm sạch";
                string NoiDung = @"Đã tạo thành công tài khoản của bạn. \nHãy đăng nhập tại: https://webbanrausach.azurewebsites.net/";

                //ĐỊA CHỈ SMTP Server
                smtp.Host = "smtp.gmail.com";
                //Cổng SMTP
                smtp.Port = 587;
                //SMTP yêu cầu mã hóa dữ liệu theo SSL
                smtp.EnableSsl = true;
                //UserName và Password của mail
                smtp.Credentials = new NetworkCredential(MailNguoiGui, "Thien@abc");

                //Tham số lần lượt là địa chỉ người gửi, người nhận, tiêu đề và nội dung thư
                smtp.Send(MailNguoiGui, MailNguoiNhan, ChuDe, NoiDung);
                //lbStatus.Text = "Sent.";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                //lbStatus.Text = ex.Message;
            }
        }
        protected void btnLamlai_Click(object sender, EventArgs e)
        {
            txbHo.Text = "";
            txbTen.Text = "";
            txbSodienthoai.Text = "";
            txbCongty.Text = "";
            txbDiaChi.Text = "";
            txbTenTruycap.Text = "";
            txbMatKhau.Text = "";
            txbEmail.Text = "";
            txbHo.Focus();
        }
    }


    }
