using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanNongSanSach.Admin
{
    public partial class QuanLyNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getUsers();
        }
        protected void getUsers()
        {
            gvUsers.DataSource = XLDL.GetData("select * from users");
            gvUsers.DataBind();
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            getUsers();
        }
        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (txbTraCuu.Text != null)
                {
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "0")
                        gvUsers.DataSource = XLDL.GetData("select * from users where tendangnhap like N'%" + txbTraCuu.Text+"%'");
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "1")
                        gvUsers.DataSource = XLDL.GetData("select * from users where ho+ten like N'%" + txbTraCuu.Text + "%'");
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "2")
                        gvUsers.DataSource = XLDL.GetData("select * from users where sodienthoai like N'%" + txbTraCuu.Text + "%'");
                    gvUsers.DataBind();
                }
                else {  }
            }
            catch { }
        }
    }
}