<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="Quanlysanpham.aspx.cs" Inherits="WebBanNongSanSach.Admin.Quanlysanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:GridView ID="gvSanpham" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSP" OnRowEditing="gvSanpham_RowEditing" OnRowUpdating="gvSanpham_RowUpdating" OnRowCancelingEdit="gvSanpham_RowCancelingEdit" OnRowDeleting="gvSanpham_RowDeleting">
        <Columns>
            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="Tensp" HeaderText="Tên sản phẩm" />
            <asp:BoundField HeaderText="Giá gốc" />
            <asp:BoundField DataField="Giaban" HeaderText="Giá bán" />
            <asp:BoundField DataField="donvitinh" HeaderText="Đơn vị tính" />
            <asp:BoundField DataField="Motangan" HeaderText="Mô tả ngắn" />
            <asp:BoundField DataField="Mota" HeaderText="Mô tả" />
            <asp:BoundField DataField="hinhminhhoa" HeaderText="Hình minh hoạ" />
            <asp:BoundField DataField="maloai" HeaderText="Mã loại" />
            <asp:BoundField DataField="Soluongban" HeaderText="Số lượng hiện có" />
            <asp:CommandField ButtonType="Button" CancelText="Huỷ" DeleteText="Xoá" EditText="Sửa" HeaderText="Thay đổi" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
        </Columns>
    </asp:GridView>
</asp:Content>
