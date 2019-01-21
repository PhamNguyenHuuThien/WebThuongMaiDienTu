using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Net;
using System.IO;

namespace WebBanNongSanSach
{
    public partial class LoginquaFB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string app_id = "975647052624368";
            string app_secret = "88f14d15bb853ad9a8282c3feafc61dc";
            string redirectUri = @"https://webbanrausach.azurewebsites.net/LoginquaFB.aspx/";
            string code = Request["code"];

            string requestUri = @"https://graph.facebook.com/oauth/access_token?client_id=" + app_id + "&redirect_uri=" + redirectUri + "&client_secret=" + app_secret + "&code=" + code;

            string str = getResponseFromUrl(requestUri);
            int index1 = str.IndexOf("&");
            str = str.Remove(index1, str.Length - index1);
            string accessToken = str.Replace("access_token=", "");
            lblAccessToken.Text = accessToken;

            requestUri = @"https://graph.facebook.com/me?access_token=" + accessToken;

            string data = getResponseFromUrl(requestUri);

            var json = new JavaScriptSerializer();
            var user = json.Deserialize<User>(data);
        }

        public string getResponseFromUrl(string url)
        {
            WebRequest wr = WebRequest.Create(url);
            WebResponse ws = wr.GetResponse();
            Stream st = ws.GetResponseStream();
            StreamReader sr = new StreamReader(st);
            string str = sr.ReadToEnd();
            return str;
        }
        public class User
        {
            public int id { get; set; }
            public string name { get; set; }
            public string first_name { get; set; }
            public string last_name { get; set; }
            public string username { get; set; }
            public string gender { get; set; }
            public string locale { get; set; }
        }
    }
}