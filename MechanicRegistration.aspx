<%--
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
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MechanicId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="MechanicId" HeaderText="MechanicId" InsertVisible="False" ReadOnly="True" SortExpression="MechanicId" />
                <asp:BoundField DataField="MechanicCallSign" HeaderText="MechanicCallSign" SortExpression="MechanicCallSign" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Specialty" HeaderText="Specialty" SortExpression="Specialty" />
            </Columns>
        </asp:GridView>

         
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString2 %>" DeleteCommand="DELETE FROM [Mechanic] WHERE [MechanicId] = @MechanicId" InsertCommand="INSERT INTO [Mechanic] ([MechanicCallSign], [FirstName], [LastName], [Specialty]) VALUES (@MechanicCallSign, @FirstName, @LastName, @Specialty)" SelectCommand="SELECT [MechanicId], [MechanicCallSign], [FirstName], [LastName], [Specialty] FROM [Mechanic]" UpdateCommand="UPDATE [Mechanic] SET [MechanicCallSign] = @MechanicCallSign, [FirstName] = @FirstName, [LastName] = @LastName, [Specialty] = @Specialty WHERE [MechanicId] = @MechanicId">
            <DeleteParameters>
                <asp:Parameter Name="MechanicId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MechanicCallSign" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Specialty" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MechanicCallSign" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Specialty" Type="String" />
                <asp:Parameter Name="MechanicId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

         
    </div>
</asp:Content>

