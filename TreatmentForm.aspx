<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreatmentForm.aspx.cs" Inherits="Clinical_Decision_Support_System.TreatmentForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Treatment Form</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .grid-view {
            width: 100%;
            margin-top: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #ffffff;
            padding: 10px;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 10px;
        }
        .button:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Treatment Form</h2>

            
            <asp:Label ID="MessageDoc" runat="server" CssClass="message"></asp:Label>

            
            <div class="grid-view">
                <asp:GridView ID="GridView1" runat="server" CssClass="grid-view"
                    ShowFooter="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                    AllowSorting="True" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Medication_ID" HeaderText="Medication ID" />
                        <asp:BoundField DataField="Medicine_Name " HeaderText="Medicine Name" />
                        <asp:BoundField DataField="Medication_Guideline" HeaderText="Guideline" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    </Columns>
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
                    SelectCommand="SELECT [Medication_ID], [Medicine_Name ], [Medication_Guideline], [Quantity] FROM [Medication]">
                </asp:SqlDataSource>
            </div>

            
            <div class="form-group">
                <label for="NamePrescribTxt">Enter Name of Medicine:</label>
                <asp:TextBox ID="NamePrescribTxt" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NamePrescribTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="QuantityTxt">Enter the Quantity:</label>
                <asp:TextBox ID="QuantityTxt" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="QuantityTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="Prescribe" CssClass="button" OnClick="Button1_Click" />
            </div>

            
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            
            <div class="button-container">
                <asp:Button ID="BackButton" runat="server" Text="Back" CssClass="button" OnClick="BackButton_Click" CausesValidation="false"  />
                <asp:Button ID="NextPatientButton" runat="server" Text="Next Patient" CssClass="button" OnClick="NextPatientButton_Click" CausesValidation="false" />
                <asp:Button ID="BackToLogin" runat="server" Text="Exit" CssClass="button" OnClick="BackToLogin_Click" CausesValidation="false" />
            </div>
        </div>
    </form>
</body>
</html>
