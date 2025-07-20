using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class AdminUpdateDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter adap;

        protected void BackAdmin_Click(object sender, EventArgs e)
        {

            //Redirecting to Admin form
            Response.Redirect("AdminForm.aspx");
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string Name = NameUpdateTXTB.Text;
            string Surname = sURNAMEtxtb.Text;
            string Email = EMailUpdateTXTB.Text;
            string PhysicalAddress = ADDRESSUpdateTXTB.Text;
            string PatientID = PatientIDtxt.Text;

            try
            {
                con.Open();

                // Use parameterized query to avoid SQL injection
                com = new SqlCommand("UPDATE [Patient] SET F_Name = @Name, L_Name = @Surname, Email = @Email, Address = @PhysicalAddress WHERE Patient_ID = @PatientID", con);
                com.Parameters.AddWithValue("@Name", Name);
                com.Parameters.AddWithValue("@Surname", Surname);
                com.Parameters.AddWithValue("@Email", Email);
                com.Parameters.AddWithValue("@PhysicalAddress", PhysicalAddress);
                com.Parameters.AddWithValue("@PatientID", PatientID);

                com.ExecuteNonQuery();

                // Show the alert and then redirect after closing the alert
                string script = "alert('Information Updated Successfully'); window.location='AdminForm.aspx';";
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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string PatientID = PatientIDtxt.Text;

            try
            {
                con.Open();

                // Use parameterized query to avoid SQL injection
                com = new SqlCommand("DELETE FROM [Patient] WHERE Patient_ID = @PatientID", con);
                com.Parameters.AddWithValue("@PatientID", PatientID);

                com.ExecuteNonQuery();

                // Show the alert and then redirect after closing the alert
                string script = "alert('Record Deleted Successfully'); window.location='AdminForm.aspx';";
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