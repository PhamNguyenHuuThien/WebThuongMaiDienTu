<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="Quanlydondathang.aspx.cs" Inherits="WebBanNongSanSach.Admin.Quanlydondathang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1027px;
            text-align: right;
        }
        .auto-style2 {
            width: 1027px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="PNTraCuu" runat="server">
    <table class="table" >
        <tr>
            <td class="auto-style2">Tra cứu hoá đơn:<asp:TextBox ID="txbTraCuu" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RadioButtonList ID="tblLoaiTraCuu" runat="server" CssClass="radio" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0" >Mã hoá đơn</asp:ListItem>
                    <asp:ListItem Value="1">Họ tên khách</asp:ListItem>
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
    <asp:Button ID="btnLuu" runat="server" cssclass="btn btn-info" ForeColor="White"  Text="Lưu tình trạng đơn hàng" OnClick="btnLuu_Click" />
    <asp:GridView ID="gvDanhSachDonHang" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="madonhang">
         <HeaderStyle CssClass="thead-dark" />
            <Columns>
                <asp:BoundField DataField="ngaydathang" DataFormatString="{0:hh:mm dd/MM/yyyy}" HeaderText="Ngày đặt hàng" />
                <asp:TemplateField HeaderText="Mã đơn hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("madonhang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/Quanlydondathang.aspx?MaDH="+Eval("madonhang") %>' Text='<%# Bind("madonhang") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="tennguoinhan" HeaderText="Tên người nhận" />
                <asp:BoundField DataField="Dienthoainhan" HeaderText="Số điện thoại nhận" />
                <asp:BoundField DataField="noidung" HeaderText="Nội dung" />
                <asp:TemplateField HeaderText="Loại hình thanh toán">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("loaihinhthanhtoan") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("loaihinhthanhtoan").ToString() == "False" ? "Thanh toán khi nhận hàng" : "Thanh toán trực tuyến" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="trigia" DataFormatString="{0:0,0} VNĐ" HeaderText="Trị giá hoá đơn" />
                <asp:TemplateField HeaderText="Đã giao hàng">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("dagiaohang") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkDaGiao" runat="server" Checked='<%# Eval("dagiaohang").ToString() == "True" ? true : false %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <RowStyle CssClass=".table-hover" />
    </asp:GridView>
    <asp:GridView ID="gvChitietDonHang" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
        <Columns>
                <asp:BoundField DataField="madonhang" HeaderText="Mã đơn hàng" />
                <asp:BoundField DataField="tensp" HeaderText="Tên sản phẩm" />
                <asp:BoundField DataField="soluong" HeaderText="Số lượng" />
                <asp:BoundField DataField="donvitinh" HeaderText="Đơn vị tính" />
                <asp:BoundField DataField="dongia" DataFormatString="{0:0,0} VNĐ" HeaderText="Đơn giá" />
                <asp:TemplateField HeaderText="Thành tiền">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("thanhtien") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Convert.ToDouble(Eval("Soluong").ToString()) * Convert.ToDouble(Eval("dongia").ToString())+ " <sup>đ</sup>" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
    </asp:GridView>
    <asp:LinkButton ID="lbtnBack" runat="server" CssClass="btn alert-danger" OnClick="lbtnBack_Click">Quay lại</asp:LinkButton>
    <asp:Label ID="lblThongbao" runat="server" ></asp:Label>
</asp:Content>
