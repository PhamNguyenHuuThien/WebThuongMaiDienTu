using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public class Menu
    {
        public int ID { get; set; }
        public string menu { get; set; }
        public string link { get; set; }
        public int subID { get; set; }
        public int Visible { get; set; }
    }
    public partial class UCMenu : System.Web.UI.UserControl
    {
        protected string desktopview = "<div class='header-bottom-bottom'><div class='container'><div class='top-nav menu_desktop' id='menu'><span class='menu'></span><ul>";
        protected string mobileview = "<div class='dv-mnmb mobile menu_mobile'><a class='a_home' href='Default.aspx'>Trang chủ</a><div id = 'dl-menu' class='dl-menuwrapper'><button class='dl-trigger cur'></button><div class='clear'></div><ul class='dl-menu'>";
        protected string codehtml = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Menu> obj = new List<Menu>();
            DataTable dt = new DataTable();
            string sql = "select * from menu order by Sorting";
            dt = XLDL.GetData(sql);
            obj = Chuyen(dt);
            //Response.Write(obj[1].subID);
            //Response.Write(obj[1].menu);
            foreach (Menu mn in obj)
            {
                if (mn.subID == 0)
                {
                    codehtml += " <li class=' '>" +
                        "<a class='' href='" + mn.link + "'>" +
                        "<span>" + mn.menu + "</span></a>";
                    if (mn.Visible == 1)
                        codehtml += "<ul class='dl-submenu'>";
                    foreach (Menu mn1 in obj)
                    {

                        if (mn1.subID == mn.ID)
                        {
                            codehtml += "<li><a href ='" + mn1.link + "'>»" + mn1.menu + "</a>";
                            if (mn1.Visible == 1)
                                codehtml += "<ul class='dl-submenu'>";
                            foreach (Menu mn2 in obj)
                            {
                                if (mn2.subID == mn1.ID)
                                    codehtml += "<li><a href ='" + mn2.link + "'>»" + mn2.menu + "</a></li>";

                            }
                            if (mn1.Visible == 1)
                                codehtml += "</ul></li>";
                            else
                                codehtml += "</li>";
                        }


                    }

                }
                if (mn.Visible == 1)
                    codehtml += "</ul></li>";
                else
                    codehtml += "</li>";
            }

            codehtml += "</div></ul>";
            desktopview += codehtml;
            desktopview += "<script src='Scripts/JS/menu_mb/modernizr.custom.js'></script><script src = 'Scripts/JS/menu_mb/jquery.dlmenu.js'></script><script>$(function() {$('#dl-menu').dlmenu();});$(document).ready(function() {$('body').click(function(e) {$('#dl-menu').dlmenu('closeMenu');});});</script>";            mobileview += codehtml;
            mobileview += "</div></div></div>";
            //Response.Write(codehtml);
        }
        public List<Menu> Chuyen(DataTable dt) // chuyển datatable thành object
        {

            var convertedList = (from rw in dt.AsEnumerable()
                                 select new Menu()
                                 {
                                     ID = Convert.ToInt32(rw["ID"]),
                                     menu = Convert.ToString(rw["menu"]),
                                     link = Convert.ToString(rw["link"]),
                                     subID = Convert.ToInt32(rw["subID"]),
                                     Visible = Convert.ToInt32(rw["Visible"])
                                 }).ToList();

            return convertedList;
        }
    }
}