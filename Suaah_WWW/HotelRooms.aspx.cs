using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suaah_WWW
{
    public partial class HotelRooms : System.Web.UI.Page
    {
        DataAccess dataAccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            dataAccess = new DataAccess("Suaah_WWWConnectionString");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LoadCombo();
        }

        public void LoadCombo()
        {
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataSource = dataAccess.Select("Hotel", new string[] { "Id", "Name" });
            DropDownList1.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hotelId = DropDownList1.SelectedValue;

            GridView4.DataSource = dataAccess.Select(TableName: "HotelRoom", WhereProp: new string[] { "HotelId" }, WhereValues: new string[] { hotelId });
            GridView4.DataBind();
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}