<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeForm.aspx.cs" Inherits="Clinical_Decision_Support_System.WelcomeForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('popo.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
<head runat="server">
    <title>Welcome to CDSS</title>
    <style type="text/css">
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
            color: #333;
            background-color: rgba(255, 255, 255, 0.8); 
        }

        .container {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(30px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .header {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #0099FF;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .sub-header {
            font-size: 18px;
            margin-bottom: 40px;
            font-style: italic;
            color: #666;
        }

        .button-container {
            display: flex;
            justify-content: space-evenly;
            margin-top: 30px;
        }

        .button {
            padding: 15px 30px;
            font-size: 18px;
            color: #fff;
            background-color: #0099FF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .button:hover {
            background-color: #007ACC;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        
        .button:active {
            transform: translateY(0);
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">Welcome to Clinical Decision Support System</div>
            <div class="sub-header">Convenient care, anytime, anywhere.</div>

            <div class="button-container">
                <asp:Button ID="LoginButton" runat="server" CssClass="button" OnClick="LoginButton_Click" Text="Login" />
                <asp:Button ID="SignUPButton" runat="server" CssClass="button" OnClick="SignUPButton_Click" Text="Sign Up" />
            </div>
        </div>
    </form>
</body>
</html>
