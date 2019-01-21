using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class Donhangcuatoi : System.Web.UI.Page
    {
        public static string MaKH;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    MaKH = XLDL.GetValue("select makh from users where tendangnhap=N'" + Session["TenDN"] + "'");

                    gvDonHang.DataSource = XLDL.GetData("select NgayDatHang,MaDonHang,TenNguoiNhan,DienThoaiNhan,NoiDung,LoaiHinhThanhToan,trigia,dagiaohang from dondathang where makh=" + MaKH);
                    gvDonHang.DataBind();
                }
                catch { Response.Redirect("DangNhap.aspx"); }
                try
                {
                    if (Request.QueryString["MaDH"] != null)
                    {
                        gvDonHang.Visible = false;

                        gvChitietdonhang.DataSource = XLDL.GetData("select MaDonHang,TenSP,SoLuong,donvitinh, DonGia,soluong,thanhtien from ChiTietDonDatHang,SanPham where ChiTietDonDatHang.MaSP=SanPham.MaSP and madonhang=" + Request.QueryString["MaDH"]);
                        gvChitietdonhang.DataBind();
                        if (gvChitietdonhang.Rows.Count == 0)
                            gvDonHang.Visible = true;
                        lblHuongdan.Visible = true;
                    }
                    else { gvDonHang.Visible = true; }

                }
                catch
                {
                    gvDonHang.Visible = true;

                }
                if (gvDonHang.Visible == true)
                {
                    lblHuongdan.Visible = true;
                    lbtnBack.Visible = false;
                }

                else
                {
                    lbtnBack.Visible = true;
                    lblHuongdan.Visible = false;
                }
                PNTraCuu.Visible = gvDonHang.Visible;
            }
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Donhangcuatoi.aspx");
        }

        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (XLDL.CheckSqlInjection(txbTraCuu.Text))
                    Response.Redirect("Donhangcuatoi.aspx");
                gvChitietdonhang.Visible = false;
                if (txbTraCuu.Text != null)
                {
                    gvDonHang.DataSource = XLDL.GetData("select NgayDatHang,MaDonHang,TenNguoiNhan,DienThoaiNhan,NoiDung,LoaiHinhThanhToan,trigia,dagiaohang from dondathang where makh=" + MaKH + " and madonhang=" + txbTraCuu.Text);
                    gvDonHang.DataBind();
                    if(gvDonHang.Rows.Count>0)
                    {
                        lblHuongdan.Visible = true;
                        lbtnBack.Visible = true;
                    }
                    else lblHuongdan.Visible = false;


                }
                else { }
            }
            catch { }
        }

  
    }
}