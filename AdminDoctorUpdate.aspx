<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDoctorUpdate.aspx.cs" Inherits="Clinical_Decision_Support_System.AdminDoctorUpdate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('WhatsApp Image 2024-08-15 at 15.30.32.jpeg'); background-size: cover; background-repeat: no-repeat;">
<head runat="server">
    <title></title>
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
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
            width: 331px;
            text-align: right;
        }
        .auto-style3 {
            width: 331px;
            text-align: right;
        }
        .auto-style5 {
            width: 330px;
        }
        .auto-style6 {
            width: 330px;
            text-align: right;
        }
        .auto-style7 {
            width: 193px;
        }
        .auto-style8 {
            text-align: center;
            font-size: xx-large; 
            margin-bottom: 20px; 
        }
        input[type="text"] {
            padding: 8px; 
            border-radius: 5px; 
            border: 1px solid #ccc; 
            width: 100%; 
        }
        button {
            background-color: #007BFF; 
            color: white; 
            border: none; 
            padding: 10px 15px; 
            border-radius: 5px; 
            cursor: pointer; 
            width: 106px; 
            margin: 10px; 
            font-size: 16px; 
            transition: background-color 0.3s; 
        }
        button:hover {
            background-color: #0056b3; 
        }
        .auto-style9 {
            height: 23px;
            text-align: left;
        }
        .auto-style10 {
            text-align: left;
        }
        .auto-style11 {
            width: 193px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style8">
            Update Doctor Details
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Doctor_ID:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="DocIDTxt" runat="server" Width="159px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DocIDTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style3">Specialisation:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="SDocSpeTxt" runat="server" Width="159px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="SDocSpeTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Schedule:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="DocSchetxt" runat="server" Width="159px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DocSchetxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style6">Availability:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="DocAvaitxt" runat="server" Width="159px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DocAvaitxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style11">
                    <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" Text="Update" Width="106px" />
                </td>
                <td class="auto-style10">
                    <asp:Button ID="DeleteButton" runat="server" OnClick="DeleteButton_Click" Text="Delete" Width="106px" CausesValidation="false" />
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back" Width="106px" CausesValidation="false" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
