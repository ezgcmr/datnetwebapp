<%--
Name: Ezgi Camur
Panther Id: 5598239
Assignment: Assignment 3
Class: COP 4813 
Semester: Fall 2016
I attest that this is my original work 
Ezgi Camur
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VendorEntry.aspx.cs" Inherits="VendorEntry" %>

<%@ Register Src="~/ClientVendorUC.ascx" TagPrefix="uc1" TagName="ClientVendorUC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:ClientVendorUC runat="server" ID="ClientVendorUC" />
</asp:Content>


