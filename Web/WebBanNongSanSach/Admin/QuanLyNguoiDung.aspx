<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" Inherits="WebBanNongSanSach.Admin.QuanLyNguoiDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="PNTraCuu" runat="server">
    <table class="table" >
        <tr>
            <td class="auto-style2">Tìm kiếm người dùng:<asp:TextBox ID="txbTraCuu" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RadioButtonList ID="tblLoaiTraCuu" runat="server" CssClass="radio" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0" >Tên truy cập</asp:ListItem>
                    <asp:ListItem Value="1">Họ tên người dùng</asp:ListItem>
                    <asp:ListItem Value="2">Số điện thoại</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="btnTraCuu0" runat="server" cssclass="btn btn-info" ForeColor="White" OnClick="btnTraCuu_Click" Text="Tra cứu" />
            </td>
            </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </asp:Panel>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowEditing="gvUsers_RowEditing">
        <Columns>
            <asp:TemplateField HeaderText="Mã KH">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("makh") %>' ReadOnly="true" Columns="1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("makh") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ho" HeaderText="Họ" />
            <asp:TemplateField HeaderText="Tên">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ten") %>' Columns="2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ten") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SĐT">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("sodienthoai") %>' Columns="3" TextMode="Number" MaxLength="10" min="0" max="999999999"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("sodienthoai") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Công ty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("noicongtac") %>' Columns="2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("noicongtac") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="tendangnhap" HeaderText="Tên đăng nhập" />
            <asp:TemplateField HeaderText="Mật khẩu">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='******' TextMode="Password"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='********'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("email") %>' TextMode="Email"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quyền quản trị">
                <EditItemTemplate>
                     <asp:CheckBox ID="chkAdmin" runat="server" Checked='<%# Eval("laadmin").ToString() =="True" ? true : false %>' />
                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("laadmin") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                   
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("laadmin").ToString() == "True" ? "Có" : "Không"  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kích hoạt">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkDuyet" runat="server" Checked='<%# Eval("daduyet").ToString() =="True" ? true : false %>' />
                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("daduyet") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("daduyet").ToString() == "True" ? "Có" : "Không"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="thoigian" HeaderText="Thời gian ĐK" DataFormatString="{0:hh:mm dd/MM/yyyy}" />
            <asp:BoundField DataField="facebook" HeaderText="Facebook" >
            <ControlStyle Width="15px" />
            </asp:BoundField>
            <asp:BoundField DataField="viber" HeaderText="Viber" />
            <asp:BoundField DataField="skype" HeaderText="Skype" />
            <asp:TemplateField HeaderText="Sửa">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "/Admin/SuaUser.aspx?MaUser="+Eval("Makh") %>' Text='<%# "Sửa" %>' CssClass="btn btn-info" ForeColor="White"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
</asp:Content>
