using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class TreatmentForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True");
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            displayMeds();
            if (!IsPostBack)
            {
                // Retrieve the diagnosis from the query string
                string selectedDiagnosis = Request.QueryString["diagnosis"];

                if (!string.IsNullOrEmpty(selectedDiagnosis))
                {
                    // Fetch the medication instructions based on the selected diagnosis
                    FetchMedicationInstructions(selectedDiagnosis);
                }
                else
                {
                    // No diagnosis was passed, display an error message
                    MessageDoc.Text = "No diagnosis selected.";
                    MessageDoc.Visible = true;
                }
            }

        }


        private void FetchMedicationInstructions(string diagnosis)
        {
            // Check for specific diagnosis and recommend corresponding medications
            if (diagnosis.Equals("Influenza", StringComparison.OrdinalIgnoreCase))
            {
                MessageDoc.Text = "Recommended Medications for Influenza: Antiviral medications";
            }
            else if (diagnosis.Equals("Depression", StringComparison.OrdinalIgnoreCase))
            {
                MessageDoc.Text = "Recommended Medications for Depression: Antidepressants";
            }
            else if (diagnosis.Equals("Migraine", StringComparison.OrdinalIgnoreCase))
            {
                MessageDoc.Text = "Recommended Medications for Migraine: Triptans, Ergotamine";
            }
            else if (diagnosis.Equals("Arthritis", StringComparison.OrdinalIgnoreCase))
            {
                MessageDoc.Text = "Recommended Medications for Arthritis: NSAIDs, DMARDs, Corticosteroids";
            }
            else if (diagnosis.Equals("Diabetes", StringComparison.OrdinalIgnoreCase))
            {
                MessageDoc.Text = "Recommended Medications for Diabetes: Insulin, Metformin, Sulfonylureas";
            }
            else if (diagnosis.Equals("Heart attack", StringComparison.OrdinalIgnoreCase))
            {
                MessageDoc.Text = "Recommended Medications for Heart Attack: Aspirin, Nitroglycerin, Beta-blockers";
            }
            else
            {
                MessageDoc.Text = "No specific medication recommendations found for the selected diagnosis.";
            }

            // Make the message visible
            MessageDoc.Visible = true;
        }
        public void displayMeds()
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.Columns.Clear();

            // Add columns for Doctor data
            GridView1.Columns.Add(new BoundField { DataField = "Medication_ID", HeaderText = "Medication ID" });
            GridView1.Columns.Add(new BoundField { DataField = "Medicine_Name ", HeaderText = "Medicine Name " });
            GridView1.Columns.Add(new BoundField { DataField = "Medication_Guideline", HeaderText = "Medication Guideline" });
            GridView1.Columns.Add(new BoundField { DataField = "Quantity", HeaderText = "Quantity" });
            GridView1.DataBind();
            GridView1.Visible = true;
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeePatientForm.aspx");
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Check if the row is a data row (not header, footer, etc.)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.BackColor = System.Drawing.Color.LightGray;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string medicationName = NamePrescribTxt.Text; // Medication name entered by the doctor
            int prescribedQuantity = int.Parse(QuantityTxt.Text); // Quantity to prescribe

            if (!string.IsNullOrEmpty(medicationName) && prescribedQuantity > 0)
            {
                // Call the method to update the medication quantity based on the medication name
                UpdateMedicationQuantityByName(medicationName, prescribedQuantity);
                NamePrescribTxt.Text = string.Empty;
                QuantityTxt.Text = string.Empty;
            }
            else
            {
                lblMessage.Text = "Please enter a valid medication name and quantity.";
            }

        }
        private void UpdateMedicationQuantityByName(string medicationName, int prescribedQuantity)
        {
            string query = "SELECT Quantity FROM Medication WHERE Medicine_Name = @MedicineName";

            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\PoundCake\Documents\Clinical Decision Support System\App_Data\CDSSDatabase.mdf;Integrated Security=True"))
               //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CDSSDatabase.mdf;Integrated Security=True");
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MedicineName", medicationName);

                try
                {
                    con.Open();
                    object result = cmd.ExecuteScalar(); // Get the current quantity of the medication

                    if (result != null)
                    {
                        int currentQuantity = Convert.ToInt32(result);

                        if (prescribedQuantity > currentQuantity)
                        {
                            lblMessage.Text = "Not enough stock.";
                        }
                        else
                        {
                            // Decrease the quantity
                            string updateQuery = "UPDATE Medication SET Quantity = Quantity - @PrescribedQuantity WHERE Medicine_Name = @MedicineName";
                            SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                            updateCmd.Parameters.AddWithValue("@PrescribedQuantity", prescribedQuantity);
                            updateCmd.Parameters.AddWithValue("@MedicineName", medicationName);

                            updateCmd.ExecuteNonQuery(); // Execute the update query

                            lblMessage.Text = "Medication prescribed successfully!";
                            displayMeds(); // Refresh the GridView after updating
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Medication not found.";
                    }
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                }
            }
        }

        protected void NextPatientButton_Click(object sender, EventArgs e)
        {

            // Redirect to login form
            Response.Redirect("DoctorForm.aspx");
        }

        protected void BackToLogin_Click(object sender, EventArgs e)
        {
            // Redirect to login form
            Response.Redirect("LogInForm.aspx");
        }
    }
}