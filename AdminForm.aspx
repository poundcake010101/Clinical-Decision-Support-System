<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminForm.aspx.cs" Inherits="Clinical_Decision_Support_System.AdminForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('WhatsApp Image 2024-08-15 at 15.30.32.jpeg'); background-size: cover; background-repeat: no-repeat;">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-color: rgba(255, 255, 255, 0.8); 
            margin: 0;
            padding: 0;
        }
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            font-size: x-large;
            width: 531px;
        }
        .auto-style3 {
            width: 531px;
        }
        .auto-style6 {
            width: 652px;
        }
        .button-style {
            background-color: #007BFF; 
            color: white; 
            border: 2px solid white; 
            border-radius: 5px; 
            padding: 10px 20px; 
            cursor: pointer; 
            width: 100%; 
            font-size: large; 
            transition: background-color 0.3s;
        }
        .button-style:hover {
            background-color: #0056b3; 
        }
        .grid-style {
            border: 3px solid white; 
            background-color: rgba(204, 204, 204, 0.9); 
            width: 800px; 
            height: 400px; 
            margin: 0 auto; 
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5); 
        }
        .auto-style7 {
            background-color: #007BFF;
            color: white;
            border: 2px solid white;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: large;
            transition: background-color 0.3s;
            margin-top: 7px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <em>Welcome Administrator</em>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2"><em>Menu</em></td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="ViewPatientsButton" runat="server" Text="View Patients" CssClass="button-style" OnClick="ViewPatientsButton_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="ButtonUpdatePatientsDetails" runat="server" OnClick="ButtonUpdatePatientsDetails_Click" Text="Update Patients Details" CssClass="button-style" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="ViewDoctorButton" runat="server" Text="View Doctors" CssClass="button-style" OnClick="ViewDoctorButton_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="UpdateDocDetailsButton" runat="server" OnClick="UpdateDocDetailsButton_Click" Text="Update Doctor Details" CssClass="button-style" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="DrugManagementForm" runat="server" Text="Drug Management" CssClass="button-style" OnClick="DrugManagementForm_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="AppointmentButton" runat="server" Text="View Appointments" CssClass="button-style" OnClick="AppointmentButton_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="GenerateReportButton" runat="server" Text="Generate Report" CssClass="button-style" OnClick="GenerateReportButton_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="BackButtonAdmin" runat="server" OnClick="BackButtonAdmin_Click" Text="Back" CssClass="button-style"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>
                </td>
                <td class="auto-style6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="grid-style" Height="400px" Width="800px"
                        ShowFooter="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                        AllowSorting="True"
                        OnRowDataBound="GridView1_RowDataBound" >

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
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ReportTable]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        OnSelecting="SqlDataSource2_Selecting" 
                        SelectCommand="SELECT Patient_ID, F_Name, L_Name, Email, [Address], ID_number FROM Patient">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT d.Doctor_ID, s.F_Name, s.L_Name, d.Specialisation, d.Schedule, d.Availability 
                                        FROM Doctor d
                                        INNER JOIN Staff s ON d.Staff_ID = s.Staff_ID" 
                        OnSelecting="SqlDataSource1_Selecting">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT Appointment_ID, Name , Surname,Date,Symptoms,Attended FROM Appointment ">      
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Medication_ID], [Medicine_Name ] , [Medication_Guideline] , [Quantity] FROM [Medication]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
