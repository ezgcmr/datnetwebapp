<%--
Name: Ezgi Camur
Panther Id: 5598239
Assignment: Assignment 3
Class: COP 4813 
Semester: Fall 2016
I attest that this is my original work 
Ezgi Camur
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MechanicRegistration.aspx.cs" Inherits="MechanicRegistration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/DangerZone.svc" />
        </Services>
    </asp:ScriptManagerProxy>
    <script src="CreateMechanic.js"></script>
    <br />
    <div id="page-wrap">
        <div class="left">Mechanic Call Sign:</div>
        <div class="right">
            <asp:TextBox ID="txtCallSign" runat="server" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtCallSign" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtCallSign" ErrorMessage="alphanumeric only" ValidationExpression="^[a-zA-Z0-9_]{1,10}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            <input id="btnCheckCallSign" type="button" value="Check Call Sign" onclick="CheckCallSign()" />
        </div>

        <div class="left">Call Sign Check Label:</div>
        <div class="right">

            <span id="lblCallSign" />&nbsp;
        </div>

        <div class="left">First Name:</div>
        <div class="right">
            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="alphanumeric only" ValidationExpression="^[a-zA-Z0-9_]{1,25}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="left">Last Name:</div>
        <div class="right">
            <asp:TextBox ID="txtLastName" runat="server" MaxLength="25"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtLastName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="alphanumeric only" ValidationExpression="^[a-zA-Z0-9_]{1,25}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="left">Specialty:</div>
        <div class="right">
            <asp:DropDownList ID="drpSpecialty" runat="server" Width="154px" Height="24px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="AV">Avionics</asp:ListItem>
                <asp:ListItem Value="FL">Flight System</asp:ListItem>
                <asp:ListItem Value="EN">Engine</asp:ListItem>
                <asp:ListItem Value="LA">Landing Gear</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="drpSpecialty" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        
        <div class="left">&nbsp;</div>
        <div class="right">&nbsp;</div>

        <div class="left">&nbsp;</div>
        <div class="right"><asp:Button ID="btnSaveMechanic" runat="server" Text="Save Mechanic" OnClick="btnSaveMechanic_Click" /></div>
        
        <div class="left">&nbsp;</div>
        <div class="right">
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" ShowSummary="true" DisplayMode="BulletList" HeaderText="You must enter required * fields" ForeColor="red" CssClass="validation_summary_as_bulletlist" runat="server" />
        </div>

        <br />
        <div>
         <asp:Label ID="lblResultMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
         
    </div>
</asp:Content>

