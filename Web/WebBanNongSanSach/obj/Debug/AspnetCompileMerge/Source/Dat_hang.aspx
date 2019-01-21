<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Dat_hang.aspx.cs" Inherits="WebBanNongSanSach.Dat_hang" %>
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
        <form name="TheFormX" onsubmit="return Check_Shopping_Cart();" action="Dat_hang.aspx" method="post">
            <input type="hidden" name="module" value="order">
            <input type="hidden" name="action" value="thanhtoandatmuasanpham">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="proTop">
                            <tbody><tr>
                                <td width="50%" colspan="2" align="center" valign="top">
                                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody><tr>
                                            <td height="8"></td>
                                        </tr>
                                        <tr>
                                            <td height="8">
                                                <table border="0" width="100%" cellspacing="0" cellpadding="4" style="border-collapse: collapse; font-family:Tahoma; font-size:11px;" bordercolor="#cccccc">
                                                    <tbody><tr>
                                                        <td width="120">
                                                            <div class="text_color required">Họ tên</div>
                                                        </td>
                                                        <td widht="400"><span class="from" style="display:block; padding-left:5px;">
                                                <input name="tendaydu" value="" type="text" style="width:100%;" class="box_input" placeholder="Họ tên"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="120">
                                                            <div class="text_color required">Email</div>
                                                        </td>
                                                        <td><span class="from" style="display:block; padding-left:5px;">
                                                          <input name="email" value="" type="text" style="width:100%" class="box_input" placeholder="Email">
                                                  </span></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="text_color">Thuộc công ty</div>
                                                        </td>
                                                        <td><span class="from" style="display:block; padding-left:5px;">
                                                  <input name="tencongty" value="" type="text" style="width:100%" class="box_input" placeholder="Thuộc công ty">
                                                  </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="text_color required">Địa chỉ</div>
                                                        </td>
                                                        <td><span class="from" style="display:block; padding-left:5px;">
                                                          <input name="diachi" value="" type="text" style="width:100%" class="box_input" placeholder="Địa chỉ">
                                                  </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="text_color required">Số điện thoại</div>
                                                        </td>
                                                        <td><span class="from" style="display:block; padding-left:5px;">
                                                  <input name="dienthoai" value="" type="text" style="width:100%" class="box_input" placeholder="Số điện thoại">
                                                  </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="text_color">Fax</div>
                                                        </td>
                                                        <td><span class="from" style="display:block; padding-left:5px;">
                                                          <input name="fax" value="" type="text" style="width:100%" class="box_input" placeholder="Fax">
                                                        </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="text_color">Nội dung</div>
                                                        </td>
                                                        <td><span class="from" style="display:block; padding-left:5px;">
                                                      <textarea rows="5" name="noidung" type="text" style="width:100%" class="box_input" placeholder=""></textarea>
                                                        </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="text_color required">Mã bảo vệ</div>
                                                        </td>
                                                        <td>
                                                            <div class="divmabaove">
                                                                <div class="divinputmabaove">
                                                                    <input style="width: 100%; text-transform: uppercase" name="mabaove" type="text">
                                                                </div>
                                                                <div class="divimgcaptcha autoCaptcha" data-type="order"><img src="/imgcode.php?time=0.9908890125340839&amp;type=order"><a class="renewCaptcha"><i class="fa fa-refresh" aria-hidden="true"></i></a></div>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <table class="list_table_class list_table_cus1" border="1" width="100%" cellspacing="0" cellpadding="4" style="border-collapse: collapse; font-family:Tahoma; font-size:11px;" bordercolor="#cccccc">
                                                                <tbody><tr class="list_row list_row_cus1" bgcolor="#FFCC99">
                                                                    <td class="list_col list_col_cus1" width="90" bgcolor="#dddddd">
                                                                        <strong>Sản phẩm</strong>
                                                                    </td>
                                                                    <td class="list_col list_col_cus2" width="70" bgcolor="#dddddd">
                                                                        <strong>Số lượng</strong>
                                                                    </td>
                                                                    <td class="list_col list_col_cus3" width="70" bgcolor="#dddddd">
                                                                        <strong>Đơn giá</strong>
                                                                    </td>
                                                                    <td class="list_col list_col_cus4" width="90" bgcolor="#dddddd">
                                                                        <strong>Thành tiền</strong>
                                                                    </td>
                                                                                                                                    </tr>
                                                                                                                            </tbody></table>
                                                            <br>
                                                            <div align="right"><font size="+1" color="#FF0000">Thành tiền                                                                    : 0</font></div>
                                                            <div align="right"><i><b><font color="green" style="display:none;">
                                                                            <script type="text/javascript">document.write(Num2Word());</script>
                                                                        </font></b></i></div>
                                                        </td>
                                                    </tr>
                                                </tbody></table>
                                                <table class="tt_table_1 tt_table_cus1" border="1" width="100%" cellspacing="0" cellpadding="4" style="border-collapse: collapse; font-family:Tahoma; font-size:11px;" bordercolor="#cccccc">
                                                    <tbody><tr class="tt_row_1 tt_row_cus1" bgcolor="#FFCC99">
                                                        <td class="tt_col tt_col_cus1" width="150" bgcolor="#dddddd">
                                                            <strong>Loại hình thanh toán</strong></td>
                                                        <td class="tt_col tt_col_cus2 tt_col_cus2_js" bgcolor="#dddddd">

                                                            <!-- //update by lh -->
                                                                                                                            <div class="row_nam ttnam_cus1"><label><input name="id_thanhtoan" value="1" type="radio">Thanh toán khi nhận hàng</label></div>
                                                                                                                        
                                                                <div class="row_nam ttnam_cus2"><label><input name="id_thanhtoan" value="2" type="radio" checked="checked">Thanh toán tại công ty</label></div>
                                                                                                                        <!-- //end -->
                                                            
                                                                                                                                                                                    <script>
                                                                $(function () {
                                                                    $(".tt_col_cus2_js").click(function () {
                                                                        var ischeck = document.getElementById("id_thanhtoan_chuyenkhoan").checked;
                                                                        if (ischeck) $(".global_thanhtoanchuyenkhoan").show('200');
                                                                        else $(".global_thanhtoanchuyenkhoan").hide('200');

                                                                        var ischeckpp = document.getElementById("id_thanhtoan_paypal").checked;
                                                                        if (ischeckpp) $(".glo-img-paypal").show('200');
                                                                        else $(".glo-img-paypal").hide('200');

                                                                        var ischeckbk = document.getElementById("id_thanhtoan_baokim").checked;
                                                                        if (ischeckbk) $(".glo-thanhtoan-baokum").show('200');
                                                                        else $(".glo-thanhtoan-baokum").hide('200');

                                                                        var ischeckbk = document.getElementById("id_thanhtoan_nganluong").checked;
                                                                        if (ischeckbk) $(".glo-thanhtoan-nganluong").show('200');
                                                                        else $(".glo-thanhtoan-nganluong").hide('200');

                                                                        var ischeckop = document.getElementById("id_thanhtoan_onpay").checked;
                                                                        if (ischeckop) $(".glo-thanhtoan-onepay").show('200');
                                                                        else $(".glo-thanhtoan-onepay").hide('200');
                                                                    });

                                                                    // Chon loai thanh toan dau tien neu khong co mac dinh nao ca
                                                                    if ($(':radio[name=id_thanhtoan]:checked').length === 0) {
                                                                        $(':radio[name=id_thanhtoan]:first').prop('checked', true);
                                                                    }
                                                                })
                                                            </script>
                                                        </td>
                                                    </tr>
                                                </tbody></table>
                                            </td>
                                        </tr>
                                    </tbody></table>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" align="center"></td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
                <tr>
                    <td><p align="center" style="padding-left:8px;padding-top:5px;">
                            <span class="submitbutton disdathang" style="display: none">Đang xử lý ...</span>
                            <input type="submit" name="thanhtoandatmuasanpham" value="Đặt hàng" class="submitbutton" style="width:200px;">
                        </p>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </tbody></table>
        </form>
        <div class="clear" style="height:1px;"></div>
    </div>
          </div>
          <div class="clear"></div>
          <!--  -->
        </div>
        <div class="clearfix"> </div>
      </div>
      <div class="clearfix"> </div>

</asp:Content>
