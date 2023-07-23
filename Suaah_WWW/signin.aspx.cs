using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            log_error_lab.Text = "";
        }

        protected void signin_btn_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");

            var em = log_email_txt.Text.Trim();
            var pass = log_pass_txt.Text.Trim();

            var table = dataAccess.Select(TableName: "Registration", WhereProp: new string[] { "email", "password" }, WhereValues: new string[] { em, pass });

            if (table.Rows.Count == 1)
            {
                Session["UserId"] = table.Rows[0][0].ToString();
                Session["Email"] = table.Rows[0][5].ToString();
                Session["UserGroup"] = table.Rows[0][7].ToString();

                Response.Redirect("~/Default.aspx");
            }
            else
            {
                log_error_lab.Text = "Please enter another coorect email and password";
            }
        }

        protected void log_cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}