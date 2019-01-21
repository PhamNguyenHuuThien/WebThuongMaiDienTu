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
    <div class="container" style="width:auto;">
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

                                    <li>
                                        <asp:LinkButton ID="adangnhap" CssClass="mem memdn" runat="server" OnClick="adangnhap_Click" >Đăng nhập</asp:LinkButton>
                           </li>
                                    <li>
                                        <asp:Label ID="lbTenDN" runat="server" Text="Xin chào "></asp:Label>
                                    
                                    <asp:HyperLink ID="lbThayDoiTT" href="/QuanLyTaiKhoan.aspx" runat="server" >Trang cá nhân</asp:HyperLink>
                                    </li>
                                    <li><a href='QuanLyHeThong.aspx' class='mem memdn' id="aQuanLy" runat="server">Quản lý hệ thống</a></li>
                                    <li><a href='reg.aspx'
                                        class='mem memdk' id="adangky" runat="server">Đăng ký</a>
                                        <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click">Đăng xuất</asp:LinkButton>
                                    </li>
                                </ul>

                                <div id="top_menu_admin_1" class='fix1000'>
                                    <div id='id_mem_login' class='trontron'>
                                
                                        

                                        <div class="clear"></div>
                                        <!-- <div class="dv-glo-login-mxh dv-glo-login-mxh-cus">
        <span></span> <a href="/login-fb/"  class='fb'><i class="fa fa-facebook"></i></a> <a class='gg'  href="/login-google/"><i class="fa fa-google"></i></a>
        <div class="clear"></div>
      </div> -->
                                        <div class="clear"></div>
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




