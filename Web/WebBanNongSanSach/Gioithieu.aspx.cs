using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class Gioithieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblGioiThieu.Text = XLDL.GetValue("select gioithieutrang from giaodien where type='Info'");
        }
    }
}