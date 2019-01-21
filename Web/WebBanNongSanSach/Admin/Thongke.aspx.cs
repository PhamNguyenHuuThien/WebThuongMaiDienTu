using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Text;

namespace WebBanNongSanSach.Admin
{
    public partial class Thongke : System.Web.UI.Page
    {
        StringBuilder str = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // here i am calling function  chart_bind(); in the page load event of the page
                chart_bind();
            }

        }
        private void chart_bind()
        {
            // here i am using SqlDataAdapter for the sql server select query
            //SqlDataAdapter adp = new SqlDataAdapter("select top(7)* from tb_exp", con);
            // here am taking datatable
            DataTable dt = XLDL.GetData("select month(ngaydathang) as thang,sum(trigia) as tongthu from dondathang group by month(ngaydathang)");
            
                // here datatale dt is fill wit the adp
                
                // this string m catching in the stringbuilder class
                // in the str m writing same javascript code that is given by the google.
                // but m changing  only below line
                //data.addColumn('string'(datatype), 'Year'(columnname according to the sql table));
                //data.addColumn('number'(datatype), 'Sales'(columnname according to the sql table));
                //data.addColumn('number'(datatype), 'Expenses'(columnname according to the sql table));
                // my data that will come from the sql server
                // in the below line i need " in place of *
                // stringbuilder can't return us " so at the last line i am
                // replacing * with the " using Replace('*', '"'); function
                // and other code is same like the google code
                str.Append(@"<script type=text/javascript> google.load( *visualization*, *1*, {packages:[*corechart*]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();

        data.addColumn('number', 'Trị giá');

        data.addRows(" + dt.Rows.Count + ");");

                Int32 i;
                //here i am using for loop to fetch multiple recorod from the database
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {

                    // i need this type of output " data.setValue(0, 1, 'sales');",(1, 1, 'sales');" * so on  in the first line so for this
                    //m using i for the 1& 2 and so on . and after this i am writting 1 and after this sales using datatable
                    str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["tongthu"].ToString() + ") ;");
                  
                    



                }
                // the other code same like as google's javascript code
                str.Append("   var chart = new google.visualization.BarChart(document.getElementById('chart_div'));");
                // in the below line you can set width height of the chart according to your need
                str.Append(" chart.draw(data, {width: 1200, height: 600, title: 'Tỏng doanh thu trong tháng',");
                //  str.Append(" var chart = new google.visualization.BarChart(document.getElementById('chart_div'));");
                str.Append("vAxis: {title: '', titleTextStyle: {color: 'green'}}");
                str.Append("}); }");
                str.Append("</script>");
                lt.Text = str.ToString().TrimEnd(',').Replace('*', '"');




        }

    }
}


