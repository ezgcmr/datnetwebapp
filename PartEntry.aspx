<%--
Ezgi Camur
--%>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="PartEntry.aspx.cs" Inherits="PartEntry" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="page-wrap">
            <div id="prgHide" runat="server">
                <p class="italic">
                    Welcome to Danger Zone Aviation’s Part Entry page. All information entered will be used for mechanical work order inspections.
                    It is extremely important that all information entered is verified as factual. Please review all the information entered. <strong>Any information wrongfully entered 
                    could cause Danger Zone Aviation to be financially liable in the event of a problematic part.</strong>
                </p>
            </div>
            <div>
                <asp:Label ID="lblResultMsg" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
            <div class="left">Client:</div>
            <div class="right">
                <asp:DropDownList ID="drpClient" runat="server" Width="154px" Height="24px" DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="ClientCode" ClientIDMode="Static">
                    
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString %>" SelectCommand="SELECT [ClientCode], [Description] FROM [ClientType]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="drpClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="left">Request Order No:</div>
            <div class="right">
                <asp:TextBox ID="txtOrderNum" runat="server" MaxLength="5" ClientIDMode="Static"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="txtOrderNum" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtOrderNum" ErrorMessage="Enter 5 Digit Number" ForeColor="Red" Display="Dynamic" ValidationExpression="^[0-9]{5}$"></asp:RegularExpressionValidator>
            </div>
            <div class="left">Date Entered: </div>
            <div class="right">
                <asp:TextBox ID="txtDateEntered" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="left">Description:</div>
            <div class="right">
                <asp:TextBox ID="txtDescription" runat="server" MaxLength="50" ClientIDMode="Static"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="left">Part No:</div>
            <div class="right">
                <asp:TextBox ID="txtPartNo" runat="server" MaxLength="8" ClientIDMode="Static"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ControlToValidate="txtPartNo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPartNo" ErrorMessage="Must be 8 alphanumeric" ValidationExpression="^[a-zA-Z0-9_]{8}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="left">Serial:</div>
            <div class="right">
                <asp:TextBox ID="txtSerial" runat="server" MaxLength="5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="txtSerial" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtSerial" ErrorMessage="Must be 5 digit Number" ValidationExpression="^[0-9]{5}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="left">Manufacturer:</div>
            <div class="right">
                <asp:DropDownList ID="drpManufacturer" runat="server" Width="154px" Height="24px" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="ManufacturerCode">

                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString %>" SelectCommand="SELECT [ManufacturerCode], [Description] FROM [Manufacturer]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Required" ControlToValidate="drpManufacturer" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="left">Model:</div>
            <div class="right">
                <asp:TextBox ID="txtModel" runat="server" MaxLength="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Required" ControlToValidate="txtModel" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Must be less than 25" ControlToValidate="txtModel"></asp:CustomValidator>
            </div>

             <div class="left">Mechanic Call Sign:</div>
            <div class="right">
                <asp:DropDownList ID="drpMechanicCallSign" runat="server" Width="154px" Height="24px" DataSourceID="SqlDataSource3" DataTextField="MechanicCallSign" DataValueField="MechanicId">

                </asp:DropDownList>
                
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString %>" SelectCommand="SELECT [MechanicId], [MechanicCallSign] FROM [Mechanic]"></asp:SqlDataSource>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ControlToValidate="drpMechanicCallSign" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="left">Instructions:</div>
            <div class="right">
                <asp:TextBox ID="txtInstructions" runat="server" MaxLength="100" TextMode="MultiLine" Height="100px" Width="300px"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="Must be less than 100" ControlToValidate="txtInstructions"></asp:CustomValidator>
            </div>
            <div class="left">Trouble Reported:</div>
            <div class="right">
                <asp:TextBox ID="txtTroubleReported" runat="server" MaxLength="100" TextMode="MultiLine" Height="100px" Width="300px"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="Must be less than 100" ControlToValidate="txtTroubleReported"></asp:CustomValidator>
            </div>
            <div class="left">Master Contract:</div>
            <div class="right">
                <asp:CheckBox ID="chckMaster" runat="server" /></div>
        </div>

        <div class="left">&nbsp;</div>
        <div class="right">&nbsp;</div>

        <div class="left">&nbsp;</div>
        <div class="buttonright">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                 
            <asp:HiddenField ID="hdnSavedValues" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DangerZoneConnectionString %>" DeleteCommand="DELETE FROM [Part] WHERE [PartNo] = @PartNo" InsertCommand="INSERT INTO [Part] ([RequestOrderNo], [PartNo], [ClientCode], [DateEntered], [Description], [Serial], [Manufacturer], [Model], [MasterContract],[TroubleReported], [Instructions], [MechanicCallsign]) VALUES (@RequestOrderNo, @PartNo, @ClientCode, @DateEntered, @Description, @Serial, @Manufacturer, @Model, @MasterContract,@TroubleReported, @Instructions, @MechanicCallsign)" SelectCommand="SELECT [RequestOrderNo], [PartNo], [ClientCode], [DateEntered], [Description], [Serial], [Manufacturer], [Model], [MasterContract], [TroubleReported], [Instructions], [MechanicCallsign] FROM [Part]" UpdateCommand="UPDATE [Part] SET [RequestOrderNo] = @RequestOrderNo, [ClientCode] = @ClientCode, [DateEntered] = @DateEntered, [Description] = @Description, [Serial] = @Serial, [Manufacturer] = @Manufacturer, [Model] = @Model, [MasterContract] = @MasterContract, [TroubleReported] = @TroubleReported, [Instructions] = @Instructions, [MechanicCallsign] = @MechanicCallsign WHERE [PartNo] = @PartNo">
                <DeleteParameters>
                    <asp:Parameter Name="PartNo" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtOrderNum" Name="RequestOrderNo" PropertyName="Text"  Type="String"  />
                    <asp:ControlParameter ControlID="txtPartNo" Name="PartNo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="drpClient" Name="ClientCode" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDateEntered" Name="DateEntered" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txtDescription" Name="Description" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtSerial" Name="Serial" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="drpManufacturer" Name="Manufacturer" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtModel" Name="Model" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="chckMaster" Name="MasterContract" PropertyName="Checked" Type="Boolean" />
                    <asp:ControlParameter ControlID="txtTroubleReported" Name="TroubleReported" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtInstructions" Name="Instructions" PropertyName="Text" Type="String" /> 
                    <asp:ControlParameter ControlID="drpMechanicCallSign" Name="MechanicCallsign" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RequestOrderNo" Type="String" />
                    <asp:Parameter Name="ClientCode" Type="String" />
                    <asp:Parameter Name="DateEntered" Type="DateTime" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Serial" Type="String" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="MasterContract" Type="Boolean" />
                    <asp:Parameter Name="TroubleReported" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                    <asp:Parameter Name="MechanicCallsign" Type="String" />
                    <asp:Parameter Name="PartNo" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtSavedValues" runat="server" Visible="False" TextMode="MultiLine" Height="100px" Width="300px"></asp:TextBox>
        </div>

        <div id="text-liner">
            <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
        </div>
  

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" DataKeyNames="PartNo" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="RequestOrderNo" HeaderText="RequestOrderNo" SortExpression="RequestOrderNo" />
                <asp:BoundField DataField="PartNo" HeaderText="PartNo" ReadOnly="True" SortExpression="PartNo" />
                <asp:BoundField DataField="ClientCode" HeaderText="ClientCode" SortExpression="ClientCode" />
                <asp:BoundField DataField="DateEntered" HeaderText="DateEntered" SortExpression="DateEntered" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:CheckBoxField DataField="MasterContract" HeaderText="MasterContract" SortExpression="MasterContract" />
                <asp:BoundField DataField="TroubleReported" HeaderText="TroubleReported" SortExpression="TroubleReported" />
                <asp:BoundField DataField="Instructions" HeaderText="Instructions" SortExpression="Instructions" />
                <asp:BoundField DataField="MechanicCallsign" HeaderText="MechanicCallsign" SortExpression="MechanicCallsign" />
            </Columns>
        </asp:GridView>
</asp:Content>

