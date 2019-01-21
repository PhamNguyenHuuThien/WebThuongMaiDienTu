<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ChiTietSanPham.aspx.cs" Inherits="WebBanNongSanSach.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server"><%=TenSP %></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">
        <%=TenSP %> 
    </h3>
    <div class="content-top">

        <!--  -->
        <div class=" detai_sanpham">


            <a href="JavaScript:ajax_action(2381720,1);" class="butthree" style="margin-left: 10px; opacity: 01; display: inline; z-index: 9999;">
                <img src="/images/love_icon.png" align="absmiddle" width="15" height="15">Thích</a>
            <a href="JavaScript:ajax_action(2381720,2);" class="butthree" style="margin-left: 70px; opacity: 01; display: inline;">
                <img src="/images/needle_icon.png" align="absmiddle" width="15" height="15">
                Muốn</a>
            <div class="main_content_top main_content_top_cus1">
                <script type="text/javascript" src="/Scripts/JS/jquery.simple-gallery.min.js"></script>
                <script type="text/javascript" src="/Scripts/JS/jquery.simple-lens.min.js"></script>
                <link rel="stylesheet" type="text/css" href="/Scripts/CSS/jquery.simple-lens.css">
                <link rel="stylesheet" type="text/css" href="/Scripts/CSS/jquery.simple-gallery.css">
                <script>
                    $(document).ready(function () {
                        $('#demo-1 .simpleLens-thumbnails-container img').simpleGallery({
                            loading_image: '/images/loading.gif',
                            show_event: 'click'
                        });

                        $('#demo-1 .simpleLens-big-image').simpleLens({
                            loading_image: '/images/loading.gif'
                        });
                    });
                </script>
                <div class="simpleLens-gallery-container main_col_left main_col_left_cus1" id="demo-1">
                    <div class="simpleLens-container">
                        <div class="simpleLens-big-image-container">
                            <a class="simpleLens-lens-image" data-lens-image="/Images/<%=Hinh %>">
                                <img alt="s" class="simpleLens-big-image" src="/Images/<%=Hinh %>">
                            </a>
                        </div>
                    </div>

                    <div class="simpleLens-thumbnails-container body_thumb_content body_thumb_content_cus1">
                        <a href="" class="simpleLens-thumbnail-wrapper" data-lens-image="/Images/<%=Hinh %>">
                            <img class="border_images" src="/Images/<%=Hinh %>" width="50">
                        </a>
                    </div>

                </div>

                <div class="main_col_right main_col_right_cus1">
                    <div style="padding: 8px;" class="text_color">
                        <div class="comment_nho"><span id="love_2381720">0</span> yêu thích</div>
                        <div class="comment_nho"><span id="want_2381720">0</span> muốn mua</div>
                    </div>
                    <div class="clear"></div>
                    <h1 class="main_right_title"><%=TenSP %></h1>

                    <div class="clear"></div>
                    <div class="line_top_1 line_top_cus1"></div>
                    <div class="global_ghichu_1 global_ghichu_2">
                        <p><%=MoTaNgan %></p>
                    </div>
                    <div class="clear"></div>
                    <span class="glo-tgiagoc" style="display: none">Giá bán</span>

                    <asp:DataList ID="Gia" runat="server">
                        <ItemTemplate>
                                                  <asp:Label ID="lbtinhtrang" runat="server" CssClass=".dangcohang" Text='<%#tinhtrang%>'></asp:Label><br />
                           
                            <asp:Label runat="server" CssClass='glo-tgiakm' Text='<%# "<strike>"+Eval("GiaGoc","{0:0,0} <sup>đ</sup>") +"</strike>"%>'></asp:Label><br />
<asp:Label runat="server" CssClass='gia_thanhtien gia_thanhtien_cus1' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                            <br /><asp:Label ID="lblSoLuong" runat="server" Text='<%#soluong %>'> </asp:Label>
                             
                        </ItemTemplate>
                        
                    </asp:DataList>
              <asp:DropDownList ID="dlSoluong" runat="server"></asp:DropDownList>
                    <div class="product_details_cart">
                        
                        <!-- update by 1k 24-3-2017 v1-->
                        <div class="product-quantity">
                            <div class="numbers-row">
                               
                               
            
                                <!--update by 5k 26-7-2016-->
                                <div class="left icon_body icon_body_sosanh_cus1"><a href="JavaScript:ajax_action(2381720,2);"><i class="fa fa-retweet"></i></a></div>
                                <div class="left icon_body icon_body_love_cus1"><a href="JavaScript:ajax_action(2381720,1);"><i class="fa fa-heart-o"></i></a></div>
                                <!--end update by 5k 26-7-2016-->
                                <div class="left icon_body icon_body_love_cus1"><a href="#" class="lightbox"><i class="fa fa-search-plus"></i></a></div>
                            </div>
                        </div>
                        <div class="product-bottom">
                             
                            
                           
                            <button onclick="location.href='/LuuGioHang.aspx?MaSP=<%= MaSP%>&SoLuong='+$('#NoiDung_dlSoluong').val();" type="button" id="button-cart" UseSubmitBehavior="false" class="button btn-cart shopng-btn">Thêm vào giỏ</button>
                        </div>
                        <%=demsoluong%>
                        <!-- end update by 1k 24-3-2017 v1-->

                        <div class="right social_network_right">
                            <ul class="social_links">
                                


                                <li class="google_plus">
                                    <script src="https://apis.google.com/js/platform.js" async defer></script>
                                    <g:plusone size="tall"></g:plusone>
                                </li>
                                <li class="skype">
                                   <script>
// Place this code in the head section of your HTML file 
(function(r, d, s) {
	r.loadSkypeWebSdkAsync = r.loadSkypeWebSdkAsync || function(p) {
		var js, sjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(p.id)) { return; }
		js = d.createElement(s);
		js.id = p.id;
		js.src = p.scriptToLoad;
		js.onload = p.callback
		sjs.parentNode.insertBefore(js, sjs);
	};
	var p = {
		scriptToLoad: 'https://swx.cdn.skype.com/shared/v/latest/skypewebsdk.js',
		id: 'skype_web_sdk'
	};
	r.loadSkypeWebSdkAsync(p);
})(window, document, 'script');
</script>

<!-- Add class skype-share and data-style attribute with value (large, small, circle, square) to get the default button style -->
<!-- Additional attributes: data-lang='en-US' (for language) data-href='' (use '' for page URL, 'www.skype.com' for specific URL) -->
<!-- data-text = 'some message' (to pre-fill the message to that will be shared by the user, use '' to prompt user to enter a message) -->
<!-- Place the code of the share button where you what the share button to appear -->
<div class='skype-share' data-href='' data-lang='' data-text='' data-style='small' ></div>
                                </li>
                                <li class="zalo">
                                    <script src="https://sp.zalo.me/plugins/sdk.js"></script>
                                    <div class="zalo-share-button" data-href="<%=HttpContext.Current.Request.Url.AbsoluteUri %>" data-oaid="579745863508352884" data-layout="2" data-color="blue" data-customize=false></div>
                                </li>
                                <li class="twitter">
                                    <script>window.twttr = (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0],
    t = window.twttr || {};
  if (d.getElementById(id)) return t;
  js = d.createElement(s);
  js.id = id;
  js.src = "https://platform.twitter.com/widgets.js";
  fjs.parentNode.insertBefore(js, fjs);

  t._e = [];
  t.ready = function(f) {
    t._e.push(f);
  };

  return t;
}(document, "script", "twitter-wjs"));</script>
                                    <a class="twitter-share-button"
  href="https://twitter.com/intent/tweet?text=<%=HttpContext.Current.Request.Url.AbsoluteUri %>" target="_blank"
  data-size="Default">
Tweet</a>
                                </li>
                                <li class="facebook">
                                    <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

                                    <div class="fb-like" data-href="<%=HttpContext.Current.Request.Url.AbsoluteUri %>" data-layout="button" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
                                </li>


                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="main_content_body main_content_body_cus1">
                <div class="microformat">
                    <p><%=MoTa %></p>

                    <div class="clear"></div>

                    <div class="clear cao20"></div>
                    
                    

                </div>
               
                <div class="clear"></div>
                <div class="fbcomment">
                        <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
                        <div class="fb-comments" data-href="<%=HttpContext.Current.Request.Url.AbsoluteUri %>" data-numposts="5"></div>

                    </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div id="title_page">
            <h3 class="title">Sản phẩm liên quan</h3>
        </div>
        <div class="clearfix"></div>
        <div id="noidung_load">
            <div id="placeSlide_main">
                <div id="placeSlide_page">
                    <div class="row">
                        <ul>
                            <div class="">
                                <asp:DataList ID="ListSanPham" runat="server" RepeatColumns="3" Width="100%" ShowFooter="False" ShowHeader="False" RepeatLayout="Flow">
                                    <ItemTemplate>
                                        <div class='col-md-4 col-sm-6 col-xs-12 col-min-12 look dv-sanpham'>
                                            <div class='dv-sanpham-child'>
                            <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>'/>
                            
                            <br />
                            <h4><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                          
                                                <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                            <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>
    
                            <br />
                            <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>
                        </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
