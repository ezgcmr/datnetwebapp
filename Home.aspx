<%--
Name: Ezgi Camur
Panther Id: 5598239
Assignment: Assignment 3
Class: COP 4813 
Semester: Fall 2016
I attest that this is my original work 
Ezgi Camur
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="prg-center">
        Since 1996, Danger Zone Aviation has been serving the aviation industry with its top notch customer service and agile manufacturing methods. Since their retirement from Top Gun Academy, Its Chief Wingmen Officers LT Pete “Maverick” Mitchell and LT Tom “Iceman” Kazanski have dedicated themselves.<br />
        <br />
        <div>
            <asp:Label ID="lblUnderLined" runat="server" Text="Show Prospective Clients" Font-Underline="True"></asp:Label>
        </div>
        <br />
        <div id="ProsClients">
            <h2>Prospective Clients:</h2>
            <ul>
                <li>SpaceX</li>
                <li>Arianespace</li>
                <li>Blue Origin</li>
            </ul>
        </div>
        <br />
        <div>
            <img alt="" class="auto-style1" src="img/iceman.png" />
            <img alt="" class="auto-style2" src="img/maveric.png" />
        </div>
        <div>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                    </asp:Timer>
                    <asp:Label ID="lblRefreshed" runat="server" Text="Work Orders Completed"></asp:Label>
                    &nbsp;<asp:Label ID="lblCount" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#ProsClients').hide();
        });

        function CallMe() {
      
                $("#ProsClients").show();
        }

    </script>

</asp:Content>

