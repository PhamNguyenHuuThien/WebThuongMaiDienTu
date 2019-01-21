using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTThucHanh
{
    public partial class ckEditor : System.Web.UI.UserControl
    {
        public String Value
        {
            get
            {
                EnsureChildControls();
                return TextBox1.Text;
            }
            set
            {
                EnsureChildControls();
                TextBox1.Text = value;
            }

        }
        protected override void OnInit(EventArgs e)
        {
            //see if ckeditor has already been included in the client script
            if (!Page.ClientScript.IsClientScriptIncludeRegistered("ckeditor.js"))
            {
                Page.ClientScript.RegisterClientScriptInclude("ckeditor.js", "/CKEditor/ckeditor.js");
            }
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}