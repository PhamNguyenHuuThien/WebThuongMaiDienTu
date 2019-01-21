<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuenMatKhau.aspx.cs" Inherits="WebBanNongSanSach.QuenMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
    Quên mật khẩu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    Quên mật khẩu<br />
    Hãy nhập vào Email mà bạn đã đăng ký trên hệ thống:<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbEmail" ErrorMessage="(*)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
<asp:TextBox ID="txbEmail" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Lấy lại mật khẩu" cssclass="submitbutton" OnClick="Button1_Click"/>
</asp:Content>
