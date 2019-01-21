<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="Quanlygiaodien.aspx.cs" Inherits="WebBanNongSanSach.Admin.Quanlygiaodien" validateRequest="false"%>

<%@ Register Src="~/ckEditor.ascx" TagPrefix="uc1" TagName="ckEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../ckfinder/ckfinder.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    <!-- Nav pills -->
    <ul class="nav nav-tabs" role="tablist" id="mytabs">
        <li class="nav-item">
            <a class="nav-link active show" data-toggle="tab" href="#Thongtintrang">Thông tin trang</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#Menu">Menu</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#Sanphamnoibat">Sản phẩm nổi bật</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#Tintucnoibat">Tin tức nổi bật</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#Tags">Tags</a>
        </li>
       <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#Logotrang">Logo trang</a>
        </li>--%>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div id="Thongtintrang" class="container tab-pane active show">
            <table class="w-100">
        <tr>
            <td>Số điện thoại</td>
            <td>
                <asp:TextBox ID="txbSDT" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
                <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txbEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr>
                <tr>
            <td>Địa chỉ</td>
            <td>
                <asp:TextBox ID="txbDiaChi" runat="server" CssClass="form-control"></asp:TextBox></td>
        </tr><tr>
            <td>Trang giới thiệu</td>
            <td>
                <uc1:ckEditor runat="server" ID="ckEditor" />
                <script>CKFinder.setupCKEditor(null,'/ckfinder');</script>
                </td>
        </tr>
    </table>
            
           


  





            <asp:Button ID="btnLuuThongTinTrang" runat="server" Text="Lưu" CssClass="btn alert-info" OnClick="btnLuuThongTinTrang_Click"/>
        </div>
        <div id="Menu" class="container tab-pane fade">
             <asp:GridView ID="gvMenu" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCancelingEdit="gvMenu_RowCancelingEdit" OnRowEditing="gvMenu_RowEditing" OnRowUpdating="gvMenu_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Mã Menu">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>' ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="menu" HeaderText="Tên Menu" />
                    <asp:BoundField DataField="Link" HeaderText="Đường dẫn" />
                    <asp:BoundField DataField="subid" HeaderText="Là mục con của" />
                    <asp:CheckBoxField DataField="Visible" HeaderText="Có mục con" />
                    <asp:BoundField DataField="Sorting" HeaderText="Thứ tự" />
                    <asp:CommandField CancelText="Huỷ" EditText="Sửa" HeaderText="Thay đổi" ShowEditButton="True" UpdateText="Cập nhật">
                    <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>


        <div id="Sanphamnoibat" class="container tab-pane fade">
                      <table class="w-100">
                <tr>
                    <td>Sản phẩm thứ 1: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuNhat" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Sản phẩm thứ 2: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuHai" runat="server"></asp:DropDownList></td>
                </tr><tr>
                    <td>Sản phẩm thứ 3: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuBa" runat="server"></asp:DropDownList></td>
                </tr><tr>
                    <td>Sản phẩm thứ 4: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuTu" runat="server"></asp:DropDownList></td>
                </tr><tr>
                    <td>Sản phẩm thứ 5: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuNam" runat="server"></asp:DropDownList></td>
                </tr><tr>
                    <td>Sản phẩm thứ 6: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuSau" runat="server"></asp:DropDownList></td>
                </tr><tr>
                    <td>Sản phẩm thứ 7: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuBay" runat="server"></asp:DropDownList></td>
                </tr><tr>
                    <td>Sản phẩm thứ 8: </td>
                    <td>
                        <asp:DropDownList ID="ddlSanPhamThuTam" runat="server"></asp:DropDownList></td>
                </tr>
            </table>
            <asp:Button ID="btnLuuSPNoiBat" runat="server" Text="Lưu" CssClass="btn alert-info" OnClick="btnLuuSPNoiBat_Click" />
        </div>



        <div id="Tintucnoibat" class="container tab-pane fade">
            
            <table class="w-100">
                <tr>
                    <td>Tin tức thứ 1: </td>
                    <td>
                        <asp:DropDownList ID="ddlTinTuc1" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Tin tức thứ 2: </td>
                    <td>
                        <asp:DropDownList ID="ddlTinTuc2" runat="server"></asp:DropDownList></td>
                </tr>
              <tr>
                    <td>Tin tức thứ 3: </td>
                    <td>
                        <asp:DropDownList ID="ddlTinTuc3" runat="server"></asp:DropDownList></td>
                </tr>
              <tr>
                    <td>Tin tức thứ 4: </td>
                    <td>
                        <asp:DropDownList ID="ddlTinTuc4" runat="server"></asp:DropDownList></td>
                </tr>
              
            </table>
            <asp:Button ID="btnLuuTintucnoibat" runat="server" Text="Lưu" CssClass="btn alert-info" OnClick="btnLuuTintucnoibat_Click" />
        </div>
        <%--<div id="Logotrang" class="container tab-pane fade">
            abc
        </div>--%>
         <div id="Tags" class="container tab-pane fade">
 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Admin/ThemTag.aspx' Text="Thêm" CssClass="btn btn-info" ForeColor="White"></asp:HyperLink>
<asp:GridView ID="gvTags" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" >
               <Columns>
                    <asp:TemplateField HeaderText="Mã Tag">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID") %>' ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="linktag" HeaderText="Từ khoá" />
                    <asp:BoundField DataField="tentag" HeaderText="Tên Tag" />
                   <asp:TemplateField HeaderText="Thay đổi">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/SuaTag.aspx?MaTag="+Eval("ID") %>' Text="Sửa" CssClass="btn btn-info" ForeColor="White"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>

         </div>
    </div>
</asp:Content>
