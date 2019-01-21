using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class ThanhCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                string MaDH = Request.QueryString["MaDH"].ToString();
                DataTable dt = XLDL.GetData("select * from dondathang where madonhang=" + MaDH);
                if (dt.Rows.Count>0)
                {
                    lblKetQua.Text = "Chúng tôi đã nhận thành công mã đơn hàng #" + MaDH + " và đã gửi chi tiết đến Email của bạn.<br> Hãy kiểm tra Email và chuẩn bị số tiền sau khi chúng tôi liên lạc cho bạn.";
                    Session["Giohang"] = null;
               
                }
                else { Response.Redirect("Default.aspx"); }
            } catch { Response.Redirect("Default.aspx"); }
        }
    }
}