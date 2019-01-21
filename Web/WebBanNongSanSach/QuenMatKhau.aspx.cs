using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace WebBanNongSanSach
{
    public partial class QuenMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = XLDL.GetData("select email,matkhau from users where email=N'" + txbEmail.Text + "'");
                if(dt.Rows.Count>0)
            {
                GuiMail(dt.Rows[0][0].ToString().Trim(), dt.Rows[0][1].ToString());
                Response.Write("<script>alert('Đã gửi mật khẩu thành công qua Email của bạn. Hãy kiểm tra mail!!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Email bạn vừa nhập không tìm thấy trên hệ thống!!');</script>");
            }
        }
        protected void GuiMail(string email,string MatKhau)
        {
            SmtpClient smtp = new SmtpClient();
            try
            {
                string MailNguoiGui = "webbanrausach@gmail.com";
                string MailNguoiNhan = email;
                string ChuDe = "Yêu cầu đặt lại mật khẩu";
                string NoiDung = @"Mật khẩu của bạn là " + MatKhau + " \nHãy đăng nhập và tiến hành đổi mật khẩu tại: https://webbanrausach.azurewebsites.net/DoiMatKhau.aspx";

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
    }
}