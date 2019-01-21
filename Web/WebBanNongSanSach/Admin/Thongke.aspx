<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="Thongke.aspx.cs" Inherits="WebBanNongSanSach.Admin.Thongke" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <asp:Literal ID="lt" runat="server"></asp:Literal>
    <div id="chart_div"></div>
</asp:Content>
