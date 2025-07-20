<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdateDetails.aspx.cs" Inherits="Clinical_Decision_Support_System.AdminUpdateDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('WhatsApp Image 2024-08-15 at 15.30.32.jpeg'); background-size: cover; background-repeat: no-repeat;">
<head runat="server">
    <title>Update/Delete Patient Details</title>
    <style type="text/css">
        body {
            background: rgba(255, 255, 255, 0.8); 
            border: 8px solid white; 
            padding: 20px;
            border-radius: 15px; 
            margin: 50px auto; 
            width: 80%; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
            text-align: center; 
        }
        .label {
            width: 150px;
            text-align: right; 
            padding-right: 10px; 
        }
        .input-field {
            width: 200px; 
            padding: 8px; 
            border-radius: 5px; 
            border: 1px solid #ccc; 
        }
        .auto-style1:hover {
            background-color: #0056b3;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style4 {
            text-align: left;
            width: 316px;
        }
        .auto-style5 {
            font-size: medium;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            border-radius: 5px;
            border-style: none;
            border-color: inherit;
            margin: 5px;
            padding: 10px;
            background-color: #007BFF;
        }
        .auto-style6 {
            text-align: justify;
        }
        .auto-style7 {
            width: 854px;
            text-align: center;
            padding-right: 10px;
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style7">
            Update/Delete Patient Details
        </div>
        <table style="width:100%; margin: auto;">
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td class="label">Patient_ID:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="PatientIDtxt" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PatientIDtxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Name:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="NameUpdateTXTB" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="NameUpdateTXTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Surname:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="sURNAMEtxtb" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sURNAMEtxtb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <table style="width:100%;">
                        <tr>
                            <td class="label">Address:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="ADDRESSUpdateTXTB" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ADDRESSUpdateTXTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">eMail:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="EMailUpdateTXTB" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EMailUpdateTXTB" ErrorMessage="*(eg.@gmail.com)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <table style="width:100%;">
                        <tr>
                            <td class="label">ID Number:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="IDNumUpdateTXTB" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="IDNumUpdateTXTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style4">
                                <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="auto-style5" OnClick="UpdateButton_Click" Width="305px" />
                            </td>
                            <td class="auto-style2">
                                <asp:Button ID="DeleteButton" runat="server" Text="Remove" CssClass="auto-style5" OnClick="DeleteButton_Click" Width="312px" CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Button ID="BackAdmin" runat="server" OnClick="BackAdmin_Click" Text="Back" CssClass="auto-style5" Width="345px" CausesValidation="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
