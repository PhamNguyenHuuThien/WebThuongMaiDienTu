using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class _404 : System.Web.UI.Page
    {
        protected string web;
        protected void Page_Load(object sender, EventArgs e)
        {
            web = Request.QueryString["aspxerrorpath"];
        }
    }
}