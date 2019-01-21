using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach.Admin
{
    public partial class Quanlygiaodien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try {
                    DataTable dt = XLDL.GetData("select * from Giaodien");
                    for (int i=0;i<dt.Rows.Count;i++)
                    {
                        if (dt.Rows[i][1].ToString()=="Info")
                        {
                            txbDiaChi.Text = dt.Rows[i]["Diachi"].ToString();
                            txbSDT.Text = dt.Rows[i]["Hotline"].ToString();
                            txbEmail.Text = dt.Rows[i]["Email"].ToString();
                            ckEditor.Value = dt.Rows[i]["GioiThieuTrang"].ToString();
                        }
                        

                    }

                    DataTable tintuc = XLDL.GetData("select matintuc,tieude from tintuc");
                    for(int i = 0; i < tintuc.Rows.Count; i++)
                    {
                        ddlTinTuc1.Items.Add(tintuc.Rows[i][1].ToString());
                        ddlTinTuc2.Items.Add(tintuc.Rows[i][1].ToString());
                        ddlTinTuc3.Items.Add(tintuc.Rows[i][1].ToString());
                        ddlTinTuc4.Items.Add(tintuc.Rows[i][1].ToString());
                    }
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i][1].ToString() == "News1")
                        {
                            for (int j = 0; j < tintuc.Rows.Count; j++)
                            {
                                if (tintuc.Rows[j][0].ToString() == dt.Rows[i][8].ToString())
                                {
                                    ddlTinTuc1.Text = tintuc.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "News2")
                        {
                            for (int j = 0; j < tintuc.Rows.Count; j++)
                            {
                                if (tintuc.Rows[j][0].ToString() == dt.Rows[i][8].ToString())
                                {
                                    ddlTinTuc2.Text = tintuc.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "News3")
                        {
                            for (int j = 0; j < tintuc.Rows.Count; j++)
                            {
                                if (tintuc.Rows[j][0].ToString() == dt.Rows[i][8].ToString())
                                {
                                    ddlTinTuc3.Text = tintuc.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "News4")
                        {
                            for (int j = 0; j < tintuc.Rows.Count; j++)
                            {
                                if (tintuc.Rows[j][0].ToString() == dt.Rows[i][8].ToString())
                                {
                                    ddlTinTuc4.Text = tintuc.Rows[j][1].ToString();
                                }
                            }
                        }
                        
                    }


                    DataTable tensp = XLDL.GetData("select masp, tensp from sanpham");
                    for (int i = 0; i < tensp.Rows.Count; i++)
                    {
                        ddlSanPhamThuNhat.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuHai.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuBa.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuTu.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuNam.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuSau.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuBay.Items.Add(tensp.Rows[i][1].ToString());
                        ddlSanPhamThuTam.Items.Add(tensp.Rows[i][1].ToString());
                    }
                   
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i][1].ToString() == "Products1")
                        {
                            for(int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if(tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuNhat.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products2")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuHai.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products3")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuBa.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products4")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuTu.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products5")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuNam.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products6")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuSau.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products6")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuSau.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products7")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuBay.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }
                        if (dt.Rows[i][1].ToString() == "Products8")
                        {
                            for (int j = 0; j < tensp.Rows.Count; j++)
                            {
                                if (tensp.Rows[j][0].ToString() == dt.Rows[i][7].ToString())
                                {
                                    ddlSanPhamThuTam.Text = tensp.Rows[j][1].ToString();
                                }
                            }
                        }




                    }

                    gvTags.DataSource = XLDL.GetData("select * from tags");
                    gvTags.DataBind();
                    


                    GetMenu();

                }
                catch(Exception ex){ Response.Write(ex.Message); }
            }
        }

        protected void GetMenu()
        {
            gvMenu.DataSource = XLDL.GetData("select * from menu");
            gvMenu.DataBind();
        }

        protected void btnLuuThongTinTrang_Click(object sender, EventArgs e)
        {
            try { 
            string s="update giaodien set hotline=N'"+txbSDT.Text+"',diachi=N'"+txbDiaChi.Text +"', email=N'"+ txbEmail.Text+"', gioithieutrang=N'"+ckEditor.Value+"' where type='Info'";
            XLDL.Execute(s);}
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void gvMenu_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMenu.EditIndex = e.NewEditIndex;
            GetMenu();
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "$('#mytabs a[href=\"#Menu\"]').tab('show');", true);
            //Response.Write("<script>$('#mytabs a[href=\"#Menu\"]').tab('show');</script>");
        }

        protected void gvMenu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMenu.EditIndex = -1;
            GetMenu();
           
        }

        protected void gvMenu_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ID = Convert.ToString(e.NewValues[0]);
            string Menu = Convert.ToString(e.NewValues[1]).Trim();
            string Link = Convert.ToString(e.NewValues[2]);
            string SubID = Convert.ToString(e.NewValues[3]);
            string MucCon;
            if (e.NewValues[4].ToString() == "True")
            {
                MucCon = "1";
            }
            else MucCon = "0";
            string Sorting= Convert.ToString(e.NewValues[5]);
            string s = "update menu set menu=N'" + Menu + "',link=N'" + Link + "',subid=" + SubID + ",Visible=" + MucCon + ",sorting=" + Sorting+" where id="+ID;
            //Response.Write(s);
            XLDL.Execute(s);
            gvMenu.EditIndex = -1;
            GetMenu();
        }

        protected void btnLuuSPNoiBat_Click(object sender, EventArgs e)
        {
            string masp1=XLDL.GetValue("select masp from sanpham where tensp=N'"+ddlSanPhamThuNhat.Text+"'");
            string masp2=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuHai.Text+"'");
            string masp3=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuBa.Text+"'");
            string masp4=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuTu.Text+"'");
            string masp5=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuNam.Text+"'");
            string masp6=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuSau.Text+"'");
            string masp7=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuBay.Text+"'");
            string masp8=XLDL.GetValue("select masp from sanpham where tensp=N'" + ddlSanPhamThuTam.Text+"'");

            string s1 = "update giaodien set masp=" + masp1 + " where type='Products1'";
            string s2 = "update giaodien set masp=" + masp2 + " where type='Products2'";
            string s3 = "update giaodien set masp=" + masp3 + " where type='Products3'";
            string s4 = "update giaodien set masp=" + masp4 + " where type='Products4'";
            string s5 = "update giaodien set masp=" + masp5 + " where type='Products5'";
            string s6 = "update giaodien set masp=" + masp6 + " where type='Products6'";
            string s7 = "update giaodien set masp=" + masp7 + " where type='Products7'";
            string s8 = "update giaodien set masp=" + masp8 + " where type='Products8'";

            XLDL.Execute(s1);
            XLDL.Execute(s2);
            XLDL.Execute(s3);
            XLDL.Execute(s4);
            XLDL.Execute(s5);
            XLDL.Execute(s6);
            XLDL.Execute(s7);
            XLDL.Execute(s8);
        }

        protected void btnLuuTintucnoibat_Click(object sender, EventArgs e)
        {
            string matt1 = XLDL.GetValue("select matintuc from tintuc where tieude=N'" + ddlTinTuc1.Text + "'");
            string matt2 = XLDL.GetValue("select matintuc from tintuc where tieude=N'" + ddlTinTuc2.Text + "'");
            string matt3 = XLDL.GetValue("select matintuc from tintuc where tieude=N'" + ddlTinTuc3.Text + "'");
            string matt4 = XLDL.GetValue("select matintuc from tintuc where tieude=N'" + ddlTinTuc4.Text + "'");

            string s1 = "update giaodien set matintuc=" + matt1 + " where type='News1'";
            string s2 = "update giaodien set matintuc=" + matt2 + " where type='News2'";
            string s3 = "update giaodien set matintuc=" + matt3 + " where type='News3'";
            string s4 = "update giaodien set matintuc=" + matt4 + " where type='News4'";

            XLDL.Execute(s1);
            XLDL.Execute(s2);
            XLDL.Execute(s3);
            XLDL.Execute(s4);

        }
    }
}