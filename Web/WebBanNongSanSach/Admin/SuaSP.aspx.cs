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
    public partial class SuaSP : System.Web.UI.Page
    {
        public static string MaSP, hinh;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                try {
                    if (XLDL.CheckSqlInjection(Request.QueryString["MaSP"]))
                        Response.Redirect("Admin/QuanLySanPham.aspx");
                MaSP = Request.QueryString["MaSP"];
                DataTable dt = XLDL.GetData("select * from loaisanpham");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ddlMaLoai.Items.Add(dt.Rows[i][1].ToString());
                    
                    }GetThongtin();
                }
                
                catch { Response.Redirect("/Admin/Quanlysanpham.aspx"); }
            }
        }
        protected void GetThongtin()
        {
            DataTable dt = XLDL.GetData("select * from sanpham where masp=" + MaSP);
            int i = 0;
            txbMaSP.Text = dt.Rows[0][i++].ToString();
            txbTenSP.Text = dt.Rows[0][i++].ToString();
            txbGiagoc.Text = dt.Rows[0][i++].ToString();
            txbGiaBan.Text = dt.Rows[0][i++].ToString();
            txbDonvitinh.Text = dt.Rows[0][i++].ToString();
            txbMotangan.Text = dt.Rows[0][i++].ToString();
            ckEditor.Value = dt.Rows[0][i++].ToString();
            hinh = dt.Rows[0][i++].ToString();
            imgHinh.ImageUrl = "/images/" + hinh;
            ddlMaLoai.Text = XLDL.GetValue("select tenloai from loaisanpham where maloai='" + dt.Rows[0][i++].ToString() + "'");
            txbSoLuong.Text = dt.Rows[0][i++].ToString();

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = XLDL.GetData("select * from giaodien where type like 'Products%' and masp="+MaSP);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Sản phẩm này đang được đặt làm Sản phẩm nổi bật. Vui lòng chọn sản phẩm khác thay thế nó ở Quản lý giao diện -> Sản phẩm nổi bật và thử Xoá lại.');</script>");
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

                    string s = "delete from sanpham where masp=" + MaSP;
                    XLDL.Execute(s);
                    Response.Redirect("/Admin/Quanlysanpham.aspx");
                }
            }
            catch(Exception ex)
            { Response.Write(ex.Message); }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string HinhMinhhoa;
            try
            {
                if (XLDL.CheckSqlInjection(hinh) || XLDL.CheckSqlInjection(txbDonvitinh.Text) || XLDL.CheckSqlInjection(txbGiaBan.Text) || XLDL.CheckSqlInjection(txbGiagoc.Text) || XLDL.CheckSqlInjection(txbMaSP.Text) || XLDL.CheckSqlInjection(txbMotangan.Text) || XLDL.CheckSqlInjection(txbSoLuong.Text) || XLDL.CheckSqlInjection(txbTenSP.Text))
                    Response.Redirect("Admin/QuanLySanPham.aspx");
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

            string LoaiSP = XLDL.GetValue("select maloai from loaisanpham where tenloai=N'" + ddlMaLoai.Text + "'");
            string giagoc;
            if (txbGiagoc.Text == "")
            {
                giagoc = "NULL";
            }
            else giagoc = txbGiagoc.Text;
            string s = "update sanpham set Tensp=N'" + txbTenSP.Text + "',giagoc= " + giagoc + ", giaban=" + txbGiaBan.Text + ",donvitinh=N'" + txbDonvitinh.Text + "',motangan=N'" + txbMotangan.Text + "',mota=N'" + ckEditor.Value + "',hinhminhhoa=N'" + HinhMinhhoa + "',maloai='" + LoaiSP + "',soluongban=" + txbSoLuong.Text + " where masp=" + MaSP;
            //Response.Write(s);
            //GetThongtin();
            XLDL.Execute(s);
            Response.Redirect("/Admin/Quanlysanpham.aspx");
        }
    }
}
