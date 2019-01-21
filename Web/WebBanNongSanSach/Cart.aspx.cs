using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace WebBanNongSanSach
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGioHang();
            }
        }

        public void LoadGioHang()
        {
            if (Session["Giohang"] != null)
            {
                DataTable dt = (DataTable)Session["Giohang"];
                System.Decimal TongThanhTien = 0;
                foreach (DataRow r in dt.Rows)
                {
                    r["ThanhTien"] = Convert.ToDouble(r["SoLuong"]) * Convert.ToDouble(r["GiaBan"]);
                    TongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
                    lbTongThanhTien.Text = String.Format("{0:#,# VNĐ}", TongThanhTien);
                }
                GVGioHang.DataSource = dt;
                GVGioHang.DataBind();
            }
            else thongbao.Text = "Bạn chưa chọn món hàng nào.";
        }

        
        protected void GVGioHang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVGioHang.EditIndex = e.NewEditIndex;
            LoadGioHang();
        }

        protected void GVGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //double MaSP = double.Parse(e.NewValues[0].ToString());
            //nt SoLuong = int.Parse(e.NewValues[1].ToString());
            //Response.Write("Test"+ Convert.ToString(e.NewValues[2]));
            //Response.Write(Convert.ToDouble(e.NewValues["Số lượng"].ToString()));
            try { 
            DataTable dt = (DataTable)Session["Giohang"];
            foreach (GridViewRow r in GVGioHang.Rows)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    //Response.Write(Convert.ToString(GVGioHang.DataKeys[r.DataItemIndex].Value + dr["MaSP"].ToString()));
                    if (Convert.ToString(GVGioHang.DataKeys[r.DataItemIndex].Value) == dr["MaSP"].ToString())
                    {
                        TextBox t = (TextBox)r.Cells[2].FindControl("txtSoLuong");
                        if (t != null)
                        {
                            try
                            {
                                    if(Convert.ToDouble(t.Text) >=10000)
                                    {
                                        Response.Redirect("Cart.aspx");
                                    }
                                if (t != null && Convert.ToDouble(t.Text) <= 0)
                                {
                                    dt.Rows.Remove(dr);
                                    Response.Redirect("~/Cart.aspx");
                                }

                                else dr["SoLuong"] = Convert.ToDouble(t.Text);
                            }
                            //dr["SoLuong"] = Convert.ToDouble(t.Text);
                            catch { Response.Redirect("Cart.aspx"); }
                            break;
                        }
                        
                        
                    }
                }
            }
            
            Session["Giohang"] = dt;
            GVGioHang.EditIndex = -1;
            LoadGioHang();}
            catch
            {
                Response.Redirect("Cart.aspx");
            }
        }

        protected void GVGioHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVGioHang.EditIndex = -1;
            LoadGioHang();
        }

        protected void GVGioHang_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GVGioHang.EditIndex = -1;
            LoadGioHang();
        }

        protected void GVGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Response.Write(e.Keys["MaSP"].ToString());
            string masp = e.Keys["MaSP"].ToString();
            try
            {
                DataTable dt = (DataTable)Session["Giohang"];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if(dt.Rows[i][0].ToString()==masp)
                    {
                        dt.Rows.RemoveAt(i);
                    }
                }
                if (dt.Rows.Count > 0)
                    Session["Giohang"] = dt;
                else
                    Session["Giohang"] = null;
                Response.Redirect("~/Cart.aspx");
            }
            catch
            {
                Response.Redirect("~/Cart.aspx");
            }
        }

        protected void lbtnDatmua_Click(object sender, EventArgs e)
        {
            if (Session["Giohang"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Giỏ hàng của bạn đang trống !!')", true);
            }
            else
            if (Session["TenDN"]==null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('Bạn chưa đăng nhập !!')", true);
            }
            else
            {
                Response.Redirect("/Datmua.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Giohang"] = null;
            Response.Redirect("~/Cart.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Danhsachsanpham.aspx");
        }
    }
}
