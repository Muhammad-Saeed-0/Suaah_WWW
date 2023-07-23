using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.Flights
{
    public partial class FlightUpdate : System.Web.UI.Page
    {
        private static DataSet ds;
        private static DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["FlightId"]);
            DataTable dt = new DataTable();
            DataTable airline = new DataTable();
            DataTable airport = new DataTable();

            try
            {
                dt = dataAccess.Procedure("select_flight", new string[] { "id" }, new string[] { id.ToString() }).Copy();
                airline = dataAccess.Procedure("select_all_airline").Copy();
                airport = dataAccess.Procedure("select_all_airport").Copy();
            }
            catch (Exception ex)
            {

            }
            dt.TableName = "flight";
            airline.TableName = "airline";
            airport.TableName = "airport";
            ds = new DataSet();
            ds.Tables.Add(dt);
            ds.Tables.Add(airline);
            ds.Tables.Add(airport);
            if (ds.Tables["flight"].Rows.Count > 0)
            {

                if (!IsPostBack)
                {
                    DGate_txt.Text = ds.Tables["flight"].Rows[0].ItemArray[1].ToString();
                    AGate_txt.Text = ds.Tables["flight"].Rows[0].ItemArray[2].ToString();
                    Stops_txt.Text = ds.Tables["flight"].Rows[0].ItemArray[3].ToString();
                    Leave_txt.Text = Convert.ToDateTime(ds.Tables["flight"].Rows[0].ItemArray[4].ToString()).ToString("yyyy-MM-ddThh:mm");
                    airline_lst.DataSource = ds.Tables["airline"];
                    airline_lst.DataValueField = "Code";
                    airline_lst.DataTextField = "Name";
                    airline_lst.DataBind();
                    airline_lst.SelectedIndex = airline_lst.Items.IndexOf(airline_lst.Items.FindByValue(ds.Tables["flight"].Rows[0].ItemArray[5].ToString()));
                    DAirport_lst.DataSource = ds.Tables["airport"];
                    DAirport_lst.DataValueField = "Id";
                    DAirport_lst.DataTextField = "Name";
                    DAirport_lst.DataBind();
                    DAirport_lst.SelectedIndex = DAirport_lst.Items.IndexOf(DAirport_lst.Items.FindByValue(ds.Tables["flight"].Rows[0].ItemArray[6].ToString()));
                    AAirport_lst.DataSource = ds.Tables["airport"];
                    AAirport_lst.DataValueField = "Id";
                    AAirport_lst.DataTextField = "Name";
                    AAirport_lst.DataBind();
                    AAirport_lst.SelectedIndex = AAirport_lst.Items.IndexOf(AAirport_lst.Items.FindByValue(ds.Tables["flight"].Rows[0].ItemArray[7].ToString()));

                }
            }
            else
            {

            }
        }

        protected void upd_btn_Click(object sender, EventArgs e)
        {
            if (DAirport_lst.Items[DAirport_lst.SelectedIndex].Value.Trim() != AAirport_lst.Items[AAirport_lst.SelectedIndex].Value.Trim())
            {
                string[] values =
                {
            DGate_txt.Text.Trim(),
            AGate_txt.Text.Trim(),
            Stops_txt.Text.Trim(),
            Convert.ToDateTime( Leave_txt.Text.Trim()).ToString(),
            airline_lst.Items[airline_lst.SelectedIndex].Value.Trim(),
            DAirport_lst.Items[DAirport_lst.SelectedIndex].Value.Trim(),
            AAirport_lst.Items[AAirport_lst.SelectedIndex].Value.Trim(),
            ds.Tables["flight"].Rows[0].ItemArray[0].ToString()
        };
                string[] prop =
                {
            "dgate",
            "agate",
            "stops",
            "leave",
            "airline",
            "dair",
            "aair",
            "id"
        };
                try
                {
                    dataAccess.Procedure("update_flight", prop, values);
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

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = dataAccess.Procedure("select_all_flightclass");
                foreach (DataRow dr in table.Rows)
                {
                    if (dr.ItemArray[2].ToString() == ds.Tables["flight"].Rows[0].ItemArray[0].ToString())
                        dataAccess.Procedure("delete_flightclass", new string[] { "id" }, new string[] { dr.ItemArray[0].ToString() });
                }
                dataAccess.Procedure("delete_flight", new string[] { "id" }, new string[] { ds.Tables["flight"].Rows[0].ItemArray[0].ToString() });
                Response.Redirect("Flights.aspx");
            }
            catch (Exception ex)
            {
                error_lb.Text = ex.Message;

            }
        }
    }
}