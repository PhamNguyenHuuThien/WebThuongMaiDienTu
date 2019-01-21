<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="QuanLyTinTuc.aspx.cs" Inherits="WebBanNongSanSach.Admin.QuanLyTinTuc" validateRequest="false"%>

<%@ Register Src="~/ckEditor.ascx" TagPrefix="uc1" TagName="ckEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../ckfinder/ckfinder.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

     <!-- Nav pills -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#danhsach">Danh sách tin tức</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#themtintuc">Thêm tin tức mới</a>
            </li>
            
        </ul>

     <!-- Tab panes -->
     <div class="tab-content" >
            <div id="danhsach" class="container tab-pane active show">
                <br>

                <asp:GridView ID="gvTintuc" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="matintuc" HeaderText="Mã tin tức" />
                        <asp:BoundField DataField="ngaydang" DataFormatString="{0: dd/MM/yyyy}" HeaderText="Ngày đăng" />
                        <asp:BoundField DataField="tieude" HeaderText="Tên bài viết" />
                        <asp:TemplateField HeaderText="Hình minh hoạ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "/images/"+Eval("hinhminhhoa") %>' Width="100px" Height="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="motangan" HeaderText="Mô tả ngắn" />
                        <asp:TemplateField HeaderText="Thay đổi">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/SuaTinTuc.aspx?MaTinTuc="+Eval("MaTinTuc") %>' Text="Sửa" CssClass="btn btn-info" ForeColor="White"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>


         <div id="themtintuc" class="container tab-pane">
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
                        <asp:Calendar ID="cldNgayDang"  runat="server" OnSelectionChanged="cldNgayDang_SelectionChanged" SelectedDate="<%# DateTime.Today %>"></asp:Calendar>
                        <asp:TextBox ID="txbNgayDang" CssClass="form-control" runat="server" ReadOnly="True" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả ngắn:</td>
                    <td><asp:TextBox ID="txbMoTa" CssClass="form-control" runat="server" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Nội dung :</td>
                    <td><uc1:ckeditor runat="server" id="ckEditor" />
                        <script>CKFinder.setupCKEditor(null,'/ckfinder');</script></td>
                </tr>
                
                <tr>
                    <td>Hình ảnh</td>
                    <td>
                        <%--<asp:Image ID="imgHinh" runat="server" width="100px" Height="100px"/>--%>
                        <asp:FileUpload ID="TaiHinhAnh" runat="server" ToolTip="Chọn hình ảnh" accept=".png,.jpg,.jpeg,.gif" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Chỉ được tải lên định dạng ảnh" ControlToValidate="TaiHinhAnh" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                
                
            </table>
    <asp:Button ID="btnUpdate" runat="server" cssclass="btn btn-info" Text="Thêm"   ForeColor="White" OnClick="btnUpdate_Click" />

         </div>
         </div>
</asp:Content>
