using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        public static string MaTinTuc;
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                if (XLDL.CheckSqlInjection(Request.QueryString["MaTinTuc"]) == true)
                    Response.Redirect("Tintuc.aspx");
                else
                { 
                    MaTinTuc = Request.QueryString["MaTinTuc"].ToString();
                GetTinTuc();}
            } catch { }
        }
        protected void GetTinTuc()
        {
            dlChiTietTinTuc.DataSource = XLDL.GetData("select * from tintuc where matintuc=" + MaTinTuc);
            dlChiTietTinTuc.DataBind();
        }
    }
}