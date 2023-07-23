using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.Flights
{
    public partial class Flights : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
            DataTable dt = new DataTable();
            try
            {
                dt = dataAccess.Procedure("select_all_flight").Copy();
            }
            catch (Exception ex)
            {

            }
            dt.TableName = "flights";
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            flights_gr.DataSource = ds.Tables["flights"];
            flights_gr.DataBind();


        }

        protected void flights_gr_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(flights_gr.Rows[flights_gr.SelectedIndex].Cells[1].Text);

            Session["FlightId"] = id;
            Response.Redirect("FlightUpdate.aspx");

        }

        protected void crt_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightCreate.aspx");
        }
    }
}