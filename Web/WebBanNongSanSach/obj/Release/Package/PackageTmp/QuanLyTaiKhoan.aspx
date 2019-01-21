<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoan.aspx.cs" Inherits="WebBanNongSanSach.QuanLyTaiKhoan" %>

<%@ Register Src="~/UCHead.ascx" TagPrefix="uc1" TagName="UCHead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:UCHead runat="server" ID="UCHead" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">

    <div class="boxstyle_center text_color">
        <input name="action" type="hidden" value="doi_thong_tin_thanh_vien">
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
            <tbody>
                <tr>
                    <td colspan="2">
                        <div class="header_cp">Thông tin tài khoản</div>
                    </td>
                </tr>
                <tr>
                    <td width="120"><strong>Tên truy cập</strong></td>
                    <td><strong>
                        <asp:Label ID="lbUser" runat="server" Text="Label"></asp:Label></strong> | <em>không đổi được</em></td>
                </tr>
                <tr>
                    <td><strong>Email</strong></td>
                    <td><strong>
                        <asp:Label ID="lbEmail" runat="server" Text="Label"></asp:Label></strong>  | <em>không đổi được</em></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="header_cp">Thông tin cá nhân</div>
                    </td>
                </tr>
                <tr>
                    <td><strong>Họ</strong></td>
                    <td>
                        <asp:TextBox ID="txbHo" CssClass="form-control" placeholder="Tên" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbHo" ErrorMessage="Vui lòng nhập vào Họ" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td><strong>Tên</strong></td>
                    <td>
                        <asp:TextBox ID="txbTen" CssClass="form-control" placeholder="Tên" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbTen" ErrorMessage="Vui lòng nhập vào Tên"></asp:RequiredFieldValidator></td>

                </tr>
                <tr>
                    <td><strong>Số điện thoại</strong></td>
                    <td>
                        <asp:TextBox ID="txbSDT" CssClass="form-control" placeholder="Số điện thoại" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbSDT" ErrorMessage="Vui lòng nhập vào SĐT"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbSDT" ErrorMessage="Vui lòng nhập đúng số điện thoại" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>Địa chỉ</strong></td>
                    <td>
                        <asp:TextBox ID="txbDiaChi" CssClass="form-control" placeholder="Nơi công tác" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbDiaChi" ErrorMessage="Hãy nhập vào địa chỉ"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>Thuộc công ty</strong></td>
                    <td>
                        <asp:TextBox ID="txbNoiCongTac" CssClass="form-control" placeholder="Nơi công tác" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbNoiCongtac" ErrorMessage="Hãy nhập vào tên công ty"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <div class="header_cp">Liên hệ</div>
                    </td>
                </tr>
                <tr>
                    <td><strong>Nick Facebook</strong></td>
                    <td>
                        <asp:TextBox ID="txbFacebook" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><strong>Nick Viber</strong></td>
                    <td>
                        <asp:TextBox ID="txbViber" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><strong>Nick Skype</strong></td>
                    <td>
                        <asp:TextBox ID="txbSkype" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:LinkButton ID="lbtDoiThongtin" cssclass="btn btn-danger"  runat="server" OnClick="lbtDoiThongtin_Click">Đổi thông tin</asp:LinkButton>
                </tr>
            </tbody>
        </table>
    </div>

</asp:Content>
