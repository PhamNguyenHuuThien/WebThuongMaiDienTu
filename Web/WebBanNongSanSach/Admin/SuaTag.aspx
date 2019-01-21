<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="SuaTag.aspx.cs" Inherits="WebBanNongSanSach.Admin.SuaTag" %>
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
    <asp:Button ID="btnUpdate" runat="server" cssclass="btn btn-info" Text="Cập nhật"   ForeColor="White" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnDelete" runat="server" cssclass="btn btn-info" Text="Xoá Tag"   ForeColor="White" OnClick="btnDelete_Click"  />
</asp:Content>
