using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace WebBanNongSanSach.Admin
{
    
    public partial class SuaTinTuc : System.Web.UI.Page
    {
        public static string MaTinTuc, hinh;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                try
                {
                    MaTinTuc = Request.QueryString["MaTinTuc"];
                    GetThongTin();
                }
                catch { Response.Redirect("/Admin/Quanlytintuc.aspx"); }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
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
            catch { HinhMinhhoa = hinh; }

            string s = "update tintuc set tieude=N'" + txbTieuDe.Text + "',ngaydang= '" + txbNgayDang.Text + "', hinhminhhoa=N'" + HinhMinhhoa.Trim() + "', motangan=N'" + txbMoTa.Text + "', noidung=N'"+ckEditor.Value+"' where matintuc=" + MaTinTuc;
            //Response.Write(s);
            //GetThongtin();
            XLDL.Execute(s);
            Response.Redirect("/Admin/Quanlytintuc.aspx");
        }

        protected void cldNgayDang_SelectionChanged(object sender, EventArgs e)
        {
            txbNgayDang.Text= cldNgayDang.SelectedDate.ToShortDateString();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = XLDL.GetData("select * from giaodien where type like 'News%' and matintuc=" + MaTinTuc);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Tin tức này đang được đặt làm Tin tức nổi bật. Vui lòng chọn sản phẩm khác thay thế nó ở Quản lý giao diện -> Tin tức nổi bật và thử Xoá lại.');</script>");
                }
                else
                {
                    string Directory = Server.MapPath("../images/");
                    string fileName = hinh;
                    string path = Directory + fileName;
                    FileInfo fileInfo = new FileInfo(path);
                    if (fileInfo.Exists)
                    {
                        fileInfo.Delete();
                    }

                    string s = "delete from tintuc where matintuc=" + MaTinTuc;
                    XLDL.Execute(s);
                    Response.Redirect("/Admin/Quanlytintuc.aspx");
                }
            }
            catch(Exception ex)
            { Response.Write(ex.Message); }
        }

        protected void GetThongTin()
        {
            DataTable dt = XLDL.GetData("select * from tintuc where matintuc=" + MaTinTuc);
            int i = 0;
            txbMaTinTuc.Text = dt.Rows[0][i++].ToString();
            txbTieuDe.Text = dt.Rows[0][i++].ToString();
            txbNgayDang.Text = dt.Rows[0][i++].ToString();
            cldNgayDang.SelectedDate=DateTime.Parse( txbNgayDang.Text);
            hinh = dt.Rows[0][i++].ToString();
            imgHinh.ImageUrl = "/images/" + hinh;
            txbMoTa.Text = dt.Rows[0][i++].ToString();
            ckEditor.Value = dt.Rows[0][i++].ToString();
            
          
        }
    }
}