using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            register_ex.Text = "";
        }

        protected void signup_btn_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");

            var fn = f_name_txt.Text.Trim();
            var ln = l_name_txt.Text.Trim();
            var bd = b_date_txt.Text.Trim();
            var add = address_txt.Text.Trim();
            var em = email_txt.Text.Trim();
            var pass = pass_txt.Text.Trim();
            var userg = "2";

            var table = dataAccess.Select("Registration",new string[] { "email" }, new string[] { "email" }, new string[] { em });

            if (table.Rows.Count == 0)
            {
                dataAccess.Insert("Registration", new string[] { fn, ln, bd, add, em, pass, userg });
                Response.Redirect("~/signin.aspx");
            }
            else
            {
                register_ex.Text = "Please enter another email";
            }
            
 

        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}