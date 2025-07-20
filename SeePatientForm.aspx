<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeePatientForm.aspx.cs" Inherits="Clinical_Decision_Support_System.SeePatientForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Symptoms Form</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .auto-style1 {
            width: 100%;
        }
        label, select, input {
            display: block;
            margin-bottom: 15px;
            width: 100%;
        }
        select, input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button-container {
            text-align: center;
            margin-bottom: 20px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Symptoms Form</h2>

            
            <div class="button-container">
                <asp:Button ID="ViewDiagnosisbutton" runat="server" Text="View Diagnosis" CssClass="btn" OnClick="ViewDiagnosisbutton_Click" CausesValidation="false" />
            </div>

            <asp:GridView ID="GridView2" runat="server" BackColor="#f4f4f4" ShowFooter="True" 
                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="2" ForeColor="Black" 
                AllowSorting="True" Width="100%" OnRowDataBound="GridView2_RowDataBound">
                <HeaderStyle BackColor="#007bff" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#f4f4f4" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#007bff" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Diagonosis]"></asp:SqlDataSource>

            <label for="DiagnosisDLB">Select Diagnosis:</label>
            <asp:DropDownList ID="DiagnosisDLB" runat="server" CssClass="auto-style1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Migraine</asp:ListItem>
                <asp:ListItem>Arthritis</asp:ListItem>
                <asp:ListItem>Diabetes</asp:ListItem>
                <asp:ListItem>Heart attack</asp:ListItem>
                <asp:ListItem>Depression</asp:ListItem>
                <asp:ListItem>Influenza</asp:ListItem>
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DiagnosisDLB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

            <div class="button-container">
                <asp:Button ID="DoctorSubmitButton2" runat="server" Text="Submit" CssClass="btn" OnClick="DoctorSubmitButton2_Click" />
            </div>

            <asp:GridView ID="GridView1" runat="server" BackColor="#f4f4f4" ShowFooter="True" 
                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="2" ForeColor="Black" 
                AllowSorting="True" Width="100%" OnRowDataBound="GridView1_RowDataBound">
                <HeaderStyle BackColor="#007bff" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#f4f4f4" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#007bff" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT Appointment_ID, Name, Surname, Symptoms, Appointment.* 
                                FROM Appointment WHERE (Appointment_ID = @AppointmentID)">
                <SelectParameters>
                    <asp:Parameter Name="AppointmentID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="button-container">
                <asp:Button ID="BackButton" runat="server" Text="Back" CssClass="btn" OnClick="BackButton_Click" CausesValidation="false"/>
            </div>
        </div>
    </form>
</body>
</html>