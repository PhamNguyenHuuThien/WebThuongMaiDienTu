using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach.Admin
{
    public partial class AdminMasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["TenDN"] == null || XLDL.GetValue("select laadmin from users where tendangnhap=N'" + Session["TenDN"] + "'") != "True")
                {
                   Response.Redirect("/Quanlyhethong.aspx");
                }
            }
            catch { }
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["TenDN"] = null;
            Response.Redirect("/Quanlyhethong.aspx");
        }
    }
}