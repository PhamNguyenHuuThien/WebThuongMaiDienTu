using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class TImkiem : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            try
            {
                    if (Request.QueryString["keysearch"] == "" || Request.QueryString["keysearch"] == null)
                        Response.Redirect("DanhSachSanPham.aspx");
                    if (XLDL.CheckSqlInjection(Request.QueryString["keysearch"])== true)
                        lbThongbao.Text = "Không tìm thấy sản phẩm " + Request.QueryString["keysearch"];
                    else
                        if (GetSanPham()<=0)
                    lbThongbao.Text = "Không tìm thấy sản phẩm " + Request.QueryString["keysearch"];
                
            }
            catch(Exception ex)
            {
                lbThongbao.Text = "Lỗi dữ liệu "+ ex.Message;
            }}
        }
        private int GetSanPham()
        {
            ListSanPham.DataSource = XLDL.GetData("select * from sanpham where tensp like N'%"+ Request.QueryString["keysearch"]+"%'");
            ListSanPham.DataBind();
            return ListSanPham.Items.Count;
        }
    }
}