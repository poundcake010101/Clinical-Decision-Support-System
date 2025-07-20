using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class DoctorForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void DoctorBackButton_Click(object sender, EventArgs e)
        {
            //Redirecting to SignUp form
            Response.Redirect("LogInForm.aspx");
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Check if the row is a data row (not header, footer, etc.)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.BackColor = System.Drawing.Color.LightGray;

            }
        }

        protected void AppointmentButton_Click(object sender, EventArgs e)
        {
            // Set the data source of the GridView
            GridView1.DataSourceID = "SqlDataSource1";
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

        protected void DoctorSubmitButton_Click(object sender, EventArgs e)
        {
            string appointmentId = SeatchTXT.Text.Trim(); // Trim to remove extra spaces

            if (!string.IsNullOrEmpty(appointmentId))
            {
                // Ensure appointmentId is a valid integer before proceeding
                if (int.TryParse(appointmentId, out int validAppointmentId))
                {
                    try
                    {
                        // Define the connection string (ensure it's correct for your environment)
                        using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True"))
                        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
                        {
                            con.Open();

                            // Update query to set 'Attended' to 'Yes' for the specific appointment
                            string query = "UPDATE [Appointment] SET Attended = 'Yes' WHERE Appointment_ID = @appointmentID";

                            using (SqlCommand com = new SqlCommand(query, con))
                            {
                                // Add the appointment ID parameter (as an integer)
                                com.Parameters.AddWithValue("@appointmentID", validAppointmentId);

                                // Execute the query
                                int rowsAffected = com.ExecuteNonQuery();

                                // Check if any rows were updated
                                if (rowsAffected > 0)
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Appointment status updated successfully.');", true);
                                }
                                else
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No appointment found with the given Appointment ID.');", true);
                                }
                            }
                        }
                    }
                    catch (SqlException sqlEx)
                    {
                        // Handle SQL exceptions
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database Error: " + sqlEx.Message.Replace("'", "\\'") + "');", true);
                    }
                    catch (Exception ex)
                    {
                        // Handle general exceptions
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "\\'") + "');", true);
                    }

                    // Redirect to SeePatientForm with the Appointment_ID as a query parameter
                    Response.Redirect("SeePatientForm.aspx?Appointment_ID=" + Server.UrlEncode(appointmentId));
                }
                else
                {
                    // Show an error if Appointment_ID is not a valid integer
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid numeric Appointment ID.');", true);
                }
            }
            else
            {
                // Show an error if Appointment_ID is empty
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid Appointment ID.');", true);
            }
        }
    }
}