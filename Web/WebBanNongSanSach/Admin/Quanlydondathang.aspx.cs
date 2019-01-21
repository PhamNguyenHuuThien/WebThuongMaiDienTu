using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach.Admin
{
    public partial class Quanlydondathang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            if (Request.QueryString["MaDH"] != null)
            {
                gvDanhSachDonHang.Visible = false;
                gvChitietDonHang.DataSource = XLDL.GetData("select MaDonHang,TenSP,SoLuong,donvitinh, DonGia,soluong,thanhtien from ChiTietDonDatHang,SanPham where ChiTietDonDatHang.MaSP=SanPham.MaSP and madonhang=" + Request.QueryString["MaDH"]);
                gvChitietDonHang.DataBind();
                gvChitietDonHang.Visible = true;
            }
            else
            {
                gvDanhSachDonHang.Visible = true;
                GetDSDonHang();
                gvChitietDonHang.Visible = false;
            }

            PNTraCuu.Visible = !gvChitietDonHang.Visible;}
        }
        protected void GetDSDonHang()
        {
            lbtnBack.Visible = false;
            gvDanhSachDonHang.DataSource= XLDL.GetData("select NgayDatHang,MaDonHang,TenNguoiNhan,DienThoaiNhan,NoiDung,LoaiHinhThanhToan,trigia,dagiaohang from dondathang order by ngaydathang desc");
            gvDanhSachDonHang.DataBind();
        }
        protected void GetChitietDonHang()
        {
            lbtnBack.Visible = true;
            gvChitietDonHang.DataSource= XLDL.GetData("select MaDonHang,TenSP,SoLuong,donvitinh, DonGia,soluong,thanhtien from ChiTietDonDatHang,SanPham where ChiTietDonDatHang.MaSP=SanPham.MaSP and madonhang=" + Request.QueryString["MaDH"]);
            gvChitietDonHang.DataBind();
        }

        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (txbTraCuu.Text != null)
                {
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "0")
                        gvDanhSachDonHang.DataSource = XLDL.GetData("select NgayDatHang,MaDonHang,TenNguoiNhan,DienThoaiNhan,NoiDung,LoaiHinhThanhToan,trigia,dagiaohang from dondathang where madonhang=" + txbTraCuu.Text);
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "1")
                        gvDanhSachDonHang.DataSource = XLDL.GetData("select NgayDatHang,MaDonHang,TenNguoiNhan,DienThoaiNhan,NoiDung,LoaiHinhThanhToan,trigia,dagiaohang from dondathang,users where users.makh=dondathang.makh and ho+ten like N'%" + txbTraCuu.Text + "%'");
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "2")
                        gvDanhSachDonHang.DataSource = XLDL.GetData("select NgayDatHang,MaDonHang,TenNguoiNhan,DienThoaiNhan,NoiDung,LoaiHinhThanhToan,trigia,dagiaohang from dondathang,users where users.makh=dondathang.makh and sodienthoai like N'%" + txbTraCuu.Text + "%'");
                    gvDanhSachDonHang.DataBind();
                }
                else { lblThongbao.Text = "Không tìm thấy !!"; }
            }
            catch { }
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Quanlydondathang.aspx");
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow r in gvDanhSachDonHang.Rows)
            {
                string MaDH = gvDanhSachDonHang.DataKeys[r.DataItemIndex].Value.ToString();
                CheckBox chk = (CheckBox)r.Cells[7].FindControl("chkDaGiao");
                int bit=0;
                if (chk.Checked == true)
                    bit = 1;
                XLDL.Execute("update dondathang set dagiaohang=" + bit + " where madonhang=" + MaDH);
            }
            GetDSDonHang();
        }
    }
}