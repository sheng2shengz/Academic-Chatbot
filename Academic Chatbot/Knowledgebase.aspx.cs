using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v3;
using Google.Apis.Drive.v3.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System.IO;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Dropbox.Api;

namespace Academic_Chatbot
{
    public partial class Knowledgebase : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
                Response.Redirect("Login.aspx");

            if (!Page.IsPostBack)
            {
                if (Session["userType"].ToString() == "1")
                {
                    left_div.Visible = false;
                    right_div.Visible = false;
                    LI_div.Visible = true;
                    FYP_div.Visible = true;
                    //li_lastupdated.Visible = true;
                    //fyp_lastupdated.Visible = true;
                }
                else if (Session["userType"].ToString() == "2")
                {
                    left_div.Visible = true;
                    right_div.Visible = true;
                    LI_div.Visible = false;
                    FYP_div.Visible = true;
                    //li_lastupdated.Visible = false;
                    //fyp_lastupdated.Visible = true;
                }
                else if (Session["userType"].ToString() == "3")
                {
                    left_div.Visible = true;
                    right_div.Visible = true;
                    LI_div.Visible = true;
                    FYP_div.Visible = false;
                    //li_lastupdated.Visible = true;
                    //fyp_lastupdated.Visible = false;
                }
            }
        }

        protected void UpdateFYP_Button_Click(object sender, EventArgs e)
        {
            if (FYP_FileUpload.HasFile == true)
            {
                HttpPostedFile file = Request.Files["FYP_FileUpload"];
                
                string fname = "fyp_" + cohort_dropdownlist.SelectedValue.ToString() + "timeline.pdf";
                FYP_FileUpload.SaveAs(Server.MapPath(Path.Combine("~/Timelines_PDF/", fname)));

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal1", "$('#myModal1').modal();", true);
                upModal.Update();
            }
        }

        protected void UpdateLI_Button_Click(object sender, EventArgs e)
        {
            if (LI_FileUpload.HasFile == true)
            {
                HttpPostedFile file = Request.Files["LI_FileUpload"];

                string fname = "li_" + cohort_dropdownlist.SelectedValue.ToString() + "timeline.pdf";
                LI_FileUpload.SaveAs(Server.MapPath(Path.Combine("~/Timelines_PDF/", fname)));

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal1", "$('#myModal1').modal();", true);
                upModal.Update();
            }
        }

        protected void continue_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("Knowledgebase.aspx");
        }
    }
}