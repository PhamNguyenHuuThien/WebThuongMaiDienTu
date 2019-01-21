<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="SuaUser.aspx.cs" Inherits="WebBanNongSanSach.Admin.SuaUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 307px;
        }
        .auto-style2 {
            display: block;
            width: 100%;
            height: calc(2.0625rem + 2px);
            font-size: 0.875rem;
            line-height: 1.5;
            color: #5c6873;
            background-clip: padding-box;
            border-radius: 0.25rem;
            transition: none;
            border: 1px solid #e4e7ea;
            margin-left: 0;
            background-color: #fff;
        }
        .auto-style3 {
            display: block;
            width: 100%;
            height: calc(2.0625rem + 2px);
            font-size: 0.875rem;
            line-height: 1.5;
            color: #5c6873;
            background-clip: padding-box;
            border-radius: 0.25rem;
            transition: none;
            border: 1px solid #e4e7ea;
            margin-right: 0;
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">


    <table class="w-100">
        <tr>
            <td class="auto-style1">Mã khách hàng: </td>
            <td>
                <asp:TextBox ID="txbMaUser" runat="server" ReadOnly="true" CssClass="auto-style2"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Họ: </td>
            <td>
                <asp:TextBox ID="txbHo" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Tên: </td>
            <td>
                <asp:TextBox ID="txbTen" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">SĐT: </td>
            <td>
                <asp:TextBox ID="txbSDT" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Công ty: </td>
            <td>
                <asp:TextBox ID="txbCongTy" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Địa chỉ: </td>
            <td>
                <asp:TextBox ID="txbDiachi" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Tên đăng nhập: <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ControlToValidate="txbTenDN"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox ID="txbTenDN" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Mật khẩu: </td>
            <td>
                <asp:TextBox ID="txbMatKhau" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Email: </td>
            <td>
                <asp:TextBox ID="txbEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Quyền quản trị: </td>
            <td>
                <asp:CheckBox ID="chkQuanTri" runat="server" /></td>
        </tr>
        <tr>
            <td class="auto-style1">Kích hoạt tài khoản: </td>
            <td>
                <asp:CheckBox ID="chkKichHoat" runat="server" /></td>
        </tr>
        <tr>
            <td class="auto-style1">Facebook: </td>
            <td>
                <asp:TextBox ID="txbFaceBook" runat="server" CssClass="auto-style3"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Viber: </td>
            <td>
                <asp:TextBox ID="txbViber" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Skype: </td>
            <td>
                <asp:TextBox ID="txbSkype" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="btnLuu" runat="server" Text="Cập nhật" CssClass="btn alert-primary" OnClick="btnLuu_Click" />
    <asp:Button ID="btnXoa" runat="server" Text="Xoá người dùng"  CssClass="btn alert-secondary" OnClick="btnXoa_Click"/>

</asp:Content>
