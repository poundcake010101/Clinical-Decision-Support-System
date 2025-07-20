using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class LogInForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        SqlCommand com;


        protected void LoginButton2_Click(object sender, EventArgs e)
        {


            string selectedUser = DropDownList1.SelectedItem.ToString();
            string username = UserNameTextBox.Text;
            string pass = PasswordTextBox.Text;
            if (selectedUser == "Patient")
            {
                try
                {
                    con.Open();
                    com = new SqlCommand("SELECT * FROM [Patient] WHERE [Email] = '" + username + "' AND [Password] = '" + pass + "'", con);
                    SqlDataReader reader = com.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // User found, redirect to PatientForm
                        Response.Redirect("PatientForm.aspx");
                    }
                    else
                    {
                        // No user found, show error message
                        Response.Write("<script>alert('Invalid email or password');</script>");
                    }

                    reader.Close();
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
            else if (selectedUser == "Doctor")
            {
                try
                {
                    con.Open();
                    com = new SqlCommand("SELECT * FROM [Staff] WHERE [Email] = '" + username + "' AND [Password] = '" + pass + "'", con);
                    SqlDataReader reader = com.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // User found, redirect to PatientForm
                        Response.Redirect("DoctorForm.aspx");
                    }
                    else
                    {
                        // No user found, show error message
                        Response.Write("<script>alert('Invalid email or password');</script>");
                    }

                    reader.Close();
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
            else if (selectedUser == "Admin")
            {
                try
                {
                    con.Open();
                    com = new SqlCommand("SELECT * FROM [Staff] WHERE [Email] = '" + username + "' AND [Password] = '" + pass + "'", con);
                    SqlDataReader reader = com.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // User found, redirect to PatientForm
                        Response.Redirect("AdminForm.aspx");
                    }
                    else
                    {
                        // No user found, show error message
                        Response.Write("<script>alert('Invalid email or password');</script>");
                    }

                    reader.Close();
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
        }

        protected void HomeLogInButton_Click(object sender, EventArgs e)
        {
            //Redirecting to SignUp form
            Response.Redirect("WelcomeForm.aspx");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}