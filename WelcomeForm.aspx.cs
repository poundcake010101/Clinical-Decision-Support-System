using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical_Decision_Support_System
{
    public partial class WelcomeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //Redirecting to login form
            Response.Redirect("LogInForm.aspx");
        }

        protected void SignUPButton_Click(object sender, EventArgs e)
        {
            //Redirecting to SignUp form
            Response.Redirect("SignUpForm.aspx");
        }
        protected void ButtonExit_Click(object sender, EventArgs e)
        {

        }
        protected void ButtonClose_Click(object sender, EventArgs e)
        {
            //Close the program or window
            ClientScript.RegisterStartupScript(this.GetType(), "closeWindow", "window.close();", true);

        }
    }
}