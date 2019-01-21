<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="SuaSP.aspx.cs" Inherits="WebBanNongSanSach.Admin.SuaSP" validateRequest="false"  %>

<%@ Register Src="~/ckEditor.ascx" TagPrefix="uc1" TagName="ckEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../ckfinder/ckfinder.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
   <table class="w-100">
                <tr>
                    <td>Mã sản phẩm: </td>
                    <td>
                        <asp:TextBox ID="txbMaSP" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tên sản phẩm<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ControlToValidate="txbTenSP" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="txbTenSP" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Giá gốc</td>
                    <td><asp:TextBox ID="txbGiagoc" CssClass="form-control" runat="server" TextMode="Number" min="1" max="50000000"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Giá bán<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ControlToValidate="txbGiaban" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td><asp:TextBox ID="txbGiaBan" CssClass="form-control" runat="server" TextMode="Number" min="1" max="50000000"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Đơn vị tính<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)" ControlToValidate="txbDonvitinh" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td><asp:TextBox ID="txbDonvitinh" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả ngắn</td>
                    <td><asp:TextBox ID="txbMotangan" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả chi tiết</td>
                    <td>  <uc1:ckEditor runat="server" id="ckEditor" />
                        <script>CKFinder.setupCKEditor(null,'/ckfinder');</script>
                       </td>
                </tr>
                <tr>
                    <td>Hình ảnh</td>
                    <td>
                        <asp:Image ID="imgHinh" runat="server" width="100px" Height="100px"/>
                        <asp:FileUpload ID="TaiHinhAnh" runat="server" ToolTip="Chọn hình ảnh" accept=".png,.jpg,.jpeg,.gif" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Chỉ được tải lên định dạng ảnh" ControlToValidate="TaiHinhAnh" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td>Loại</td>
                    <td>
                        <asp:DropDownList ID="ddlMaLoai" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Số lượng hiện có</td>
                    <td>
                        <asp:TextBox ID="txbSoLuong" CssClass="form-control" runat="server" TextMode="Number" min="1" max="2000" Text="1"></asp:TextBox></td>
                </tr>
            </table>
    <asp:Button ID="btnUpdate" runat="server" cssclass="btn btn-info" Text="Cập nhật" OnClick="btnUpdate_Click"  ForeColor="White" />
    <asp:Button ID="btnDelete" runat="server" cssclass="btn btn-info" Text="Xoá sản phẩm"   ForeColor="White" OnClick="btnDelete_Click" />
</asp:Content>
