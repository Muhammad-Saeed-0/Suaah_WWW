using System;
using System.Web.UI;

namespace Suaah_WWW
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            logout_btn.Visible = false;
            regist_lab.Visible = false;

            if (Session["Email"] != null)
            {
                regist_btn.Visible = false;

                regist_lab.Visible = true;
                regist_lab.Text = "Hi, " + Session["Email"];

                log_btn.Visible = false;
                logout_btn.Visible = true;
            }
        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            logout_btn.Visible = false;
            regist_btn.Visible = true;
            regist_lab.Text = "";
            log_btn.Visible = true;

            Session.RemoveAll();
            Session.Abandon();

            Response.Redirect("~/Default.aspx");
        }
    }
}