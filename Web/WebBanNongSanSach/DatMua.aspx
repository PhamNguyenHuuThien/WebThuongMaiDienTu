<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DatMua.aspx.cs" Inherits="WebBanNongSanSach.DatMua" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">

    <h3 class="title">GIỎ HÀNG</h3>
    <div class="content-top">
        <div class=" ">
            <!--  -->
            <div id="showText" class="detail_buy">

                <div class="head_title_center buy_title_cus1">Giỏ hàng của bạn</div>
                <div class="boxstyle_center buy_body_cus1">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="proTop">
                                        <tbody>
                                            <tr>
                                                <td width="50%" colspan="2" align="center" valign="top">
                                                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                        <tbody>
                                                            <tr>
                                                                <td height="8"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="8">
                                                                    <table border="0" width="100%" cellspacing="0" cellpadding="4" style="border-collapse: collapse; font-family: Tahoma; font-size: 11px;" bordercolor="#cccccc">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td width="120">
                                                                                    <div class="text_color required">Họ</div>
                                                                                </td>
                                                                                <td widht="400"><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbHo" Style="width: 100%;" class="box_input" placeholder="Họ" runat="server"></asp:TextBox>
                                                                                 
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="120">
                                                                                    <div class="text_color required">Tên</div>
                                                                                </td>
                                                                                <td widht="400"><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbTen" Style="width: 100%;" class="box_input" placeholder="Tên" runat="server"></asp:TextBox>
                                                                                 
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="120">
                                                                                    <div class="text_color required">Email</div>
                                                                                </td>
                                                                                <td><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbEmail" Style="width: 100%;" class="box_input" placeholder="Email" runat="server"></asp:TextBox>

                                                                                </span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="text_color">Công ty</div>
                                                                                </td>
                                                                                <td><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbCongty" Style="width: 100%;" class="box_input" placeholder="Công ty" runat="server"></asp:TextBox>

                                                                                </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="text_color required">Địa chỉ</div>
                                                                                </td>
                                                                                <td><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbDiaChi" Style="width: 100%;" class="box_input" placeholder="Địa chỉ" runat="server"></asp:TextBox>

                                                                                </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="text_color required">Số điện thoại</div>
                                                                                </td>
                                                                                <td><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbDienThoai" Style="width: 100%;" class="box_input" placeholder="Số điện thoại" runat="server"></asp:TextBox>

                                                                                </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="text_color">Fax</div>
                                                                                </td>
                                                                                <td><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbFax" Style="width: 100%;" class="box_input" placeholder="Fax" runat="server"></asp:TextBox>

                                                                                </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="text_color">Nội dung</div>
                                                                                </td>
                                                                                <td><span class="from" style="display: block; padding-left: 5px;">
                                                                                    <asp:TextBox ID="txbNoiDung" Rows="5" Style="width: 100%;" class="box_input" placeholder="Ghi chú" runat="server" TextMode="MultiLine"></asp:TextBox>

                                                                                </span>
                                                                                </td>
                                                                            </tr>


                                                                            <tr>
                                                                                <td colspan="2">

                                                                                    <asp:GridView ID="GVGioHang" runat="server" AutoGenerateColumns="False" CssClass="list_table_class list_table_cus1" DataKeyNames="MaSP">
                                                                                        <Columns>
                                                                                            <asp:BoundField DataField="MaSP" Visible="False" />
                                                                                            <asp:TemplateField HeaderText="Sản phẩm">

                                                                                                <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' Height="<%# 50 %>" Width="<%# 50 %>" />
                                                                                                    <%--                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TenSP") %>'></asp:Label>--%>
                                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ChiTietSanPham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Bind("TenSP") %>'></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <HeaderStyle CssClass="cart_header cart_header_cus1 text_color" />
                                                                                                <ItemStyle CssClass="shoppingcart cart_cus1" Width="270px" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Số lượng">

                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Soluong") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" ReadOnly="True" />
                                                                                            <asp:TemplateField HeaderText="Đơn giá">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Thành tiền">
                                                                                                <ItemTemplate>

                                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDouble(Eval("Soluong").ToString()) * Convert.ToDouble(Eval("GiaBan").ToString())+ " <sup>đ</sup>" %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>



                                                                                        </Columns>

                                                                                    </asp:GridView>

                                                                                    <br>
                                                                                    <div align="right"><font size="+1" color="#FF0000">Thành tiền : <asp:Label ID="lbTongThanhTien" runat="server" Text="0"></asp:Label></font></div>
                                                                                    <div align="right">
                                                                                        <i><b><font color="green" style="display: none;">
                                                                           
                                                                        </font></b></i>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <table class="tt_table_1 tt_table_cus1" border="1" width="100%" cellspacing="0" cellpadding="4" style="border-collapse: collapse; font-family: Tahoma; font-size: 11px;" bordercolor="#cccccc">
                                                                        <tbody>
                                                                            <tr class="tt_row_1 tt_row_cus1" bgcolor="#FFCC99">
                                                                                <td class="tt_col tt_col_cus1" width="150" bgcolor="#dddddd">
                                                                                    <strong>Loại hình thanh toán</strong></td>
                                                                                <td class="tt_col tt_col_cus2 tt_col_cus2_js" bgcolor="#dddddd">

                                                                                    <!-- //update by lh -->
                                                                                    <div class="row_nam ttnam_cus1">

                                                                                        <asp:RadioButtonList ID="HinhThuc" runat="server">
                                                                                            <asp:ListItem Value="0" Selected="True">Thanh toán khi nhận hàng</asp:ListItem>
                                                                                            <asp:ListItem Value="1">Thanh toán Trực tiếp bằng Bảo Kim</asp:ListItem>
                                                                                        </asp:RadioButtonList>

                                                                                    </div>
                                                                                    <!-- //end -->


                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="50%" align="center"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p align="center" style="padding-left: 8px; padding-top: 5px;">
                                        <span class="submitbutton disdathang" style="display: none">Đang xử lý ...</span>
                                        <asp:LinkButton ID="lbtnThanhToan" CssClass="submitbutton" runat="server" OnClick="lbtnThanhToan_Click">Đặt mua</asp:LinkButton>

                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="clear" style="height: 1px;"></div>
                </div>
            </div>
            <div class="clear"></div>
            <!--  -->
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</asp:Content>
