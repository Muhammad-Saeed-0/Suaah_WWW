using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW.Flights.FlightClasses
{
    public partial class FlightClassUpdate : System.Web.UI.Page
    {
        private static DataSet ds;
        private static DataAccess dataAccess = new DataAccess("Suaah_WWWConnectionString");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["FlightClassId"]);
            DataTable dt = new DataTable();

            try
            {
                dt = dataAccess.Procedure("select_class", new string[] { "id" }, new string[] { id.ToString() }).Copy();
            }
            catch (Exception ex)
            {

            }
            dt.TableName = "flightClass";
            ds = new DataSet();
            ds.Tables.Add(dt);
            if (ds.Tables["flightClass"].Rows.Count > 0)
            {

                if (!IsPostBack)
                {
                    Class_txt.Text = ds.Tables["flightClass"].Rows[0].ItemArray[1].ToString();

                }
            }
            else
            {

            }
        }

        protected void upd_btn_Click(object sender, EventArgs e)
        {
            string[] values =
             {
            Class_txt.Text.Trim(),
            ds.Tables["flightClass"].Rows[0].ItemArray[0].ToString()
        };
            string[] prop =
            {
            "name",
            "id"
        };
            try
            {
                dataAccess.Procedure("update_class", prop, values);
                Response.Redirect("FlightClasses.aspx");

            }
            catch (Exception ex)
            {
                error_lb.Text = ex.Message;

            }

        }

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = dataAccess.Procedure("select_all_flightclass");
                foreach (DataRow dr in table.Rows)
                {
                    if (dr.ItemArray[3].ToString() == ds.Tables["flightClass"].Rows[0].ItemArray[0].ToString())
                        dataAccess.Procedure("delete_flightclass", new string[] { "id" }, new string[] { dr.ItemArray[0].ToString() });
                }
                dataAccess.Procedure("delete_class", new string[] { "id" }, new string[] { ds.Tables["flightClass"].Rows[0].ItemArray[0].ToString() });
                Response.Redirect("FlightClasses.aspx");

            }
            catch (Exception ex)
            {
                error_lb.Text = ex.Message;

            }
        }
    }
}