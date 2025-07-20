<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientForm.aspx.cs" Inherits="Clinical_Decision_Support_System.PatientForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('WhatsApp Image 2024-08-15 at 15.30.32.jpeg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
<head runat="server">
    <title>Patient Dashboard - Clinical Decision Support System</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            width: 1000px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: space-between; 
            flex-direction: column;
        }

        .form-header {
            font-size: xx-large;
            text-align: center;
            margin-bottom: 30px;
            color: #fff; 
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); 
        }

        .button-group {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            margin-right: 30px;
        }

        button, .asp-button {
            width: 255px;
            padding: 15px;
            font-size: large;
            background-color: #17a2b8; 
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            margin-bottom: 20px; 
        }

        button:hover, .asp-button:hover {
            background-color: #138496;
        }

        .gridview-container {
            width: 600px;
            text-align: center;
        }

        .gridview-container .asp-gridview {
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="form-header" style="color: #000000">
                Welcome Patient
            </div>

            <div style="display: flex; justify-content: space-between;">
                <div class="button-group">
                    <asp:Button ID="ViewAppointmentButton" runat="server" Text="View Appointments" OnClick="ViewAppointmentButton_Click" CssClass="asp-button" />
                    
                    <asp:Button ID="SetNewAppointment" runat="server" OnClick="SetNewAppointment_Click" Text="Set Appointment" CssClass="asp-button" />
                   
                    <asp:Button ID="ReportAppointmentButton" runat="server" OnClick="ReportAppointmentButton_Click" Text="Report" CssClass="asp-button" />

                    <asp:Button ID="BackAppointButton" runat="server" OnClick="BackAppointButton_Click" Text="Back" CssClass="asp-button" />
                </div>

                <div class="gridview-container">
                    <!-- GridView -->
                    <asp:GridView ID="GridViewPatient" runat="server" CssClass="asp-gridview"
                        BackColor="#CCCCCC" Height="296px" Width="557px" Visible="true"
                        ShowFooter="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                        CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True"
                        OnRowDataBound="GridViewPatient_RowDataBound">
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>

                    <!-- ListBox -->
                    <asp:ListBox ID="AppointmentReportListBox" runat="server" Width="596px" Height="436px" Visible="false"></asp:ListBox>
                </div>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT Appointment_ID, Name , Surname,Date,Symptoms,Attended FROM Appointment ">    
                    </asp:SqlDataSource>
                </div>
            </div>
        <!--</div>-->
    </form>
</body>
</html>
