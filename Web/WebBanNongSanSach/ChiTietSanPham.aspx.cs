using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        public string MaSP, TenSP, Hinh, MoTaNgan, MoTa, MaLoai,tinhtrang,soluong,demsoluong;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (true)
            //{
            try
            {
                if (XLDL.CheckSqlInjection(Request.QueryString["MaSP"]))
                    Response.Redirect("DanhSachSanpham.aspx");
                MaSP = Request.QueryString["MaSP"];
                GetSP(MaSP);
                GetSPLienQuan(MaLoai);
            }
            catch
            {
                Response.Redirect("DanhSachSanpham.aspx");
            }
            //}



        }
        private void GetSP(string MaSP)
        {

            TenSP = XLDL.GetValue("select tensp from sanpham where masp=" + MaSP);
            Hinh = XLDL.GetValue("select HinhMinhHoa from sanpham where masp=" + MaSP);
            MoTa = XLDL.GetValue("select mota from sanpham where masp=" + MaSP);
            MoTaNgan = XLDL.GetValue("select motangan from sanpham where masp=" + MaSP);
            MaLoai = XLDL.GetValue("select MaLoai from sanpham where masp=" + MaSP);
            if (Convert.ToInt32( XLDL.GetValue("select soluongban from sanpham where masp=" + MaSP)) > 0)
                {
                tinhtrang = "Tình trạng : <b>Còn hàng</b>";
            }
            else tinhtrang = "Tình trạng : <b><span style='color:red'>Đã hết hàng</span></b>";
            if (XLDL.GetValue("select donvitinh from sanpham where masp=" + MaSP) == "kg")
            {

                soluong = "Trọng lượng: ";
                for(double i = 0.1; i <= 5.0; i+=0.1)
                {
                    dlSoluong.Items.Add(i.ToString());
                }

                //Response.Write("<script>window.onload = function() {$('#input-quantity')['0'].value='0.1'};var tamtinh=0;</script>");

                //Response.Write("<script type='text/javascript'>function ADD_num_quantity(loai) { var num = Number.parseFloat($('#input-quantity').val()).toFixed(1);if (isNaN(num)) {num = +0.1;}if (loai == '-' && num > 0.1) num-=0.1;else if (loai == '+' && num < 100000) num=num+0.1; $('#input-quantity').val(+num);}</script>");
 
            }
            else
            {

                soluong = "Số lượng: ";
                for (int i = 1; i <= 5; i++)
                {
                    dlSoluong.Items.Add(i.ToString());
                }
                //Response.Write("<script type='text/javascript'>function ADD_num_quantity(loai) {var num = $('#NoiDung_input-quantity').val();if (isNaN(num)) {num = 1;}if (loai == '-' && num > 1) num--;else if (loai == '+' && num < 100000) num++; $('#NoiDung_input-quantity').val(num);}</script>");
            }
            Gia.DataSource = XLDL.GetData("select * from sanpham where masp=" + MaSP);
            Gia.DataBind();
        }
        private int GetSPLienQuan(string MaLoai)
        {
            ListSanPham.DataSource = XLDL.GetData("select * from sanpham where MaLoai like '" + MaLoai + "%'and MaSP !=" + MaSP + "order by NEWID()");
            ListSanPham.DataBind();
            if (ListSanPham.Items.Count == 0)
                return 0;
            else return 1;
        }


        /*protected void ThemVaoGio_Click(object sender, EventArgs e)
        {
            if (Session["TenDN"] != null)
            {
                ThemSPVaoGio(MaSP);
            }
            else
                lbThongBaoDangNhap.Text = "<script>alert('Bạn chưa đăng nhập. Hãy đăng nhập nhé!');ShowHidden('id_mem_login');</script>";

        }
        protected void ThemSPVaoGio(string MaSP)
        {
            lbThongBaoDangNhap.Text = "<b>Đã thêm vào giỏ hàng của bạn!</b>";
           
                LuuVaoSession(MaSP);
        }*/
        protected void LuuVaoSession(string MaSP)
        {
            DataTable dt = XLDL.GetData("select tensp,giaban from sanpham where masp=" + MaSP);
            string TenSP = dt.Rows[0][0].ToString();
            float GiaBan = float.Parse(dt.Rows[0][1].ToString());
            int SoLuong = 1;
            ThemVaoGioHang(MaSP,TenSP, GiaBan,SoLuong);
        }
        protected void ThemVaoGioHang(string MaSP, string TenSP, float GiaBan,int SoLuong)
        {
            DataTable dt;
            if (Session["Giohang"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("GiaBan");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("ThanhTien");
            }
            else
                dt = (DataTable)Session["Giohang"];
            int dong = SPDaCoTrongGioHang(MaSP, dt);
            if (dong != -1)
            {
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + 1;
            }
            else
            {
                DataRow dr = dt.NewRow();
                dr["MaSP"] = MaSP;
                dr["TenSP"] = TenSP;
                dr["GiaBan"] = GiaBan;
                dr["SoLuong"] = SoLuong;
                dr["ThanhTien"] = GiaBan * SoLuong;
                dt.Rows.Add(dr);
            }
            Session["Giohang"] = dt;
        }
        public int SPDaCoTrongGioHang(string MaSP, DataTable dt)
        {
            int dong = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MaSP"].ToString() == MaSP)
                {
                    dong = i;
                    break;
                }
            }
            return dong;
        }


}
}