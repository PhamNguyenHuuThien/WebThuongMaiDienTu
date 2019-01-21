<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="ThemTag.aspx.cs" Inherits="WebBanNongSanSach.Admin.ThemTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="w-100">
                <tr>
                    <td>Mã Tag: </td>
                    <td>
                        <asp:TextBox ID="txbMaTag" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Từ khoá<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ControlToValidate="txbTuKhoa" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="txbTuKhoa" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tên Tag <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ControlToValidate="txbTenTag" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="txbTenTag" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
   
                
            </table>
    <asp:Button ID="btnUpdate" runat="server" cssclass="btn btn-info" Text="Thêm Tag"   ForeColor="White" OnClick="btnUpdate_Click" />
</asp:Content>
