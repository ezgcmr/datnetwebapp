<%--
Ezgi Camur
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WorkOrders.aspx.cs" Inherits="WorkOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />
    <div id="page-wrap">
        <div class="left">Work Order Number:</div>
        <div class="right">
            <asp:TextBox ID="txtWorkOrderNumber" runat="server" MaxLength="6"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtWorkOrderNumber" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtWorkOrderNumber" ErrorMessage="Must be 8 numeric only" ForeColor="Red" Display="Dynamic" ValidationExpression="^[0-9_]{6}$"></asp:RegularExpressionValidator>
        </div>
        <div class="left">Mechanic Call Sign:</div>
        <div class="right">
            <asp:DropDownList ID="drpMechanicCallSign" runat="server" Width="154px" Height="24px" DataSourceID="SqlDataSource3" DataTextField="MechanicCallSign" DataValueField="MechanicId">
            </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString %>" SelectCommand="SELECT [MechanicId], [MechanicCallSign] FROM [Mechanic]"></asp:SqlDataSource>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="drpMechanicCallSign" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="left">Part No:</div>
        <div class="right">
            <asp:TextBox ID="txtPartNo" runat="server" MaxLength="8" ClientIDMode="Static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="txtPartNo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPartNo" ErrorMessage="Must be 8 alphanumeric" ValidationExpression="^[a-zA-Z0-9_]{8}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="left">Inspection Comments:</div>
        <div class="right">
            <asp:TextBox ID="txtInspectionComments" runat="server" MaxLength="500" TextMode="MultiLine" Height="100px" Width="300px"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="Must be less than 500" ControlToValidate="txtInspectionComments"></asp:CustomValidator>
        </div>


        <div class="left">Date Expired: </div>

        <div class="right">
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            <asp:TextBox ID="txtDateExpired" runat="server" ClientIDMode="Static"></asp:TextBox>
        </div>

        <div class="left">Date Inspected: </div>
        <div class="right">
            <asp:TextBox ID="txtDateInspected" runat="server" ClientIDMode="Static"></asp:TextBox>
        </div>

        <div class="left">&nbsp;</div>
        <div class="right">&nbsp;</div>

        <div class="left">&nbsp;</div>
        <div class="buttonright">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
        <br />
        <div>
           <asp:Label ID="lblResultMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString %>" SelectCommand="SELECT [WorkOrderNumber], [MechanicId], [PartNo], [InspectionComments], [Expires], [DateTimeInspected] FROM [WorkOrders]" DeleteCommand="DELETE FROM [WorkOrders] WHERE [WorkOrderNumber] = @WorkOrderNumber" InsertCommand="INSERT INTO [WorkOrders] ([WorkOrderNumber], [MechanicId], [PartNo], [InspectionComments], [Expires], [DateTimeInspected]) VALUES (@WorkOrderNumber, @MechanicId, @PartNo, @InspectionComments, @Expires, @DateTimeInspected)" UpdateCommand="UPDATE [WorkOrders] SET [MechanicId] = @MechanicId, [PartNo] = @PartNo, [InspectionComments] = @InspectionComments, [Expires] = @Expires, [DateTimeInspected] = @DateTimeInspected WHERE [WorkOrderNumber] = @WorkOrderNumber">
        <DeleteParameters>
            <asp:Parameter Name="WorkOrderNumber" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="WorkOrderNumber" Type="String" />
            <asp:Parameter Name="MechanicId" Type="Int32" />
            <asp:Parameter Name="PartNo" Type="String" />
            <asp:Parameter Name="InspectionComments" Type="String" />
            <asp:Parameter DbType="Date" Name="Expires" />
            <asp:Parameter Name="DateTimeInspected" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MechanicId" Type="Int32" />
            <asp:Parameter Name="PartNo" Type="String" />
            <asp:Parameter Name="InspectionComments" Type="String" />
            <asp:Parameter DbType="Date" Name="Expires" />
            <asp:Parameter Name="DateTimeInspected" Type="DateTime" />
            <asp:Parameter Name="WorkOrderNumber" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="WorkOrderNumber" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" ReadOnly="True" SortExpression="WorkOrderNumber" />
            <asp:BoundField DataField="MechanicId" HeaderText="MechanicId" SortExpression="MechanicId" />
            <asp:BoundField DataField="PartNo" HeaderText="PartNo" SortExpression="PartNo" />
            <asp:BoundField DataField="InspectionComments" HeaderText="InspectionComments" SortExpression="InspectionComments" />
            <asp:BoundField DataField="Expires" HeaderText="Expires" SortExpression="Expires" />
            <asp:BoundField DataField="DateTimeInspected" HeaderText="DateTimeInspected" SortExpression="DateTimeInspected" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="WorkOrderNumber" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" ReadOnly="True" SortExpression="WorkOrderNumber" />
            <asp:BoundField DataField="MechanicId" HeaderText="MechanicId" SortExpression="MechanicId" />
            <asp:BoundField DataField="PartNo" HeaderText="PartNo" SortExpression="PartNo" />
            <asp:BoundField DataField="InspectionComments" HeaderText="InspectionComments" SortExpression="InspectionComments" />
            <asp:BoundField DataField="Expires" HeaderText="Expires" SortExpression="Expires" />
            <asp:BoundField DataField="DateTimeInspected" HeaderText="DateTimeInspected" SortExpression="DateTimeInspected" />
        </Fields>
    </asp:DetailsView>
</asp:Content>

