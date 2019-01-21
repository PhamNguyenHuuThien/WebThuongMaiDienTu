<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="Quanlysanpham.aspx.cs" Inherits="WebBanNongSanSach.Admin.Quanlysanpham" validateRequest="false" %>

<%@ Register Src="~/ckEditor.ascx" TagPrefix="uc1" TagName="ckEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function show(id) {
            var cont = document.getElementById(id);
            if (cont.style.display == 'block')
                cont.style.display = 'none';
            else
                cont.style.display = 'block';
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">



    <div class="">
        <!-- Nav pills -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#danhsach">Danh sách sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#themsp">Thêm sản phẩm mới</a>
            </li>
            
        </ul>
        <!-- Tab panes -->
        <div class="tab-content" >
            <div id="danhsach" class="container tab-pane active show">
                <br>
                <asp:Panel ID="PNTraCuu" runat="server">
    <table class="table" >
        <tr>
            <td class="auto-style2">Tìm kiếm sản phẩm:<asp:TextBox ID="txbTraCuu" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RadioButtonList ID="tblLoaiTraCuu" runat="server" CssClass="radio" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0" >Tên sản phẩm</asp:ListItem>
                    <asp:ListItem Value="1">Mã sản phẩm</asp:ListItem>
                    
                </asp:RadioButtonList>
                <asp:Button ID="btnTraCuu" runat="server" cssclass="btn btn-info" ForeColor="White" OnClick="btnTraCuu_Click" Text="Tra cứu" CausesValidation="False" />
            </td>
            </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </asp:Panel>

        <asp:GridView ID="gvSanpham" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSP" OnRowEditing="gvSanpham_RowEditing" OnRowUpdating="gvSanpham_RowUpdating" OnRowCancelingEdit="gvSanpham_RowCancelingEdit" OnRowDeleting="gvSanpham_RowDeleting" CssClass="table table-striped" >
        <Columns>
            <asp:TemplateField HeaderText="Mã sản phẩm">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"  Text='<%# Bind("MaSP") %>' ReadOnly="True"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaSP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Tensp" HeaderText="Tên sản phẩm" />
            <asp:TemplateField HeaderText="Giá gốc">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Giagoc") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Giagoc","{0:0,0 VNĐ}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá bán">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Giaban") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Giaban","{0:0,0 VNĐ}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="donvitinh" HeaderText="Đơn vị tính" />
            <asp:TemplateField HeaderText="Mô tả ngắn">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%#Eval("Motangan")%>' TextMode="MultiLine"></asp:TextBox>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text=''></asp:Label>
                    <a onclick='return void(0);' href="<%# DataBinder.Eval(Container,"RowIndex","javascript:show('Div{0}')") %>">
                                Xem chi tiết</a>
                            <div id='<%# DataBinder.Eval(Container,"RowIndex","Div{0}") %>' style="height: 100%;
                                border: solid red 1px; width: 100%; display: none; background-color:white">
                                <%#Eval("Motangan")%>
                            </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Mota") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text=''></asp:Label>
                      <a onclick='return void(0);' href="<%# DataBinder.Eval(Container,"RowIndex","javascript:show('Divv{0}')") %>">
                                Xem chi tiết</a>
                            <div id='<%# DataBinder.Eval(Container,"RowIndex","Divv{0}") %>' style="height: 100%;
                                border: solid red 1px; width: 100%; display: none; background-color:white">
                                <%#Eval("Mota")%>
                            </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình minh hoạ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("hinhminhhoa") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height='100px' ImageUrl='<%# "/Images/"+Eval("hinhminhhoa") %>' Width='100px' />
                    <br />
                   
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã loại">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("maloai") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#  Bind("maloai") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Soluongban" HeaderText="Số lượng hiện có" />
            <asp:CommandField ButtonType="Button" CancelText="Huỷ" DeleteText="Xoá" EditText="Sửa" HeaderText="Thay đổi" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" Visible="False" />
            
            
            <asp:TemplateField HeaderText="Sửa">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/SuaSP.aspx?MaSP="+Eval("MaSP") %>' Text="Sửa" CssClass="btn btn-info" ForeColor="White"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            
            
        </Columns>
        <RowStyle CssClass=".table-hover" />
    </asp:GridView>
                   
            </div>
            <div id="themsp" class="container tab-pane fade">

                
            
           
          
           
           
            
            <table class="w-100">
                <tr>
                    <td>Mã sản phẩm: </td>
                    <td>
                        <asp:TextBox ID="txbMaSP" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tên sản phẩm<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ControlToValidate="txbTenSP" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="txbTenSP" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Giá gốc</td>
                    <td><asp:TextBox ID="txbGiagoc" runat="server" CssClass="form-control" TextMode="Number" min="1" max="50000000"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Giá bán<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ControlToValidate="txbGiaban" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td><asp:TextBox ID="txbGiaBan" runat="server" CssClass="form-control" TextMode="Number" min="1" max="50000000"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Đơn vị tính<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)" ControlToValidate="txbDonvitinh" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td><asp:TextBox ID="txbDonvitinh" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả ngắn</td>
                    <td><asp:TextBox ID="txbMotangan" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả chi tiết</td>
                    <td>  <uc1:ckEditor runat="server" id="ckEditor" />
                        <script>CKFinder.setupCKEditor(null,'/ckfinder');</script>
                       </td>
                </tr>
                <tr>
                    <td>Hình ảnh<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)" ControlToValidate="TaiHinhAnh" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:Image ID="imgHinh" runat="server" />
                        <asp:FileUpload ID="TaiHinhAnh" runat="server" ToolTip="Chọn hình ảnh" accept=".png,.jpg,.jpeg,.gif" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Chỉ được tải lên định dạng ảnh" ControlToValidate="TaiHinhAnh" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td>Loại</td>
                    <td>
                        <asp:DropDownList ID="ddlMaLoai" cssclass="dropdown-toggle" data-toggle="dropdown" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Số lượng hiện có</td>
                    <td>
                        <asp:TextBox ID="txbSoLuong" runat="server" CssClass="form-control" TextMode="Number" min="1" max="2000" Text="1"></asp:TextBox></td>
                </tr>
            </table>
           <br />
            <asp:Button ID="btnThem" cssclass="btn btn-info" runat="server" Text="Thêm vào hệ thống" OnClick="btnThem_Click" ForeColor="White" />

             </div>
        </div>
    </div>














   
</asp:Content>
