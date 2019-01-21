<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCHeader.ascx.cs" Inherits="WebBanNongSanSach.UCHeader" %>
<%@ Register Src="~/UCMenuNgang.ascx" TagPrefix="uc1" TagName="UCMenuNgang" %>




<div class="head_top header_admin">
    <div class="bg_top">
        <script>
            function jsupdate(k, idclass, jscolor) {
                if (k == 0) $("." + idclass).css("background-color", "#" + jscolor);
                else if (k == 1) $("." + idclass).css("color", "#" + jscolor);
            }
        </script>
    </div>
</div>
<div class="header">
    <div class="container">
        <div class="header-top">
            <div class="logo ">
                <a href="Default.aspx">
                    <img alt='Thế giới rau sạch' class='img_logo' src='/images/<%=URLLogo %>'></a>
            </div>
            <div class="search-in">
                <div class="header-grid">
                    <ul>
                        <li class="in-up">Hotline: <a href="tel: 0164 671 4040" class="scroll"><%=SDT %></a>
                            <label>|</label></li>
                        <li class="in-up">Email: <a href="mailto:<%=Email %>" class="scroll"><%=Email %></a> </li>
                        <li class="dv-mem-login">
                            <div class="glo-dangky-gruop">
                                <script>
                                    function jsupdate(k, idclass, jscolor) {
                                        if (k == 0) $("." + idclass).css("background-color", "#" + jscolor);
                                        else if (k == 1) $("." + idclass).css("color", "#" + jscolor);
                                    }
                                </script>

                                <ul>

                                    <li><a href='' onclick="ShowHidden('id_mem_login'); return false;"
                                        class='mem memdn' id="adangnhap" runat="server">Đăng nhập</a></li>
                                    <li>
                                        <asp:Label ID="lbTenDN" runat="server" Text="Xin chào "></asp:Label></li>
                                    <li><a href='QuanLyHeThong.aspx' class='mem memdn' id="aQuanLy" runat="server">Quản lý hệ thống</a></li>
                                    <li><a href='reg.aspx'
                                        class='mem memdk' id="adangky" runat="server">Đăng ký</a>
                                        <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click">Đăng xuất</asp:LinkButton>
                                    </li>
                                </ul>

                                <div id="top_menu_admin_1" class='fix1000'>
                                    <div id='id_mem_login' class='trontron'>

                                        <input name='module' type='hidden' value='user' />
                                        <input name='action' type='hidden' value='member_login' />
                                        <div align='center'>
                                            <h2
                                                class='h2memberstop cus1'>THÀNH VIÊN ĐĂNG NHẬP</h2>
                                        </div>
                                        Tên truy cập               
                                                <input name='tentruycap' type='text' class='box_input' id='id_tentruycap' maxlength='65' runat="server" />
                                        Mật khẩu</strong>  
                                                <input name='matkhau' type='password' class='box_input' id='id_matkhau' value='' maxlength='65' runat="server" />

                                        <asp:Button ID='button' runat="server" CssClass='submitbutton' Text="Đăng Nhập" OnClick="button_Click" />
                                        <asp:Label ID="lbThongbao" runat="server" Text=""></asp:Label>
                                        <div style="cursor: pointer;"
                                            onclick="ShowHidden('id_mem_login');ShowHidden('id_mem_loss');">
                                            Quên mật khẩu?
                                        </div>

                                        <div class="clear"></div>
                                        <!-- <div class="dv-glo-login-mxh dv-glo-login-mxh-cus">
        <span></span> <a href="/login-fb/"  class='fb'><i class="fa fa-facebook"></i></a> <a class='gg'  href="/login-google/"><i class="fa fa-google"></i></a>
        <div class="clear"></div>
      </div> -->
                                        <div class="clear"></div>
                                    </div>
                                    <div id='id_mem_loss'
                                        style='position: absolute; top: 30px; z-index: 99999; display: none; background: #ccc; width: 250px; margin-left: 700px; padding: 10px;'
                                        class='trontron'>
                                        <form class='nomargin' id='memberlossit' action='' method='post' name='TheFormLogin'
                                            onsubmit="return Check_LossMember('email_loss'); return false;">
                                            <input type='hidden' name='module' value='user' />
                                            <input type='hidden' name='action' value='member_loss' />
                                            <div align='center'>
                                                <h2>QUÊN MẬT KHẨU</h2>
                                            </div>

                                            Xin nhập vào email của bạn:</strong>
               
                                                <input name='email' type='text' class='box_input' id='email_loss' maxlength='65' />
                                            <input class='submitbutton' type='submit' name='dangky' id='id_quenmatkhau'
                                                value='QUÊN MẬT KHẨU' />
                                            <div style="cursor: pointer;"
                                                onclick="ShowHidden('id_mem_login');ShowHidden('id_mem_loss');">
                                                nhớ rồi, đăng nhập lại
                                            </div>
                                        </form>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
                <div class="content-cart">
                    <div class="cart ">
                        <a href="Cart.aspx" class="cart-in"></a>
                        <asp:Label ID="lbTongSL" runat="server"></asp:Label>
                    </div>
                    <div class="search-top">
                        <div class="search">
                            <input type="text" class="key_timkiem" value="Nhập từ khóa tìm kiếm..." onfocus="if (this.value == 'Nhập từ khóa tìm kiếm...'){this.value='';}" onblur="if (this.value == '') {this.value='Nhập từ khóa tìm kiếm...';}" />
                            <input type="button" value="" onclick="SEARCH_btn()">
                            <script type="text/javascript">
                                function SEARCH_btn() {
                                    var key = $(".key_timkiem").val().replace(/ /g, "+");
                                    if (key.length < 2 || $(".key_timkiem").val() == 'Nhập từ khóa tìm kiếm...') {
                                        $(".key_timkiem").focus();
                                    }
                                    else window.location.href = "/Timkiem.aspx?keysearch=" + key;
                                }
                                $('.key_timkiem').keypress(function (event) {
                                    var keycode = (event.keyCode ? event.keyCode : event.which);
                                    if (keycode == '13') {
                                        SEARCH_btn();
                                    }
                                });
                            </script>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <uc1:UCMenuNgang runat="server" ID="UCMenuNgang" />
</div>




