using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.FlightClasses
{
    public partial class FlightClasses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
            DataTable dt = new DataTable();
            try
            {
                dt = dataAccess.Procedure("select_all_class").Copy();
            }
            catch (Exception ex)
            {

            }
            dt.TableName = "flightClasses";
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            flightClasses_gr.DataSource = ds.Tables["flightClasses"];
            flightClasses_gr.DataBind();
        }


        protected void flightClasses_gr_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(flightClasses_gr.Rows[flightClasses_gr.SelectedIndex].Cells[1].Text);

            Session["FlightClassId"] = id;
            Response.Redirect("FlightClassUpdate.aspx");
        }

        protected void crt_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightClassCreate.aspx");
        }
    }
}