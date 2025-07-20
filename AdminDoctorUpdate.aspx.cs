using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class AdminDoctorUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter adap;

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("AdminForm.aspx");
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string Specialisation = SDocSpeTxt.Text;
            string Schedule = DocSchetxt.Text;
            string Availability = DocAvaitxt.Text;
            int Doctor_ID = int.Parse(DocIDTxt.Text); // Ensure valid Doctor ID is entered

            try
            {
                // Assuming 'con' is your SqlConnection object initialized elsewhere
                con.Open();

                // Corrected update query for Doctor table
                string updateQuery = "UPDATE Doctor SET Specialisation = @Specialisation, Schedule = @Schedule, Availability = @Availability WHERE Doctor_ID = @Doctor_ID";
                SqlCommand com = new SqlCommand(updateQuery, con);

                // Add parameters with the values from the textboxes
                com.Parameters.AddWithValue("@Specialisation", Specialisation);
                com.Parameters.AddWithValue("@Schedule", Schedule);
                com.Parameters.AddWithValue("@Availability", Availability);
                com.Parameters.AddWithValue("@Doctor_ID", Doctor_ID);

                // Execute the query
                int rowsAffected = com.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    // Notify the user and redirect after success
                    string script = "alert('Doctor Information Updated Successfully'); window.location='AdminForm.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
                }
                else
                {
                    // If no rows were updated, show a message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records updated. Check Doctor_ID.');", true);
                }
            }
            catch (SqlException sqlEx)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database Error: " + sqlEx.Message.Replace("'", "\\'") + "');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "\\'") + "');", true);
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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            int Doctor_ID = int.Parse(DocIDTxt.Text); // Ensure valid Doctor ID is entered

            try
            {
                // Assuming 'con' is your SqlConnection object initialized elsewhere
                con.Open();

                // Use parameterized query to avoid SQL injection
                string deleteQuery = "DELETE FROM Doctor WHERE Doctor_ID = @Doctor_ID";
                SqlCommand com = new SqlCommand(deleteQuery, con);

                // Add the parameter for Doctor_ID
                com.Parameters.AddWithValue("@Doctor_ID", Doctor_ID);

                // Execute the query
                com.ExecuteNonQuery();

                // Notify the user and redirect after success
                string script = "alert('Doctor Record Deleted Successfully'); window.location='AdminForm.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
            }
            catch (SqlException sqlEx)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database Error: " + sqlEx.Message.Replace("'", "\\'") + "');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "\\'") + "');", true);
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
    }
}