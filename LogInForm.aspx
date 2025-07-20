<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInForm.aspx.cs" Inherits="Clinical_Decision_Support_System.LogInForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('lklk6.jpeg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
<head runat="server">
    <title>Login - Clinical Decision Support System</title>
    <style type="text/css">
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
            background-color: rgba(255, 255, 255, 0.8); 
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(30px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        h1 {
            font-size: 32px;
            color: #0099FF;
            margin-bottom: 20px;
        }

        label {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
            display: block;
            text-align: left;
        }

        .input-container {
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus, select:focus {
            border-color: #0099FF;
            outline: none;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Clinical Decision Support System</h1>

            <div class="input-container">
                <label for="user-role">Role</label>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="width: 100%;">
                    <asp:ListItem Value="" Text="Select Role"></asp:ListItem>
                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    <asp:ListItem Value="Doctor">Doctor</asp:ListItem>
                    <asp:ListItem Value="Patient">Patient</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="input-container">
                <label for="username">Username</label>
                <asp:TextBox ID="UserNameTextBox" runat="server" Width="100%" placeholder="Enter your username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="*" Font-Size="XX-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="input-container">
                <label for="password">Password</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" Width="100%" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="*" Font-Size="XX-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="LoginButton2" runat="server" CssClass="button" OnClick="LoginButton2_Click" Text="Login" />

            <asp:Button ID="HomeLogInButton" runat="server" CssClass="button home-button" OnClick="HomeLogInButton_Click" Text="Home" CausesValidation="false" />
        </div>
    </form>
</body>
</html>