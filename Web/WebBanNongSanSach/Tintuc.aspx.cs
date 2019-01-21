using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class Tintuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                if (Request.QueryString["MaTinTuc"].ToString() != null)
                {
                    Response.Redirect("ChiTietTinTuc.aspx?MaTinTuc=" + Request.QueryString["MaTinTuc"].ToString());
                }
                
            } catch { }
            GetTinTuc();
        }
        protected void GetTinTuc()
        {
            ListTinTuc.DataSource = XLDL.GetData("select * from tintuc order by ngaydang desc");
            ListTinTuc.DataBind();
        }
    }
}