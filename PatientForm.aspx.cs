using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class PatientForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Hide GridView on initial load
            GridViewPatient.Visible = false;
            // Hide the ListBox 
            AppointmentReportListBox.Visible = false;


        }
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter adap;

        protected void GridViewPatient_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.BackColor = System.Drawing.Color.LightGray;

            }
        }
        public void display()
        {
            try
            {
                con.Open();
                com = new SqlCommand("SELECT * FROM [Appointment]", con);
                adap = new SqlDataAdapter(com);
                DataTable table = new DataTable();
                adap.Fill(table);
                GridViewPatient.DataSource = table; // Set the DataSource to the filled DataTable
                GridViewPatient.DataBind(); // Bind the data to the GridView to display it
            }
            catch (SqlException sqlEx)
            {
                Response.Write("<script>alert('Database Error: " + sqlEx.Message + "');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        protected void ReportAppointmentButton_Click(object sender, EventArgs e)
        {

            AppointmentReportListBox.Items.Clear();


            string heading = "Appointment Report";
            string dateTime = DateTime.Now.ToString("f");
            //string pageNumber = "Page 1";


            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


            string query = "SELECT TOP 1 Name, Surname, Date, Symptoms FROM Appointment ORDER BY Date DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {

                    string name = reader["Name"].ToString();
                    string surname = reader["Surname"].ToString();
                    string appointmentDate = Convert.ToDateTime(reader["Date"]).ToString("yyyy-MM-dd");
                    string symptoms = reader["Symptoms"].ToString();


                    string content = $"Patient: {name} {surname}\nAppointment Date: {appointmentDate}\nSymptoms: {symptoms}";

                    // Add the report content to the ListBox with specific formatting
                    AppointmentReportListBox.Items.Add($"{dateTime}"); // Date aligned to the left
                    AppointmentReportListBox.Items.Add(""); // Empty line
                    AppointmentReportListBox.Items.Add("\t\t\t======== " + heading.PadLeft(30) + " ========");
                    AppointmentReportListBox.Items.Add(""); // Empty line
                    AppointmentReportListBox.Items.Add($"Patient: {name} {surname}");
                    AppointmentReportListBox.Items.Add(""); // Empty line
                    AppointmentReportListBox.Items.Add($"Symptoms: {symptoms}");

                }
            }

            // Show the ListBox and hide the GridView
            AppointmentReportListBox.Visible = true;
            GridViewPatient.Visible = false;
        }





        protected void BackAppointButton_Click(object sender, EventArgs e)
        {

            //Redirecting to Login form
            Response.Redirect("LogInForm.aspx");

        }



        protected void ViewAppointmentButton_Click(object sender, EventArgs e)
        {
            // Set the data source of the GridView
            GridViewPatient.DataSourceID = "SqlDataSource3";
            GridViewPatient.Columns.Clear();

            // Add columns for Doctor data
            GridViewPatient.Columns.Add(new BoundField { DataField = "Appointment_ID", HeaderText = "Appointment_ID" });
            GridViewPatient.Columns.Add(new BoundField { DataField = "Name", HeaderText = "Name" });
            GridViewPatient.Columns.Add(new BoundField { DataField = "Surname", HeaderText = "Surname" });
            GridViewPatient.Columns.Add(new BoundField { DataField = "Date", HeaderText = "Date" });
            GridViewPatient.Columns.Add(new BoundField { DataField = "Symptoms", HeaderText = "Symptoms" });
            GridViewPatient.DataBind();
            GridViewPatient.Visible = true;
        }

        protected void SetNewAppointment_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetAppointmentForm.aspx");
        }
        protected void appointmentID_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewPatient_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}