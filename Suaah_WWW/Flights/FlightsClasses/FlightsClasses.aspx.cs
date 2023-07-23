using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.FlightsClasses
{
    public partial class FlightsClasses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");

            DataTable dt = new DataTable();
            try
            {
                dt = dataAccess.Procedure("select_all_flightclass").Copy();
            }
            catch (Exception ex)
            {

            }
            dt.TableName = "flightsclasses";
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            flightsClasses_gr.DataSource = ds.Tables["flightsclasses"];
            flightsClasses_gr.DataBind();

        }
        protected void flightClasses_gr_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(flightsClasses_gr.Rows[flightsClasses_gr.SelectedIndex].Cells[1].Text);

            Session["FlightsClassesId"] = id;
            Response.Redirect("FlightsClassesUpdate.aspx");
        }

        protected void crt_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightsClassesCreate.aspx");

        }
    }
}