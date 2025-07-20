<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpForm.aspx.cs" Inherits="Clinical_Decision_Support_System.SignUpForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('lklk6.jpeg'); background-size: cover;">
<head runat="server">
    <title>Sign Up - Clinical Decision Support System</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }
        .form-container {
            width: 400px; 
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .form-header {
            text-align: center;
            font-size: xx-large;
            margin-bottom: 20px;
        }
        .form-subheader {
            text-align: center;
            font-size: x-large;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: large;
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="text"], 
        .form-group input[type="password"], 
        .form-group input[type="email"] {
            width: 100%;
            padding: 10px;
            font-size: medium;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .form-group input[type="text"]:focus, 
        .form-group input[type="password"]:focus, 
        .form-group input[type="email"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
        }
        .form-group button {
            width: 100%;
            padding: 15px;
            font-size: large;
            background-color: #17a2b8; 
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #138496; 
        }
        .button {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            color: #fff;
            background-color: #0099FF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }
        .button:hover {
            background-color: #007ACC;
            transform: translateY(-2px);
        }

        .button:active {
            transform: translateY(0);
        }
        .home-button {
            background-color: #f1f1f1;
            color: #333;
            margin-top: 20px;
        }

        .home-button:hover {
            background-color: #e0e0e0;
        }
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 15px;
            font-size: 18px;
            color: #fff;
            background-color: #0099FF;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }
        .auto-style2 {
            text-align: center;
            font-size: xx-large;
            margin-bottom: 20px;
            height: 67px;
        }
        .auto-style3 {
            width: 413px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease-in-out;
            height: 825px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
            <div class="auto-style2">Clinical Decision Support System</div>
            <div class="form-subheader">Patient Registration</div>
            
            <div class="form-group">
                <label for="NameTextBox">Name:</label>
                <asp:TextBox ID="NameTextBox" runat="server" placeholder="Enter your name" Height="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="SurnameTextBox">Surname:</label>
                <asp:TextBox ID="SurnameTextBox" runat="server" placeholder="Enter your surname" Height="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SurnameTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="EMailTextBox">Email:</label>
                <asp:TextBox ID="EMailTextBox" runat="server" placeholder="Enter your email" Height="16px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EMailTextBox" ErrorMessage="*(eg.@gmail.com)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="AddressTextBox">Physical Address:</label>
                <asp:TextBox ID="AddressTextBox" runat="server" placeholder="Enter your address" Height="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="IDNUMBERTXTBOX">ID Number:</label>
                <asp:TextBox ID="IDNUMBERTXTBOX" runat="server" placeholder="Enter your ID number (13 digits)" Height="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="IDNUMBERTXTBOX" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="PasswordCreateTextBox">Create Password:</label>
                <asp:TextBox ID="PasswordCreateTextBox" runat="server" TextMode="Password" placeholder="Create a password" Height="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PasswordCreateTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Button ID="RegistrationSubmitButton" runat="server" CssClass="auto-style1" Text="Submit" OnClick="RegistrationSubmitButton_Click" Width="200px" Height="42px" />
                <asp:Button ID="HomeSignUpButton" runat="server" CssClass="button home-button" Text="Home" OnClick="HomeSignUpButton_Click" Width="183px" Height="44px" CausesValidation="false" />
            </div>

            <div class="home-button">
            </div>
        </div>
    </form>
</body>
</html>