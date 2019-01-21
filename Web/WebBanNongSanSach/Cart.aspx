<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebBanNongSanSach.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
    Giỏ hàng của <%= (Session["TenDN"]) != null ? Session["TenDN"] : "bạn"  %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">

    <h3 class="title">GIỎ HÀNG CỦA <%= (Session["TenDN"]) != null ? Session["TenDN"] : "BẠN"  %></h3>
    <div class="content-top">
        <%--   <%= DateTime.UtcNow %>
        <%=DateTime.Now.ToLocalTime() %> --%>
        <div class=" ">
            <!--  -->
            <div id="showText" class="detail_cart">
                <div class="head_title_center cart_title cart_title_cus1">Thanh toán</div>
                <div class="boxstyle_center cart_center  cart_center_cus1">
                    <input type="hidden" name="module" value="order">
                    <input type="hidden" name="action" value="cart_maxvalue">
                    <div class="table-responsive">
                    <asp:GridView ID="GVGioHang" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="MaSP" OnRowCancelingEdit="GVGioHang_RowCancelingEdit" OnRowEditing="GVGioHang_RowEditing" OnRowUpdating="GVGioHang_RowUpdating" OnRowUpdated="GVGioHang_RowUpdated" OnRowDeleting="GVGioHang_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="MaSP" Visible="False" />
                            <asp:TemplateField HeaderText="Sản phẩm">
                                <EditItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' Height="<%# 50 %>" Width="<%# 50 %>" />
                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' Height="<%# 50 %>" Width="<%# 50 %>" />
                                    <%--                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TenSP") %>'></asp:Label>--%>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ChiTietSanPham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Bind("TenSP") %>'></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="cart_header" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle CssClass="shoppingcart cart_cus1" Width="270px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Số lượng">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSoLuong" runat="server" type="number" step='<%# (Eval("DVT").ToString()) == "kg" ? 0.1 : 1 %>' min="0" max="5" value='<%# Eval("Soluong") %>'></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Soluong") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="cart_header" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" ReadOnly="True">
                                <HeaderStyle CssClass="cart_header" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Đơn giá">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="cart_header" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thành tiền">
                                <ItemTemplate>

                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDouble(Eval("Soluong").ToString()) * Convert.ToDouble(Eval("GiaBan").ToString())+ " <sup>đ</sup>" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:CommandField CancelText="Huỷ" EditText="Sửa" HeaderText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                            <asp:CommandField DeleteText="[x]" HeaderText="Xoá" ShowDeleteButton="True" />

                        </Columns>

                    </asp:GridView>
                        </div>



                    <asp:Label ID="thongbao" runat="server"></asp:Label>
                    <table class="table_boder table_boder_cus1" border="0" width="100%" cellspacing="0" cellpadding="5" style="border-collapse: collapse; font-family: Tahoma; font-size: 11px;" bordercolor="#CCCCCC">
                        <tbody>
                            <tr>
                                <td bgcolor="#efefef">
                                    <div align="right"><strong>Tổng tiền:</strong></div>
                                </td>
                                <td colspan="3" bgcolor="#efefef">
                                    <div align="right">
                                        <font color="red" size="+1"><b><div style="float:right;" id="ttmoney"><asp:Label ID="lbTongThanhTien" runat="server" Text="0"></asp:Label></div></b></font>
                                        <br>
                                        
                                    </div>
                                </td>
                                <td bgcolor="#efefef">&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>

                    <div align="right">
                        <br />
                        <span style="padding-left: 8px; padding-top: 5px;">
                            <asp:LinkButton ID="LinkButton1" CssClass="submitbutton" runat="server" OnClick="LinkButton1_Click">Xoá giỏ hàng </asp:LinkButton>
                        </span>
                        <span style="padding-left: 8px; padding-top: 5px;">
                            <asp:LinkButton ID="LinkButton2" CssClass="submitbutton" runat="server" OnClick="LinkButton2_Click">Mua thêm sản phẩm khác </asp:LinkButton>
                        </span>
                        <span style="padding-left: 8px; padding-top: 5px;">
                            <asp:LinkButton ID="lbtnDatmua" CssClass="submitbutton" Style="width: 120px;" runat="server" OnClick="lbtnDatmua_Click">Đặt mua </asp:LinkButton>

                        </span>
                    </div>
                </div>
                <div class="clear" style="height: 1px;"></div>
            </div>
            <div class="clear"></div>
            <!--  -->
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>

</asp:Content>
