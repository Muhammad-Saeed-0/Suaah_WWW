using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.Flights
{
    public partial class FlightCreate : System.Web.UI.Page
    {
        private static DataSet ds;
        private static DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");


        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable airlines = new DataTable();
            DataTable airport = new DataTable();

            try
            {
                airlines = dataAccess.Procedure("select_all_airline").Copy();
                airport = dataAccess.Procedure("select_all_airport").Copy();
            }
            catch (Exception ex)
            {

            }
            airlines.TableName = "airline";
            airport.TableName = "airport";
            ds = new DataSet();
            ds.Tables.Add(airlines);
            ds.Tables.Add(airport);
            if (!IsPostBack)
            {
                airline_lst.DataSource = ds.Tables["airline"];
                airline_lst.DataValueField = "Code";
                airline_lst.DataTextField = "Name";
                airline_lst.DataBind();
                DAirport_lst.DataSource = ds.Tables["airport"];
                DAirport_lst.DataValueField = "Id";
                DAirport_lst.DataTextField = "Name";
                DAirport_lst.DataBind();
                AAirport_lst.DataSource = ds.Tables["airport"];
                AAirport_lst.DataValueField = "Id";
                AAirport_lst.DataTextField = "Name";
                AAirport_lst.DataBind();
            }

        }

        protected void crt_btn_Click(object sender, EventArgs e)
        {
            if (DAirport_lst.Items[DAirport_lst.SelectedIndex].Value.Trim() != AAirport_lst.Items[AAirport_lst.SelectedIndex].Value.Trim())
            {
                string[] values =
                {
            DGate_txt.Text.Trim(),
            AGate_txt.Text.Trim(),
            Stops_txt.Text.Trim(),
            Convert.ToDateTime(Leave_txt.Text.Trim()).ToString(),
            airline_lst.Items[airline_lst.SelectedIndex].Value.Trim(),
            DAirport_lst.Items[DAirport_lst.SelectedIndex].Value.Trim(),
            AAirport_lst.Items[AAirport_lst.SelectedIndex].Value.Trim()
        };
                string[] prop =
                {
            "dgate",
            "agate",
            "stops",
            "leave",
            "airline",
            "dair",
            "aair"
        };
                try
                {
                    dataAccess.Procedure("insert_flight", prop, values);
                    Response.Redirect("Flights.aspx");
                }
                catch (Exception ex)
                {
                    error_lb.Text = ex.Message;
                }

            }
            else
            {
                error_lb.Text = "The departing airport must be different than the arriving airport";
            }
        }
    }
}