<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="WebBanNongSanSach.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">GIỎ HÀNG CỦA <%=Session["TenDN"] %></h3>
      <div class="content-top">
        <div class=" ">
          <!--  -->
            <div id="showText" class="detail_cart">
                  <div class="head_title_center cart_title cart_title_cus1">Giỏ hàng</div>
    <div class="boxstyle_center cart_center  cart_center_cus1">
            <input type="hidden" name="module" value="order">
            <input type="hidden" name="action" value="cart_maxvalue">

            <asp:GridView ID="GVGioHang" runat="server" AutoGenerateColumns="False" CssClass="table_boder table_boder_cus1" DataKeyNames="MaSP" OnRowCancelingEdit="GVGioHang_RowCancelingEdit" OnRowEditing="GVGioHang_RowEditing" OnRowUpdating="GVGioHang_RowUpdating" OnRowUpdated="GVGioHang_RowUpdated"  >
                <Columns>
                    <asp:BoundField DataField="MaSP" Visible="False" />
                    <asp:BoundField DataField="TenSP" HeaderText="Sản phẩm" ReadOnly="True" >
                    <HeaderStyle CssClass="cart_header cart_header_cus1 text_color" />
                    <ItemStyle CssClass="shoppingcart cart_cus1" Width="270px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Số lượng">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Soluong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Đơn giá">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("GiaBan") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thành tiền"></asp:TemplateField>
                    
                    <asp:CommandField CancelText="Huỷ" EditText="Sửa" HeaderText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                    <asp:CommandField DeleteText="Xoá" HeaderText="Xoá" ShowDeleteButton="True" />
                    
                </Columns>
                
            </asp:GridView>




            <asp:Label ID="thongbao" runat="server" ></asp:Label>
                <table class="table_boder table_boder_cus1" border="0" width="100%" cellspacing="0" cellpadding="5" style="border-collapse: collapse; font-family:Tahoma; font-size:11px;" bordercolor="#CCCCCC">
                <tbody><tr class="shoppingcart cart_cus1">
                    <td class="cart_header cart_header_cus1" style="border-right:1px solid #CCC;" width="270"><strong>
                            <div class="text_color">Sản phẩm</div>
                        </strong></td>
                    <td class="cart_header cart_header_cus2" style="border-right:1px solid #CCC;" width="50">
                        <div class="text_color">Số lượng</div>
                    </td>
                    <td class="cart_header cart_header_cus3" style="border-right:1px solid #CCC;" width="80">
                        <div align="right">
                            <div class="text_color">Đơn giá</div>
                        </div>
                    </td>
                    <td class="cart_header cart_header_cus4" style="border-right:1px solid #CCC;" width="80">
                        <div align="right">
                            <div class="text_color">Thành tiền</div>
                        </div>
                    </td>
                                        <td style="" width="20">
                        <div align="right">Xóa</div>
                    </td>
                </tr><tr><td bgcolor="#efefef"><div align="right"><strong>Tổng tiền:</strong></div></td>
                            <td colspan="3" bgcolor="#efefef">
                                    <div align="right">
                                        <font color="red" size="+1"><b><div style="float:right;">&nbsp; VNĐ</div><div style="float:right;" id="ttmoney"><asp:Label ID="lbTongThanhTien" runat="server" Text="0"></asp:Label></div></b></font><br>
                                        <div id="tt2word" style="display:none;"><i><script type="text/javascript">document.write(Num2Word());</script></i>
                                        </div>
                                    </div>
                            </td><td bgcolor="#efefef">&nbsp;</td></tr><input name="cart_maxvalue" id="maxvalue" type="hidden" value="1">
            </tbody></table>

            <div align="right"><span style="padding-left:8px;padding-top:5px;"> <br>
                <br>
            	<input type="button" onclick="window.open('/Sanpham.aspx','_self');" name="Submit" value="Xem ngay" class="submitbutton" style="width:150px;">
          		</span><span style="padding-left:8px;padding-top:5px;">
          		<input type="submit" name="gosubmit" value="Đặt mua" class="submitbutton" style="width:120px;">
          		</span></div>
    </div>
    <div class="clear" style="height:1px;"></div>
            </div>
            <div class="clear"></div>
            <!--  -->
        </div>
        <div class="clearfix"> </div>
      </div>
      <div class="clearfix"> </div>
</asp:Content>
