using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class SeePatientForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            GridView1.Visible = false;
            if (!IsPostBack)
            {
                // Retrieve the Appointment_ID from the query string
                string appointmentID = Request.QueryString["Appointment_ID"];

                if (!string.IsNullOrEmpty(appointmentID))
                {
                    // Set the parameter for SqlDataSource
                    SqlDataSource1.SelectParameters["AppointmentID"].DefaultValue = appointmentID;

                    // Bind data to GridView
                    GridView1.DataSourceID = "SqlDataSource1";
                    GridView1.DataBind();

                    // Ensure columns are added only if GridView doesn't already have columns
                    if (GridView1.Columns.Count == 0)
                    {
                        GridView1.Columns.Add(new BoundField { DataField = "Appointment_ID", HeaderText = "Appointment_ID" });
                        GridView1.Columns.Add(new BoundField { DataField = "Name", HeaderText = "Name" });
                        GridView1.Columns.Add(new BoundField { DataField = "Surname", HeaderText = "Surname" });
                        GridView1.Columns.Add(new BoundField { DataField = "Date", HeaderText = "Date" });
                        GridView1.Columns.Add(new BoundField { DataField = "Symptoms", HeaderText = "Symptoms" });
                    }

                    GridView1.Visible = true; // Make GridView visible
                }
                else
                {
                    GridView1.Visible = false; // Hide GridView if no Appointment_ID is provided
                }
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Check if the row is a data row (not header, footer, etc.)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.BackColor = System.Drawing.Color.LightGray;

            }
        }

        protected void DoctorSubmitButton2_Click(object sender, EventArgs e)
        {
            if (DiagnosisDLB.SelectedItem != null)
            {
                string selectedDiagnosis = DiagnosisDLB.SelectedItem.Text;

                // Ensure selectedDiagnosis is correctly passed
                if (!string.IsNullOrEmpty(selectedDiagnosis))
                {
                    // Redirect to TreatmentForm.aspx and pass the selected diagnosis in the query string
                    Response.Redirect("TreatmentForm.aspx?diagnosis=" + Server.UrlEncode(selectedDiagnosis));
                }
            }

        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorForm.aspx");
        }

        protected void ViewDiagnosisbutton_Click(object sender, EventArgs e)
        {
            // Set the data source of the GridView
            GridView2.DataSourceID = "SqlDataSource3";
            GridView2.Columns.Clear();

            // Add columns for Diagnosis data
            GridView2.Columns.Add(new BoundField { DataField = "Diagonosis_ID", HeaderText = "Diagnosis ID" }); // Corrected here
            GridView2.Columns.Add(new BoundField { DataField = "Diagnosis_Desc ", HeaderText = "Diagnosis Description" });
            GridView2.Columns.Add(new BoundField { DataField = "Type_Of_Symptoms", HeaderText = "Type Of Symptoms" });

            GridView2.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = true;
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Check if the row is a data row (not header, footer, etc.)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Example: Access the data bound to the row
                // e.g., change the background color based on some condition
                e.Row.BackColor = System.Drawing.Color.LightGray;

                // You can also access individual cells
                // e.g., e.Row.Cells[0].Text = "Modified";
            }
        }
    }
}