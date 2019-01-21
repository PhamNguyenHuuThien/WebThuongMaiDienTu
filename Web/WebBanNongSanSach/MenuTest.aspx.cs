using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public class Menu1
    {
        public int ID{ get; set; }
        public string menu { get; set; }
        public string link { get; set; }
        public int subID { get; set; }
        public int Visible { get; set; }
    }
    public partial class MenuTest : System.Web.UI.Page
    {
        protected string codehtml= "<div class='header-bottom-bottom'><div class='container'><div class='top-nav menu_desktop' id='menu'><span class='menu'></span><ul>";
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Menu> obj = new List<Menu>();
            DataTable dt = new DataTable();
            string sql = "select * from menu order by Sorting";
            dt = XLDL.GetData(sql);
            obj = test(dt);
            //Response.Write(obj[1].subID);
            //Response.Write(obj[1].menu);
           foreach(Menu mn in obj)
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
                            codehtml += "<li><a href ='"+mn1.link+"'>»"+mn1.menu+ "</a>";
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

            //Response.Write(codehtml);
        }
        public List<Menu> test(DataTable dt) // chuyển datatable thành object
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