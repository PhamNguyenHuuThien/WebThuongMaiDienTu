<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gioithieu.aspx.cs" Inherits="WebBanNongSanSach.Gioithieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
    Giới thiệu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">Giới thiệu</h3>
    <div class="content-top">
        <div>
            <!--  -->
            <div id="showText">
                <asp:Label ID="lblGioiThieu" runat="server" Text="Label"></asp:Label>
            </div>
            <!--  -->
        </div>
        <div class="clearfix"></div>
    </div>
   
</asp:Content>
