<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorForm.aspx.cs" Inherits="Clinical_Decision_Support_System.DoctorForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('WhatsApp Image 2024-08-15 at 15.30.32.jpeg'); background-size: cover; background-position: center;">
<head runat="server">
    <title>Doctor Dashboard</title>
    <style type="text/css">
        body {
            background-color: rgba(240, 240, 240, 0.8);
            font-family: Arial, sans-serif;
        }
        .header {
            text-align: center;
            font-size: xx-large;
            color: #333;
            margin: 30px 0;
        }
        .form-table {
            width: 100%;
            margin: 20px 0;
            text-align: center;
        }
        .button-container {
            text-align: center;
            margin: 20px 0;
        }
        .input-text {
            width: 270px;
            margin: 10px 0;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .grid-view {
            width: 100%;
            border: 1px solid #999;
            background-color: #ffffff;
            margin: 20px auto;
            border-collapse: collapse;
        }
        .grid-view th, .grid-view td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }
        .grid-view th {
            background-color: #000;
            color: white;
            font-weight: bold;
        }
        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .grid-view tr:hover {
            background-color: #f1f1f1;
        }
        .footer-buttons {
            text-align: center;
            margin: 20px 0;
        }
        button, .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover, .btn:hover {
            background-color: #0056b3;
        }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <strong>Welcome Doctor</strong>
        </div>

        <div class="form-table">
            <asp:Button ID="AppointmentButton" runat="server" Text="View Appointments" Width="274px" CssClass="btn" OnClick="AppointmentButton_Click" CausesValidation="false"/>
        </div>

        <div class="form-table">
            <table>
                <tr>
                    <td>Select Appointment_ID you want to attend:</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:TextBox ID="SeatchTXT" runat="server" placeholder="Search Patient by Appointment_ID" CssClass="input-text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SeatchTXT" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="DoctorSubmitButton" runat="server" Text="Submit" CssClass="btn" Width="279px" OnClick="DoctorSubmitButton_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <div class="form-table">
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" 
                    BackColor="#CCCCCC" ShowFooter="True" ShowHeaderWhenEmpty="True" 
                    AutoGenerateColumns="False" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                    CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True" 
                    OnRowDataBound="GridView1_RowDataBound">
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT Appointment_ID, Name, Surname, Date, Symptoms,Attended FROM Appointment">
            </asp:SqlDataSource>
        </div>

        <div class="footer-buttons">
            <asp:Button ID="DoctorBackButton" runat="server" Text="Back" Width="75px" CssClass="btn" OnClick="DoctorBackButton_Click" CausesValidation="false"/>
        </div>
    </form>
</body>
</html>
