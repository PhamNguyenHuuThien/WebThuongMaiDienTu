using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class Lienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TenDN"]==null)
                {
                    Response.Redirect("DangNhap.aspx");
                }
                else
                {

                    DataTable dt = XLDL.GetData("select * from users where tendangnhap=N'" + Session["TenDN"].ToString()+"'");
               
                    txbHoTen.Text = dt.Rows[0][1].ToString()+" "+dt.Rows[0][2].ToString();
                    txbEmail.Text = dt.Rows[0][8].ToString();
                    txbDiaChi.Text = dt.Rows[0][5].ToString();
                    txbNoiDung.Text = "";
                }
            }
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            if (txbNoiDung.Text.Trim()==""||txbNoiDung.Text==null)
            {
                txbNoiDung.Focus();
            }
            if (XLDL.CheckSqlInjection(txbNoiDung.Text))
                Response.Redirect("LienHe.aspx");
            else
            {
                string makh = XLDL.GetValue("select makh from users where tendangnhap=N'" + Session["TenDN"].ToString() + "'");
                string s = "INSERT INTO[dbo].[LienHe]  ([MaKH],[Noidung]) VALUES (N'" + makh + "',N'" + txbNoiDung.Text + "')";
                //Response.Write(s);
                XLDL.Execute(s);
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLamLai_Click(object sender, EventArgs e)
        {
            txbNoiDung.Text = "";
            txbNoiDung.Focus();
        }
    }
}