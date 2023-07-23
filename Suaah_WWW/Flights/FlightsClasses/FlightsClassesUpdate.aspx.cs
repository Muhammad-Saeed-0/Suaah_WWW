using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.FlightsClasses
{
    public partial class FlightsClassesUpdate : System.Web.UI.Page
    {
        private static DataSet ds;
        private static DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["FlightsClassesId"]);
            DataTable dt = new DataTable();
            DataTable flights = new DataTable();
            DataTable classes = new DataTable();


            try
            {
                dt = dataAccess.Procedure("select_flightclass", new string[] { "id" }, new string[] { id.ToString() }).Copy();
                flights = dataAccess.Procedure("select_all_flight").Copy();
                classes = dataAccess.Procedure("select_all_class").Copy();

            }
            catch (Exception ex)
            {

            }
            dt.TableName = "flightclass";
            flights.TableName = "flights";
            classes.TableName = "classes";
            ds = new DataSet();
            ds.Tables.Add(dt);
            ds.Tables.Add(flights);
            ds.Tables.Add(classes);
            if (ds.Tables["flightclass"].Rows.Count > 0 && !IsPostBack)
            {
                price_txt.Text = ds.Tables["flightclass"].Rows[0].ItemArray[1].ToString();
                Flight_lst.DataSource = ds.Tables["flights"];
                Flight_lst.DataTextField = "Id";
                Flight_lst.DataValueField = "Id";
                Flight_lst.DataBind();
                Flight_lst.SelectedIndex = Flight_lst.Items.IndexOf(Flight_lst.Items.FindByValue(ds.Tables["flightclass"].Rows[0].ItemArray[2].ToString()));
                Class_lst.DataSource = ds.Tables["classes"];
                Class_lst.DataTextField = "Class";
                Class_lst.DataValueField = "ID";
                Class_lst.DataBind();
                Class_lst.SelectedIndex = Class_lst.Items.IndexOf(Class_lst.Items.FindByValue(ds.Tables["flightclass"].Rows[0].ItemArray[3].ToString()));

            }

        }

        protected void upd_btn_Click(object sender, EventArgs e)
        {
            double price = Convert.ToDouble(price_txt.Text.Trim());
            if (price > 0)
            {
                string[] values =
                {
            price.ToString(),
            Flight_lst.Items[Flight_lst.SelectedIndex].Value.Trim(),
            Class_lst.Items[Class_lst.SelectedIndex].Value.Trim(),
            ds.Tables["flightclass"].Rows[0].ItemArray[0].ToString()
        };
                string[] prop =
                {
                "price",
                "flight",
                "class",
                "id"
            };
                try
                {
                    dataAccess.Procedure("update_flightclass", prop, values);
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

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                dataAccess.Procedure("delete_flightclass", new string[] { "id" }, new string[] { ds.Tables["flightclass"].Rows[0].ItemArray[0].ToString() });
                Response.Redirect("FlightsClasses.aspx");
            }
            catch (Exception ex)
            {
                error_lb.Text = ex.Message;
            }
        }
    }
}