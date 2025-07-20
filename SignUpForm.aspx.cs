using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class SignUpForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;
        SqlDataAdapter adap;

        protected void HomeSignUpButton_Click(object sender, EventArgs e)
        {
            //Redirecting to SignUp form
            Response.Redirect("WelcomeForm.aspx");
        }

        protected void RegistrationSubmitButton_Click(object sender, EventArgs e)
        {

            string Name = NameTextBox.Text;
            string Surname = SurnameTextBox.Text;
            string Email = EMailTextBox.Text;
            string PhysicalAddress = AddressTextBox.Text;
            string IDNumber = IDNUMBERTXTBOX.Text;
            string CreatePassword = PasswordCreateTextBox.Text;
            try
            {
                con.Open();
                string query1 = "INSERT INTO [Patient] (F_Name, L_Name, Email, Address, ID_number, Password) VALUES (@Name, @Surname, @Email, @Address, @IDNumber, @Password)";
                SqlCommand com1 = new SqlCommand(query1, con);

                com1.Parameters.AddWithValue("@Name", Name);
                com1.Parameters.AddWithValue("@Surname", Surname);
                com1.Parameters.AddWithValue("@Email", Email);
                com1.Parameters.AddWithValue("@Address", PhysicalAddress);
                com1.Parameters.AddWithValue("@IDNumber", IDNumber);
                com1.Parameters.AddWithValue("@Password", CreatePassword);
                com1.ExecuteNonQuery();

                string script = "alert('successfully Registered.'); window.location='LogInForm.aspx';";
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
    }
}