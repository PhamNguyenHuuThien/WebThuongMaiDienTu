<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFooter.ascx.cs" Inherits="WebBanNongSanSach.UCFooter" %>

<div id="banner_footer">
        <ul>
            <li>
                <img src="./Images/apples-fruits-garden-6028.png" width="100%" /></li>
            <div class="clr"></div>
        </ul>
    </div>
    <div class="footer-copy">
        <div class="container">
            <div class="footer-copy-grids">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-6 col-min-12 footer-copy-grid footer-h1 cat wow bounceInLeft  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft">
                        <h3><span>THẾ GIỚI RAU SẠCH</span></h3>
                        <div class="nd">
                            <p>H&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để nhận được những tư vấn.</p>
                            <p>Địa chỉ: <%=Diachi %></p>
                            <p>Điện thoại: <a href="tel:<%=SDT %>"><%=SDT %></a></p>
                            <p>Email: <a href="mailto:<%=Email %>"><%=Email %></a></p>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 col-xs-6 col-min-12 footer-copy-grid footer-h2 wow bounceIn  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceIn;">
                        <h3><span>Giới thiệu</span></h3>
                        <ul class='nav-bottom navi_bottom  navi_bottom_cus1'>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Vechungtoi.aspx'>Về chúng tôi</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Tamnhinsumenh.aspx'>Tầm nhìn - sứ mệnh</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Bomaytochuc.aspx'>Bộ máy tổ chức</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Hethongphanphoi.aspx'>Hệ thống phân phối</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Doitac.aspx'>Đối tác</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 col-min-12 footer-copy-grid footer-h3 wow bounceInUp  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInUp;">
                        <h3><span>Điều khoản</span></h3>
                        <ul class='nav-bottom navi_bottom  navi_bottom_cus1'>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='ChinhSachRiengTu.aspx'>Chính Sách Riêng Tư</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='DieuKhoanDieuKien.aspx'>Điều Khoản & Điều Kiện</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='ThoaThuanNguoiDung.aspx'>Thỏa Thuận Người Dùng</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Chinhsachdoitra.aspx'>Chính sách đổi trả</a></li>
                            <li class='li_bottom li_bottom_cus1'><i class='' aria-hidden='true'></i><a class='a_navi_bottom a_navi_bottom_cus1' href='Chinhsachbaohanh.aspx'>Chính sách bảo hành</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 col-min-12 footer-copy-grid footer-h4 wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;">
                        <h3><span>ĐĂNG KÝ NHẬN TIN</span></h3>
                        <p>Đăng ký email để nhận thông tin khuyến mãi mới nhất từ chúng tôi!</p>
                        <label>
                            <input type="text" name="newsletter" id="newsletter_id" value="Nhập địa chỉ email..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nhập địa chỉ email...';}">
                            <input type="button" value="Đăng ký" onclick="return NewsLetter();">
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>

    <!--footer-->
    <div class="footer">
        <div class="container">
            <p class="footer-grid wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;">
                <span class="footer_copyright"><a target="_blank" href="#" title="Thiết Kế Website" class="a_copyright">Thiết Kế Website bởi PNHT
              
             
        </div>
    </div>
    <p id="back-top" style="display: block;"><a href="#top"><span>TOP</span></a></p>
    <script type="text/javascript">$(document).ready(function () { $("#back-top").hide(); $(function () { $(window).scroll(function () { if ($(this).scrollTop() > 100) { $('#back-top').fadeIn(); } else { $('#back-top').fadeOut(); } }); $('#back-top a').click(function () { $('body,html').animate({ scrollTop: 0 }, 800); return false; }); }); });</script>
    <script type="text/javascript">
        $(window).bind("load", function () {
            var h_1 = $(".footer-h1").height();
            var h_2 = $(".footer-h2").height();
            var h_3 = $(".footer-h3").height();
            var h_4 = $(".footer-h4").height();
            var max_1 = h_1;
            var max_2 = h_3;
            if (h_1 < h_2) max_1 = h_2;
            if (h_3 < h_4) max_2 = h_4;

            var w_document = $(window).width();
            // console.log(w_document)
            if (w_document > 479 && w_document < 992) {
                if (max_1 != 0) { $(".footer-h1").height(max_1); $(".footer-h2").height(max_1); }
                if (max_2 != 0) { $(".footer-h3").height(max_2); $(".footer-h4").height(max_2); }
            }
        });
    </script>
    <script>
        if ($('a.lightbox').length > 0) {
            $('a.lightbox').divbox();
        }
    </script>