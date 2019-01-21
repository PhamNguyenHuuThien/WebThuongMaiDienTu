using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach.Admin
{
    public partial class Hopthulienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetHopThuLienHe();
            }

        }
        protected void GetHopThuLienHe (){
            gvHopThuLienHe.DataSource = XLDL.GetData("select * from lienhe");
            gvHopThuLienHe.DataBind();
        }

    }
}