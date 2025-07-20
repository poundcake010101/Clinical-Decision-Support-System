using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class AdminForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Check if the row is a data row (not header, footer, etc.)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.BackColor = System.Drawing.Color.LightGray;

            }
        }

        protected void BackButtonAdmin_Click(object sender, EventArgs e)
        {
            //Redirecting to Login form
            Response.Redirect("LogInForm.aspx");
        }
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter adap;



        protected void ViewPatientsButton_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource2";
            GridView1.Columns.Clear(); // Clear existing columns

            // Add columns for Patient data
            GridView1.Columns.Add(new BoundField { DataField = "Patient_ID", HeaderText = "Patient ID" });
            GridView1.Columns.Add(new BoundField { DataField = "F_Name", HeaderText = "First Name" });
            GridView1.Columns.Add(new BoundField { DataField = "L_Name", HeaderText = "Last Name" });
            GridView1.Columns.Add(new BoundField { DataField = "Email", HeaderText = "Email" });
            GridView1.Columns.Add(new BoundField { DataField = "Address", HeaderText = "Address" });
            GridView1.Columns.Add(new BoundField { DataField = "ID_number", HeaderText = "ID Number" });

            GridView1.DataBind(); // Bind the data
            GridView1.Visible = true; // Show GridView
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ViewDoctorButton_Click(object sender, EventArgs e)
        {
            // Set the data source of the GridView
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.Columns.Clear();

            // Add columns for Doctor data
            GridView1.Columns.Add(new BoundField { DataField = "Doctor_ID", HeaderText = "Doctor ID" });
            GridView1.Columns.Add(new BoundField { DataField = "F_Name", HeaderText = "First Name" });
            GridView1.Columns.Add(new BoundField { DataField = "L_Name", HeaderText = "Last Name" });
            GridView1.Columns.Add(new BoundField { DataField = "Specialisation", HeaderText = "Specialisation" });
            GridView1.Columns.Add(new BoundField { DataField = "Schedule", HeaderText = "Schedule" });
            GridView1.Columns.Add(new BoundField { DataField = "Availability", HeaderText = "Availability" });


            GridView1.DataBind();
            GridView1.Visible = true;
        }

        protected void AppointmentButton_Click(object sender, EventArgs e)
        {
            // Set the data source of the GridView
            GridView1.DataSourceID = "SqlDataSource3";
            GridView1.Columns.Clear();

            // Add columns for Doctor data
            GridView1.Columns.Add(new BoundField { DataField = "Appointment_ID", HeaderText = "Appointment_ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Name", HeaderText = "Name" });
            GridView1.Columns.Add(new BoundField { DataField = "Surname", HeaderText = "Surname" });
            GridView1.Columns.Add(new BoundField { DataField = "Date", HeaderText = "Date" });
            GridView1.Columns.Add(new BoundField { DataField = "Symptoms", HeaderText = "Symptoms" });
            GridView1.Columns.Add(new BoundField { DataField = "Attended", HeaderText = "Attended" });
            GridView1.DataBind();
            GridView1.Visible = true;
        }

        protected void ButtonUpdatePatientsDetails_Click(object sender, EventArgs e)
        {
            //Redirecting to UpdateDetails form
            Response.Redirect("AdminUpdateDetails.aspx");
        }

        protected void UpdateDocDetailsButton_Click(object sender, EventArgs e)
        {
            //Redirecting to Doctor UpdateDetails form
            Response.Redirect("AdminDoctorUpdate.aspx");
        }

        protected void DrugManagementForm_Click(object sender, EventArgs e)
        {
            displayMeds();
        }
        public void displayMeds()
        {
            GridView1.DataSourceID = "SqlDataSource4";
            GridView1.Columns.Clear();

            // Add columns for Doctor data
            GridView1.Columns.Add(new BoundField { DataField = "Medication_ID", HeaderText = "Medication ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Medicine_Name ", HeaderText = "Medicine Name " });
            GridView1.Columns.Add(new BoundField { DataField = "Medication_Guideline", HeaderText = "Medication Guideline" });
            GridView1.Columns.Add(new BoundField { DataField = "Quantity", HeaderText = "Quantity" });
            GridView1.DataBind();
            GridView1.Visible = true;
        }

        protected void GenerateReportButton_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource5";
            GridView1.Columns.Clear();

            // Add columns for Doctor data
            GridView1.Columns.Add(new BoundField { DataField = "Report_ID", HeaderText = "Report_ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Appointment_ID", HeaderText = "Appointment_ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Appointment_Name", HeaderText = "Appointment_Name" });
            GridView1.Columns.Add(new BoundField { DataField = "Appointment_Date", HeaderText = "Appointment_Date" });
            GridView1.Columns.Add(new BoundField { DataField = "Doctor_ID", HeaderText = "Doctor_ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Doctor_Name", HeaderText = "Doctor_Name" });
            GridView1.Columns.Add(new BoundField { DataField = "Diagonosis_ID", HeaderText = "Diagonosis_ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Medication_ID", HeaderText = "Medication_ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Medication_Quantity", HeaderText = "Medication_Quantity" });

            GridView1.DataBind();
            GridView1.Visible = true;
        }
    }
}