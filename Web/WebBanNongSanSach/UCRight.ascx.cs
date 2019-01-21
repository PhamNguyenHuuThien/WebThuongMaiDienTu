using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class UCRight : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetSanPhamBanChay();
            GetTinTuc();
            GetTags();
        }

        private void GetSanPhamBanChay()
        {
            ListBanChay.DataSource = XLDL.GetData("select top 5 * from sanpham order by NEWID()");
            ListBanChay.DataBind();
        }
        private void GetTinTuc()
        {
            ListTinTuc.DataSource = XLDL.GetData("select  * from tintuc order by ngaydang desc");
            ListTinTuc.DataBind();
        }
        private void GetTags()
        {
            ListTags.DataSource = XLDL.GetData("select * from tags");
            ListTags.DataBind();
        }
    }
}