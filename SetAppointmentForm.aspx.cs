using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class SetAppointmentForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            display();
        }
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter adap;
        //|DataDirectory|
        public void display()
        {
            try
            {
                con.Open();
                com = new SqlCommand("SELECT * FROM [Appointment]", con);
                adap = new SqlDataAdapter(com);
                DataTable table = new DataTable();
                adap.Fill(table);

                //GridViewtest.DataBind(); // Bind the data to the GridView to display it
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
                // Ensure the connection is closed
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        protected void SetAppointmentButton_Click(object sender, EventArgs e)
        {
            string Name = NameAppointTXT.Text;
            string Surname = sURNAMEappointmentTXT.Text;
            string Symptoms = Diatxt.Text;
            DateTime AppointmentDate = Calendar1.SelectedDate;


            int hour = int.Parse(TimeHour.Text);
            int minute = int.Parse(TimeMinute.Text);


            AppointmentDate = AppointmentDate.AddHours(hour).AddMinutes(minute);

            try
            {
                con.Open();

                // First, insert into the Appointment table
                string query1 = "INSERT INTO [Appointment] (Name, Surname, Date, Symptoms) VALUES(@Name, @Surname, @AppointmentDate, @Symptoms)";
                SqlCommand com1 = new SqlCommand(query1, con);

                // Add parameters for Appointment table
                com1.Parameters.AddWithValue("@Name", Name);
                com1.Parameters.AddWithValue("@Surname", Surname);
                com1.Parameters.AddWithValue("@AppointmentDate", AppointmentDate);
                com1.Parameters.AddWithValue("@Symptoms", Symptoms);
                com1.ExecuteNonQuery();



                // Notify the user using ClientScript with redirect
                string script = "alert('Appointment set successfully.'); window.location='PatientForm.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            catch (SqlException sqlEx)
            {
                // Handle SQL errors
                string errorScript = "alert('Database Error: " + sqlEx.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", errorScript, true);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                string errorScript = "alert('Error: " + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", errorScript, true);
            }
            finally
            {
                // Ensure the connection is closed
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        protected void UpdateAppointmentButton_Click(object sender, EventArgs e)
        {
            string Name = NameAppointTXT.Text;
            string Surname = sURNAMEappointmentTXT.Text;
            string Symptoms = Diatxt.Text;
            DateTime AppointmentDate = Calendar1.SelectedDate;
            int hour = int.Parse(TimeHour.Text);
            int minute = int.Parse(TimeMinute.Text);


            AppointmentDate = AppointmentDate.AddHours(hour).AddMinutes(minute);

            try
            {
                con.Open();

                // Update query for Appointment table
                string query = "UPDATE [Appointment] SET Name = @Name, Surname = @Surname, Date = @AppointmentDate, Symptoms = @Symptoms WHERE Name = @Name";
                SqlCommand com = new SqlCommand(query, con);

                // Add parameters to prevent SQL injection
                com.Parameters.AddWithValue("@Name", Name);
                com.Parameters.AddWithValue("@Surname", Surname);
                com.Parameters.AddWithValue("@AppointmentDate", AppointmentDate);
                com.Parameters.AddWithValue("@Symptoms", Symptoms);

                // Execute the update query
                int rowsAffected = com.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    // Notify the user on successful update
                    string script = "alert('Appointment updated successfully.'); window.location='PatientForm.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
                else
                {
                    // Notify the user if no rows were affected
                    string errorScript = "alert('Appointment not found.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", errorScript, true);
                }
            }
            catch (SqlException sqlEx)
            {
                // Handle SQL errors
                string errorScript = "alert('Database Error: " + sqlEx.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", errorScript, true);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                string errorScript = "alert('Error: " + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", errorScript, true);
            }
            finally
            {
                // Ensure the connection is closed
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        protected void CancelAppointmentButton_Click(object sender, EventArgs e)
        {
            string Name = NameAppointTXT.Text;  // Assuming the Name field is used to identify the appointment

            try
            {
                con.Open();

                // Use parameterized query for deleting an appointment
                string query = "DELETE FROM [Appointment] WHERE Name = @Name";
                com = new SqlCommand(query, con);

                // Add parameters
                com.Parameters.AddWithValue("@Name", Name);

                // Execute the delete query and check for affected rows
                int rowsAffected = com.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    // Notify the user using combined alert and redirect
                    string script = "alert('Appointment cancelled successfully.'); window.location='PatientForm.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No appointment found with the given name.');", true);
                }

                display(); // Refresh data after deletion
            }
            catch (SqlException sqlEx)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database Error: " + sqlEx.Message + "');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        protected void BackB_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientForm.aspx");
        }
        protected void GridViewtest_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}