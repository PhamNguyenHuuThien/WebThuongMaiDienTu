using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach
{
    public partial class UCHeader : System.Web.UI.UserControl
    {
        public string URLLogo, SDT,Email;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = XLDL.GetData("select * from giaodien where type='info'");
                if (dt.Rows.Count>0)
                {
                    URLLogo = dt.Rows[0].ItemArray[2].ToString();
                    SDT = dt.Rows[0].ItemArray[4].ToString();
                    Email = dt.Rows[0].ItemArray[5].ToString();
                }
            }
            catch{
                Response.Write("Không tìm thấy CSDL");
            }

            if (Session["TenDN"] != null)
            {
                adangnhap.Visible = false;
                adangky.Visible = false;
                lbTenDN.Visible = true;
                lbThayDoiTT.Visible = true;
                lbTenDN.Text = "<a href='#' style='text-decoration:none' ><b>Xin chào " + XLDL.GetValue("select Ten from users where tendangnhap=N'" + Session["TenDN"] + "'") + "</b></a>";
                lbtDangXuat.Visible = true;
                if (XLDL.GetValue("select laadmin from users where tendangnhap=N'" + Session["TenDN"] + "'") == "True")
                    aQuanLy.Visible = true;
                else
                    aQuanLy.Visible = false;
            }
            else
            {
                lbTenDN.Text = "";
                lbTenDN.Visible = false;
                lbtDangXuat.Visible = false;
                adangky.Visible = true;
                aQuanLy.Visible = false;
                lbThayDoiTT.Visible = false;
            }






            if (Session["Giohang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Giohang"];
                lbTongSL.Text = dt.Rows.Count.ToString();
            }
            else
            {
                lbTongSL.Text = "0";
            }
        }

        protected void adangnhap_Click(object sender, EventArgs e)
        {
            Response.Redirect("/DangNhap.aspx");
        }



        protected void lbtDangXuat_Click(object sender, EventArgs e)
        {
            Session["TenDN"] = null;
            Session["Giohang"] = null;
            Response.Redirect(Request.RawUrl);//load lại trang hiện tại
            //Response.Redirect("Gioithieu.aspx");
        }
    }
}