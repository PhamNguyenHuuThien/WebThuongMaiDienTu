using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class DanhSachSanpham : System.Web.UI.Page
    {
        public string MaLoai, tieude = "Sản phẩm";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (XLDL.CheckSqlInjection(Request.QueryString["MaLoai"]) == true)
                    Response.Redirect("DanhSachSanPham.aspx");
                else
                    MaLoai = Request.QueryString["MaLoai"];
            }
            catch { }
            if (GetTheoMaLoai(MaLoai) == 0)
                {
                    GetSanPham();
                }
                else GetTheoMaLoai(MaLoai);
                try
                {
                    GetTieuDeTrang(MaLoai);
                }
                catch { }
           
        }

        private void GetSanPham()
        {
            ListSanPham.DataSource = XLDL.GetData("select * from sanpham");
            ListSanPham.DataBind();
        }
        private int GetTheoMaLoai(string MaLoai)
        {
            ListSanPham.DataSource = XLDL.GetData("select * from sanpham where MaLoai like '" + MaLoai + "%'");
            ListSanPham.DataBind();
            if (ListSanPham.Items.Count == 0)
                return 0;
            else return 1;
        }

        private void GetTieuDeTrang(string MaLoai)
        {
            tieude = XLDL.GetValue("select tenloai from loaisanpham where maloai like '" + MaLoai + "'");
        }
    }
}