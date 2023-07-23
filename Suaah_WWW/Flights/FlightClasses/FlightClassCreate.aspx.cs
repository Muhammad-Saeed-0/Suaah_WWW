using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.FlightClasses
{
    public partial class FlightClassCreate : System.Web.UI.Page
    {
        private static DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void crt_btn_Click(object sender, EventArgs e)
        {
            string[] values =
             {
            Class_txt.Text.Trim(),
        };
            string[] prop =
            {
            "name",
        };
            try
            {
                dataAccess.Procedure("insert_class", prop, values);
                Response.Redirect("FlightClasses.aspx");

            }
            catch (Exception ex)
            {
                error_lb.Text = ex.Message;
            }

        }
    }
}