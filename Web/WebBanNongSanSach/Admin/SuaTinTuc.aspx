<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="SuaTinTuc.aspx.cs" Inherits="WebBanNongSanSach.Admin.SuaTinTuc" validateRequest="false"%>
<%@ Register Src="~/ckEditor.ascx" TagPrefix="uc1" TagName="ckEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../ckfinder/ckfinder.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="w-100">
                <tr>
                    <td>Mã tin tức: </td>
                    <td>
                        <asp:TextBox ID="txbMaTinTuc" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tiêu đề bài viết<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ControlToValidate="txbMaTinTuc" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="txbTieuDe" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ngày đăng :</td>
                    <td>
                        <asp:Calendar ID="cldNgayDang"  runat="server" OnSelectionChanged="cldNgayDang_SelectionChanged" ></asp:Calendar>
                        <asp:TextBox ID="txbNgayDang" CssClass="form-control" runat="server" ReadOnly="True" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả ngắn:</td>
                    <td><asp:TextBox ID="txbMoTa" CssClass="form-control" runat="server" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Nội dung :</td>
                    <td><uc1:ckEditor runat="server" id="ckEditor" />
                        <script>CKFinder.setupCKEditor(null,'/ckfinder');</script></td>
                </tr>
                
                <tr>
                    <td>Hình ảnh</td>
                    <td>
                        <asp:Image ID="imgHinh" runat="server" width="100px" Height="100px"/>
                        <asp:FileUpload ID="TaiHinhAnh" runat="server" ToolTip="Chọn hình ảnh" accept=".png,.jpg,.jpeg,.gif" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Chỉ được tải lên định dạng ảnh" ControlToValidate="TaiHinhAnh" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                
                
            </table>
    <asp:Button ID="btnUpdate" runat="server" cssclass="btn btn-info" Text="Cập nhật"   ForeColor="White" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnDelete" runat="server" cssclass="btn btn-info" Text="Xoá tin tức"   ForeColor="White" OnClick="btnDelete_Click"  />
</asp:Content>
