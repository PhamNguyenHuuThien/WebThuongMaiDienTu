using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach.Admin
{
    public partial class SuaTag : System.Web.UI.Page
    {
        public static string MaTag;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                try
                {
                    if (XLDL.CheckSqlInjection(Request.QueryString["MaTag"]))
                        Response.Redirect("Admin/QuanLyGiaoDien.aspx");
                    MaTag = Request.QueryString["MaTag"];
                    GetThongTin();
                }
                catch { Response.Redirect("/Admin/QuanLyGiaoDien.aspx"); }
            }
        }

        protected void GetThongTin()
        {
            DataTable dt = XLDL.GetData("select * from tags where id=" + MaTag);
            int i = 0;
            txbMaTag.Text = dt.Rows[0][i++].ToString();
            txbTuKhoa.Text = dt.Rows[0][i++].ToString();
            txbTenTag.Text = dt.Rows[0][i++].ToString();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (XLDL.CheckSqlInjection(txbTuKhoa.Text) || XLDL.CheckSqlInjection(txbTuKhoa.Text) || XLDL.CheckSqlInjection(txbMaTag.Text))
                Response.Redirect("Admin/QunLyGiaoDien.aspx");
            string s = "update tags set linktag=N'" + txbTuKhoa.Text + "',tentag= N'" + txbTenTag.Text + "' where id=" + MaTag;
            //Response.Write(s);
            //GetThongtin();
            XLDL.Execute(s);
            Response.Redirect("/Admin/QuanlyGiaodien.aspx");
        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {

                string s = "delete from Tags where id=" + MaTag;
                XLDL.Execute(s);
                Response.Redirect("/Admin/Quanlygiaodien.aspx");

            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
        }
    }
}