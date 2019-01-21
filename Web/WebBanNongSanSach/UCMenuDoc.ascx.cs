using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanNongSanSach
{
    public partial class UCMenuDoc : System.Web.UI.UserControl
    {
        protected string codehtml = "<ul class='dv_list_dmsp'>";
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Menu> obj = new List<Menu>();
            DataTable dt = new DataTable();
            string sql = "select * from menu order by Sorting";
            dt = XLDL.GetData(sql);
            obj = Chuyen(dt);
            foreach (Menu mn in obj)
            {
                if (mn.subID == 4)
                {
                    codehtml+= "<li><a href='"+mn.link+ "'>"+mn.menu+"</a><span class='SHOW_menu_left'></span></li>";

                }
            }
            codehtml += "</ul>";
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