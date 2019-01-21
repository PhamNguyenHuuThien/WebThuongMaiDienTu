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
    public partial class DatMua : System.Web.UI.Page
    {
        public static string sumTien;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TenDN"] != null)
                {
                    LoadGioHang();
                    LoadThongTin();
                }
                else
                    Response.Redirect("/Cart.aspx");
            }

        }
        public void LoadGioHang()
        {
            DataTable dt = (DataTable)Session["Giohang"];
            System.Decimal TongThanhTien = 0;
            foreach (DataRow r in dt.Rows)
            {
                r["ThanhTien"] = Convert.ToDouble(r["SoLuong"]) * Convert.ToDouble(r["GiaBan"]);
                TongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
                lbTongThanhTien.Text = String.Format("{0:#,# VNĐ}", TongThanhTien);
            }
            sumTien = TongThanhTien.ToString();
            GVGioHang.DataSource = dt;
            GVGioHang.DataBind();
        }
        protected void LoadThongTin()
        {
            DataTable dt = XLDL.GetData("select * from users where tendangnhap=N'" + Session["TenDN"] + "'");
            int i = 1;
            txbHo.Text = dt.Rows[0][i++].ToString();
            txbTen.Text = dt.Rows[0][i++].ToString();
            txbDienThoai.Text = dt.Rows[0][i++].ToString();
            txbCongty.Text = dt.Rows[0][i++].ToString();
            txbDiaChi.Text = dt.Rows[0][i++].ToString();
            i++; i++;
            txbEmail.Text = dt.Rows[0][i++].ToString();


        }

        protected void lbtnThanhToan_Click(object sender, EventArgs e)
        {
            string MaKH = XLDL.GetValue("select makh from users where tendangnhap=N'" + Session["TenDN"] + "'");
            if (Convert.ToInt32(sumTien) < 10000 && HinhThuc.SelectedValue.ToString() == "1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Để thanh toán online số tiền cần lớn hơn 10 000 VNĐ')", true);
            }
            else
            {
                if (XLDL.CheckSqlInjection(sumTien) || XLDL.CheckSqlInjection(txbHo.Text) || XLDL.CheckSqlInjection(txbTen.Text) || XLDL.CheckSqlInjection(txbDienThoai.Text) || XLDL.CheckSqlInjection(txbFax.Text))
                    Response.Redirect("DatMua.aspx");
                string s = "INSERT INTO[dbo].[DonDatHang] ([MaKH],[NgayDatHang],[TriGia],[TenNguoiNhan],[DienThoaiNhan],[Fax],[NoiDung],[LoaiHinhThanhToan],[DaGiaoHang]) VALUES('" + MaKH + "','" + DateTime.Now.ToLocalTime() + "'," + sumTien + ",N'" + txbHo.Text + " " + txbTen.Text + "','" + txbDienThoai.Text + "',N'" + txbFax.Text + "',N'" + txbNoiDung.Text + "', " + HinhThuc.SelectedValue.ToString() + ",0)";
                XLDL.Execute(s);
                string MaDH = XLDL.GetValue("select max(madonhang) from dondathang where makh=" + MaKH);
                if (HinhThuc.SelectedValue.ToString() == "0")
                {
                    LuuVaoCSDL(MaDH);
                    GuiMail(MaKH,MaDH);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Đặt hàng thành công. Hãy kiểm tra tại Trang cá nhân => Đơn hàng của tôi. !!')", true);
                    Session["Giohang"] = null;
                    Response.Redirect("ThanhCong.aspx?MaDH=" + MaDH);
                }
                

                if (HinhThuc.SelectedValue.ToString() == "1")
                {

                    LuuVaoCSDL(MaDH);
                    GuiMail(MaKH, MaDH);
                    string URLSucess = "https://webbannongsansach.azurewebsites.net/ThanhCong.aspx";
                    string URLFailed = "https://webbannongsansach.azurewebsites.net/ThatBai.aspx";
                    BaoKimPayment bk = new BaoKimPayment();
                    string URLThanhToan = bk.createRequestUrl("Đơn hàng "+MaDH, SessionKey.Business, sumTien, "0", "0", txbNoiDung.Text, URLSucess, URLFailed, "");
                    Session["Giohang"] = null;
                    Response.Redirect(URLThanhToan);

                }
                Session["Giohang"] = null;
            }
        }
        protected void LuuVaoCSDL(string MaDH)
        {
            DataTable dt = (DataTable)Session["Giohang"];
            string MaSP, SoLuong, DonGia;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                MaSP = dt.Rows[i][0].ToString();
                SoLuong = dt.Rows[i][4].ToString();
                DonGia = dt.Rows[i][2].ToString();
                string s = "INSERT INTO[dbo].[ChiTietDonDatHang] ([MaDonHang],[MaSP],[SoLuong],[DonGia],[ThanhTien]) VALUES (" + MaDH + "," + MaSP + "," + SoLuong + "," + DonGia + "," + Convert.ToDouble(SoLuong) * Convert.ToDouble(DonGia) + ")";
                XLDL.Execute(s);
            }
        }
        protected void GuiMail(string MaKH,string MaDH)
        {
            SmtpClient smtp = new SmtpClient();
            try
            {
                string MailNguoiGui="webbanrausach@gmail.com";
                string MailNguoiNhan=XLDL.GetValue("select email from users where MaKH="+MaKH).Trim();
                string TriGia = XLDL.GetValue("select trigia from dondathang where madonhang=" + MaDH);
                string ChuDe="#"+MaDH+"| Đơn hàng của bạn đã được đặt thành công";
                string NoiDung = @"Đơn hàng của bạn đã được đặt thành công với số tiền "+ lbTongThanhTien.Text + ". \nHãy xem chi tiết đơn hàng của bạn tại: https://webbanrausach.azurewebsites.net/Donhangcuatoi.aspx?MaDH=" + MaDH;

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
