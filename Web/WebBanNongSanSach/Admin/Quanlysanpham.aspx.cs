using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace WebBanNongSanSach.Admin
{
    public partial class Quanlysanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    txbMaSP.Text = XLDL.GetValue("select max(masp)+1 from sanpham");
                    txbMaSP.ReadOnly = true;
                    DataTable dt = XLDL.GetData("select * from loaisanpham");
                    for(int i=0;i<dt.Rows.Count;i++)
                    {
                        ddlMaLoai.Items.Add(dt.Rows[i][1].ToString());
                        
                    }
                    
                    GetSanPham();
                }
                catch { }
            }
           
        }
        protected void GetSanPham()
        {
            gvSanpham.DataSource = XLDL.GetData("select * from sanpham");
            gvSanpham.DataBind();
        }

        protected void gvSanpham_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            /* string MaSP = Convert.ToString( e.NewValues[0]);
             string TenSP = Convert.ToString(e.NewValues[1]);
             string GiaGoc = Convert.ToString(e.NewValues[2]);
             string GiaBan = Convert.ToString(e.NewValues[3]);
             string DonViTinh = Convert.ToString(e.NewValues[4]);
             string Motangan = Convert.ToString(e.NewValues[5]);
             string Mota = Convert.ToString(e.NewValues[6]);
             string hinhminhhoa = Convert.ToString(e.NewValues[7]);

             string Maloai = Convert.ToString(e.NewValues[8]);
             string Soluongban = Convert.ToString(e.NewValues[9]);
             Response.Write("update sanpham set tensp=N'" + TenSP+"',giagoc=" + GiaGoc + " ,giaban=" + GiaBan + ",Donvitinh=" + DonViTinh + ",motangan=N'" + Motangan + "',mota=N'" + Mota+"',maloai='"+Maloai+"',hinhminhhoa=N'"+hinhminhhoa+"'soluongban="+Soluongban+" where masp="+MaSP);
             //XLDL.Execute("UPDATE NHAXUATBAN SET TenNXB=N'" + TenSP + "', DiaChi=N'" + DiaChi + "', DienThoai='" + DienThoai + "' WHERE MaNXB='" + MaNXB + "'");
             gvSanpham.EditIndex = -1;
             GetSanPham();*/
           
        }

        protected void gvSanpham_RowEditing(object sender, GridViewEditEventArgs e)
        {
            /*gvSanpham.EditIndex = e.NewEditIndex;
            GetSanPham();*/
           

        }

        protected void gvSanpham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSanpham.EditIndex = -1;
            GetSanPham();
        }

        protected void gvSanpham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }

        protected void btnThem_Click(object sender, EventArgs e)
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

            string HinhMinhhoa = Path.GetFileName(TaiHinhAnh.FileName);

            string LoaiSP=XLDL.GetValue("select maloai from loaisanpham where tenloai=N'"+ddlMaLoai.Text+"'");
            string s = " INSERT INTO [dbo].[SanPham] ([TenSP]  ,[GiaGoc]  ,[GiaBan]  ,[DonViTinh] ,[MoTaNgan]  ,[MoTa] ,[HinhMinhHoa] ,[MaLoai] ,[SoLuongBan]) VALUES  (N'"+txbTenSP.Text+"',"+txbGiagoc.Text+","+txbGiaBan.Text+",N'"+txbDonvitinh.Text+"',N'"+txbMotangan.Text+"',N'"+ ckEditor.Value+ "','"+HinhMinhhoa+"', '"+LoaiSP+"',"+txbSoLuong.Text+ ")";
            //Response.Write(s);
            XLDL.Execute(s);
            Response.Redirect("/Admin/Quanlysanpham.aspx");
        }

        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            
            try
            {
                if (XLDL.CheckSqlInjection(txbTraCuu.Text))
                    Response.Redirect("Quanlysanpham.aspx");
                if (txbTraCuu.Text != null)
                {
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "0")
                        gvSanpham.DataSource = XLDL.GetData("select * from sanpham where tensp like N'%" + txbTraCuu.Text + "%'");
                    if (tblLoaiTraCuu.SelectedValue.ToString() == "1")
                        gvSanpham.DataSource = XLDL.GetData("select * from sanpham where masp like N'%" + txbTraCuu.Text + "%'");
                    
                    gvSanpham.DataBind();
                }
                else { }
            }
            catch { }
        }
    }
}