<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="Donhangcuatoi.aspx.cs" Inherits="WebBanNongSanSach.Donhangcuatoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="boxstyle_center text_color">
        <div class="header_cp"><strong>Đơn hàng của tôi</strong></div>
        <asp:Panel ID="PNTraCuu" runat="server">
    <table class="table" >
        <caption>
            Tìm hoá đơn:<asp:TextBox ID="txbTraCuu" runat="server" CssClass="form-control" placeholder="Nhập vào mã hoá đơn"></asp:TextBox>
            <asp:Button ID="btnTraCuu" runat="server" cssclass="btn btn-danger" OnClick="btnTraCuu_Click" Text="Tra cứu" />
        </caption>
        </tr>

    </table>
             
    </asp:Panel>
        <div class="table-responsive">
        <asp:GridView ID="gvDonHang" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
            <HeaderStyle CssClass="thead-dark" />
            <Columns>
                <asp:BoundField DataField="ngaydathang" DataFormatString="{0:hh:mm dd/MM/yyyy}" HeaderText="Ngày đặt hàng" />
                <asp:TemplateField HeaderText="Mã đơn hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("madonhang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Donhangcuatoi.aspx?MaDH="+Eval("madonhang") %>' Text='<%# Bind("madonhang") %>'></asp:HyperLink>
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
                <asp:CheckBoxField DataField="dagiaohang" HeaderText="Đã giao"  />
            </Columns>

            <RowStyle CssClass=".table-hover" />

        </asp:GridView></div>

        <asp:Label ID="lblHuongdan" runat="server" Text="Gợi ý: Bấm chọn vào mã đơn hàng để xem chi tiết đơn hàng."></asp:Label>
        <asp:GridView ID="gvChitietdonhang" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
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
        <br />
        <asp:LinkButton ID="lbtnBack" cssclass="btn btn-danger" runat="server" OnClick="lbtnBack_Click">Trở lại</asp:LinkButton>

    </div>
</asp:Content>
