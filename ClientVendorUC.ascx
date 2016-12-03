<%--
Name: Ezgi Camur
Panther Id: 5598239
Assignment: Assignment 3
Class: COP 4813 
Semester: Fall 2016
I attest that this is my original work 
Ezgi Camur
--%>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClientVendorUC.ascx.cs" Inherits="ClientVendorUC" %>
<br />
<div id="page-wrap">
    <div class="left">Federal Tax Id:</div>
    <div class="right">
        <asp:TextBox ID="txtFederalTaxId" runat="server" MaxLength="15"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFederalTaxId" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFederalTaxId" ErrorMessage="alphanumeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9_]{1,15}$"></asp:RegularExpressionValidator>
    </div>
    <div class="left">Business Name:</div>
    <div class="right">
        <asp:TextBox ID="txtBusinessName" runat="server" MaxLength="50"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TxtBusinessName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtBusinessName" ErrorMessage="alphanumeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9_]{1,50}$"></asp:RegularExpressionValidator>
    </div>
    <div class="left">Address Line:</div>
    <div class="right">
        <asp:TextBox ID="txtAddressLine" runat="server" MaxLength="100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddressLine" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtAddressLine" ErrorMessage="alphanumeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9_]{1,100}$"></asp:RegularExpressionValidator>
    </div>
    <div class="left">City:</div>
    <div class="right">
        <asp:TextBox ID="txtCity" runat="server" MaxLength="50"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtCity" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="alphanumeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9_]{1,50}$"></asp:RegularExpressionValidator>
    </div>
    <div class="left">State:</div>
    <div class="right">
        <asp:DropDownList ID="drpState" runat="server" Width="154px" Height="24px">
            <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem Value="AL">Alabama</asp:ListItem>
            <asp:ListItem Value="AK">Alaska</asp:ListItem>
            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
            <asp:ListItem Value="CA">California</asp:ListItem>
            <asp:ListItem Value="CO">Colorado</asp:ListItem>
            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
            <asp:ListItem Value="DE">Delaware</asp:ListItem>
            <asp:ListItem Value="FL">Florida</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="drpState" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    <div class="left">ZipCode:</div>
    <div class="right">
        <asp:TextBox ID="txtZipCode" runat="server" MaxLength="5"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtZipCode" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtZipCode" ErrorMessage="alphanumeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[0-9]{1,5}$"></asp:RegularExpressionValidator>
    </div>
    <div class="left">I'm a Vendor:</div>
    <div class="right">
        <asp:Panel ID="pnlRadio" runat="server">
            <asp:Label ID="lblYes" runat="server" Text="Yes">
                <asp:RadioButton ID="rdbYes" runat="server" GroupName="vendor" /></asp:Label>
            <asp:Label ID="lblNo" runat="server" Text="No">
                <asp:RadioButton ID="rdpNo" runat="server" GroupName="vendor" /></asp:Label>
        </asp:Panel>
    </div>
    <div class="left">&nbsp;</div>
    <div class="right">&nbsp;</div>

    <div class="left">&nbsp;</div>
    <div class="right">
        <asp:Button ID="btnSaveClient" runat="server" Text="Save Client" OnClick="btnSaveClient_Click" />
    </div>

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


