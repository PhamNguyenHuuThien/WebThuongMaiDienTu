using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class LuuGioHang : System.Web.UI.Page
    {
        public string MaSP;
        public double soluong;
        protected void Page_Load(object sender, EventArgs e)
        {
            MaSP=Request.QueryString["MaSP"];
            soluong = Convert.ToDouble(Request.QueryString["SoLuong"]);
            
            DataTable dt = XLDL.GetData("select tensp,giaban,donvitinh,hinhminhhoa from sanpham where masp=" + MaSP);
            string TenSP = dt.Rows[0][0].ToString();
            float GiaBan = float.Parse(dt.Rows[0][1].ToString());
            string Donvitinh = dt.Rows[0][2].ToString();
            string Hinhminhhoa = dt.Rows[0][3].ToString();
            if (soluong > 0)
            {
                //Response.Write(MaSP + TenSP + GiaBan + soluong);
                ThemVaoGioHang(MaSP, TenSP, GiaBan, soluong,Donvitinh,Hinhminhhoa);
                //Response.Write("Đã thêm sản phẩm " + TenSP + " với số lượng: " + soluong + " vào giỏ hàng");
                Response.Redirect("/ChiTietSanPham.aspx?MaSP=" + MaSP);
            }
            else { }
                //Response.Redirect("/ChiTietSanPham.aspx?MaSP=" + MaSP);
        }
        protected void ThemVaoGioHang(string MaSP, string TenSP, float GiaBan, double SoLuong,string Donvitinh,string Hinhminhoa)
        {
            DataTable dt;
            if (Session["Giohang"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("GiaBan");
                dt.Columns.Add("DVT");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("ThanhTien");
                dt.Columns.Add("HinhMinhHoa");
            }
            else
                dt = (DataTable)Session["Giohang"];
            int dong = SPDaCoTrongGioHang(MaSP, dt);
            if (dong != -1)
            {
                dt.Rows[dong]["SoLuong"] = Convert.ToDouble(dt.Rows[dong]["SoLuong"]) + SoLuong;
            }
            else
            {
                DataRow dr = dt.NewRow();
                dr["MaSP"] = MaSP;
                dr["TenSP"] = TenSP;
                dr["GiaBan"] = GiaBan;
                dr["DVT"] = Donvitinh;
                dr["SoLuong"] = SoLuong;
                dr["ThanhTien"] = GiaBan * SoLuong;
                dr["HinhMinhHoa"] = Hinhminhoa;
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