using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class QuanLyTaiKhoan : System.Web.UI.Page
    {
        public static string MKCu, EmailCu;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TenDN"] != null)
                {
                    try
                    {
                        GetThongTin();
                    }
                    catch { }
                }

                else
                    Response.Redirect("Default.aspx");
            }
        }

        protected void lbtDoiThongtin_Click(object sender, EventArgs e)
        {
            if (XLDL.CheckSqlInjection(txbHo.Text) || XLDL.CheckSqlInjection(txbTen.Text) || XLDL.CheckSqlInjection(txbSDT.Text) || XLDL.CheckSqlInjection(txbNoiCongTac.Text) || XLDL.CheckSqlInjection(txbDiaChi.Text) || XLDL.CheckSqlInjection(txbFacebook.Text) || XLDL.CheckSqlInjection(txbViber.Text) || XLDL.CheckSqlInjection(txbSkype.Text) || XLDL.CheckSqlInjection(txbHo.Text))
                Response.Redirect("QuanLyTaiKhoan.aspx");
            string s = "update users set ho = N'" + txbHo.Text + "', ten = N'" + txbTen.Text + "', sodienthoai = N'" + txbSDT.Text + "', noicongtac = N'" + txbNoiCongTac.Text + "', diachi = N'" + txbDiaChi.Text + "',facebook=N'"+txbFacebook.Text+"',viber=N'"+txbViber.Text+"',skype=N'"+ txbSkype.Text + "' where tendangnhap = N'" + Session["TenDN"].ToString() + "'";
            
           XLDL.Execute(s);

            Response.Write("<script>alert('Thành công!');</script>");
            GetThongTin();
        }

        protected void GetThongTin()
        {
            string tendn = Session["TenDN"].ToString();
            DataTable dt = XLDL.GetData("select * from users where tendangnhap=N'" + tendn + "'");
            if (dt.Rows.Count > 0)
            {
                txbHo.Text = dt.Rows[0][1].ToString();
                txbTen.Text = dt.Rows[0][2].ToString();
                txbSDT.Text = dt.Rows[0][3].ToString();
                txbNoiCongTac.Text = dt.Rows[0][4].ToString();
                txbDiaChi.Text = dt.Rows[0][5].ToString();
                lbUser.Text = dt.Rows[0][6].ToString();
                MKCu = dt.Rows[0][7].ToString();
                lbEmail.Text = dt.Rows[0][8].ToString().Trim();
                txbFacebook.Text= dt.Rows[0][12].ToString().Trim();
                txbViber.Text= dt.Rows[0][13].ToString().Trim();
                txbSkype.Text= dt.Rows[0][14].ToString().Trim();
            }
        }
    }
}