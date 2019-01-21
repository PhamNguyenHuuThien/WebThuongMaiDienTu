<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebBanNongSanSach.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
    Đăng nhập
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <div align='center' >
        <h2
            class='h2memberstop cus1'>THÀNH VIÊN ĐĂNG NHẬP</h2>
   
    Tên truy cập               
<span style="margin-left:12px;"><input name='tentruycap' type='text' class='form-control' id='id_tentruycap' maxlength='12' runat="server" style='text-align:center;' /></span>
    Mật khẩu</strong>  
<input name='matkhau' type='password' class='form-control' id='id_matkhau' value='' maxlength='12' runat="server"  style='text-align:center;' />

    <asp:Button ID='button' runat="server" CssClass='submitbutton' Text="Đăng Nhập" OnClick="button_Click" />
    <asp:Label ID="lbThongbao" runat="server" Text=""></asp:Label>

<%--        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.facebook.com/dialog/oauth?client_id=975647052624368&redirect_uri=https://webbanrausach.azurewebsites.net/LoginquaFB.aspx">Đăng nhập bằng Facebook</asp:HyperLink>--%>

        <script>$(document).keyup(function (e) {
    if (e.keyCode == 13) { $("#<%=button.ClientID %>").click(); }
 })
 </script>
    <div style="cursor: pointer;" >
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="QuenMatKhau.aspx">Quên mật khẩu?</asp:HyperLink> 
    </div>
 </div>
</asp:Content>
