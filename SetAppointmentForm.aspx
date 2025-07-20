<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetAppointmentForm.aspx.cs" Inherits="Clinical_Decision_Support_System.SetAppointmentForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment Form</title>
    <style type="text/css">
        body {
            background-image: url('WhatsApp Image 2024-08-15 at 15.30.32.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.85;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            border: 3px solid #ffffff;
            border-radius: 10px;
            padding: 20px;
            width: 50%;
            margin: auto;
            margin-top: 50px;
        }

        .title {
            font-size: xx-large;
            text-align: center;
            color: #333;
            padding: 20px;
            margin-bottom: 20px;
        }

        .label {
            text-align: right;
            font-size: medium;
            color: #333;
            padding-right: 10px;
        }

        .input {
            width: 270px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button {
            width: 125px;
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: medium;
            cursor: pointer;
            border-radius: 5px;
            margin: 5px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .empty-row {
            height: 10px;
        }
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #007BFF;
            color: white;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: medium;
            cursor: pointer;
            border-radius: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="title" style="font-family: 'Arial Rounded MT Bold'">Set/Update/Cancel Appointment</div>
            <table style="width:100%;">
                <tr>
                    <td class="label">Name:</td>
                    <td>
                        <asp:TextBox ID="NameAppointTXT" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="NameAppointTXT" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Surname:</td>
                    <td>
                        <asp:TextBox ID="sURNAMEappointmentTXT" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sURNAMEappointmentTXT" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Symptoms:</td>
                    <td>
                        <asp:TextBox ID="Diatxt" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Diatxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Date:</td>
                    <td>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                </tr>
                <!-- Add time selection controls for hour and minute -->
                <tr>
                    <td class="label">Time (Hour):</td>
                    <td>
                        <asp:TextBox ID="TimeHour" runat="server" CssClass="input" MaxLength="2" Width="50px"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TimeHour" MinimumValue="0" MaximumValue="23" Type="Integer" ErrorMessage="Enter a valid hour (0-23)" ForeColor="Red"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Time (Minute):</td>
                    <td>
                        <asp:TextBox ID="TimeMinute" runat="server" CssClass="input" MaxLength="2" Width="50px"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TimeMinute" MinimumValue="0" MaximumValue="59" Type="Integer" ErrorMessage="Enter a valid minute (0-59)" ForeColor="Red"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="SetAppointmentButton" runat="server" Text="Set Appointment" CssClass="auto-style1" OnClick="SetAppointmentButton_Click" Width="160px" />
                        <asp:Button ID="UpdateAppointmentButton" runat="server" Text="Update Appointment" CssClass="auto-style1" OnClick="UpdateAppointmentButton_Click" Width="177px" />
                        <asp:Button ID="CancelAppointmentButton" runat="server" Text="Cancel Appointment" CssClass="auto-style1" OnClick="CancelAppointmentButton_Click" Width="167px" CausesValidation="false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="BackB" runat="server" OnClick="BackB_Click" Text="Back" CssClass="button" CausesValidation="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>