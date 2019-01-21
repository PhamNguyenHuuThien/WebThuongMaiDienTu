using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Get6SanPham();
            Get4TinTuc();
        }
        protected void Get6SanPham()
        {
            dlSanPham1.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products1' ");
            dlSanPham1.DataBind();
            dlSanPham2.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products2' ");
            dlSanPham2.DataBind();
            dlSanPham3.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products3' ");
            dlSanPham3.DataBind();
            dlSanPham4.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products4' ");
            dlSanPham4.DataBind();
            dlSanPham5.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products5' ");
            dlSanPham5.DataBind();
            dlSanPham6.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products6' ");
            dlSanPham6.DataBind();
            dlSanPham7.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products7' ");
            dlSanPham7.DataBind();
            dlSanPham8.DataSource = XLDL.GetData("select giaodien.masp,tensp,sanpham.HinhMinhHoa,giagoc,giaban,donvitinh from giaodien,sanpham where giaodien.masp=sanpham.masp and type='Products8' ");
            dlSanPham8.DataBind();

        }
        protected void Get4TinTuc()
        {
            dlTinTuc1.DataSource = XLDL.GetData("select * from tintuc where matintuc=1");
            dlTinTuc1.DataBind();
            dlTinTuc2.DataSource = XLDL.GetData("select * from tintuc where matintuc=2");
            dlTinTuc2.DataBind();
            dlTinTuc3.DataSource = XLDL.GetData("select * from tintuc where matintuc=3");
            dlTinTuc3.DataBind();
            dlTinTuc4.DataSource = XLDL.GetData("select * from tintuc where matintuc=4");
            dlTinTuc4.DataBind();
        }
    }
}