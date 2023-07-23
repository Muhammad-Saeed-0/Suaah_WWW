using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.FlightsClasses
{
    public partial class FlightsClassesCreate : System.Web.UI.Page
    {
        private static DataSet ds;
        private static DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable flights = new DataTable();
            DataTable classes = new DataTable();

            try
            {
                flights = dataAccess.Procedure("select_all_flight").Copy();
                classes = dataAccess.Procedure("select_all_class").Copy();

            }
            catch (Exception ex)
            {

            }
            flights.TableName = "flights";
            classes.TableName = "classes";
            ds = new DataSet();
            ds.Tables.Add(flights);
            ds.Tables.Add(classes);
            if (!IsPostBack)
            {
                Flight_lst.DataSource = ds.Tables["flights"];
                Flight_lst.DataTextField = "Id";
                Flight_lst.DataValueField = "Id";
                Flight_lst.DataBind();
                Class_lst.DataSource = ds.Tables["classes"];
                Class_lst.DataTextField = "Class";
                Class_lst.DataValueField = "ID";
                Class_lst.DataBind();

            }
        }

        protected void crt_btn_Click(object sender, EventArgs e)
        {
            double price = Convert.ToDouble(price_txt.Text.Trim());
            if (price > 0)
            {
                string[] values =
                {
            price.ToString(),
            Flight_lst.Items[Flight_lst.SelectedIndex].Value.Trim(),
            Class_lst.Items[Class_lst.SelectedIndex].Value.Trim()
        };
                string[] prop =
                {
                "price",
                "flight",
                "class"
            };
                try
                {
                    dataAccess.Procedure("insert_flightclass", prop, values);
                    Response.Redirect("FlightsClasses.aspx");

                }
                catch (Exception ex)
                {
                    error_lb.Text = ex.Message;

                }
            }
            else
            {
                error_lb.Text = "The price must be bigger than 0";
            }
        }
    }
}