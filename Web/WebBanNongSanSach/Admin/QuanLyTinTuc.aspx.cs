using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebBanNongSanSach.Admin
{
    public partial class QuanLyTinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txbMaTinTuc.Text = XLDL.GetValue("select max(matintuc)+1 from tintuc");
                txbMaTinTuc.ReadOnly = true;
                txbNgayDang.Text = DateTime.Today.ToShortDateString();
                GetTinTuc();
            }
            
        }
        protected void GetTinTuc()
        {
            gvTintuc.DataSource = XLDL.GetData("select * from tintuc");
            gvTintuc.DataBind();
        }

        protected void cldNgayDang_SelectionChanged(object sender, EventArgs e)
        {
            txbNgayDang.Text = cldNgayDang.SelectedDate.ToShortDateString();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txbTieuDe.Text=="" ||txbTieuDe.Text==null)
            {
                Response.Write("<script>alert('Bạn chưa nhập đủ các phần');</script>");

            }
            else { 
            string HinhMinhhoa;
            try
            {
                string folderPath = Server.MapPath("../images/");
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists Create it.
                    Directory.CreateDirectory(folderPath);
                }

                //Save the File to the Directory (Folder).
                TaiHinhAnh.SaveAs(folderPath + Path.GetFileName(TaiHinhAnh.FileName));

                //Display the Picture in Image control.
                //imgHinh.ImageUrl = "../images/" + Path.GetFileName(TaiHinhAnh.FileName);
                HinhMinhhoa = Path.GetFileName(TaiHinhAnh.FileName);
            }
            catch { HinhMinhhoa = ""; }

            string s = "insert into tintuc values (N'" + txbTieuDe.Text + "','" + txbNgayDang.Text + "', N'" + HinhMinhhoa.Trim() + "', N'" + txbMoTa.Text + "',N'" + ckEditor.Value + "')";
            //Response.Write(s);
            //GetThongtin();
            XLDL.Execute(s);
            Response.Redirect("/Admin/Quanlytintuc.aspx");
            }
        }
    }
}