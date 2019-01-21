<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCSlider.ascx.cs" Inherits="WebBanNongSanSach.UCSlider" %>


  <div class="banner banner-child">
            <script src="../Scripts/JS/responsiveslides.min.js"></script>
            <script>
                $(function () {
                    $("#slider").responsiveSlides({
                        auto: true,
                        speed: 500,
                        namespace: "callbacks",
                        pager: true,
                    });
                });
            </script>
            <div id="top" class="callbacks_container">
                <ul class="rslides callbacks callbacks1" id="slider">
                    <li id="callbacks1_s0" class="" style="display: block; float: none; position: absolute; opacity: 0; z-index: 1; transition: opacity 500ms ease-in-out 0s;">
                    
                            <img src="./Images/<%=Hinh1 %>" alt="Thực phẩm an toàn"></a>
                        <div class="banner-matter">
                            <div class="price">
                                <h2><%=Mota1 %></h2>
                            </div>
                            <div class="banner-para">
                                <p>Rau củ quả tươi ngon đạt chuẩn VietGap và Global Gap, đảm bảo sức khỏe cho người dùng.</p>
                            </div>
                        </div>
                    </li>
                    <li id="callbacks1_s1" style="float: left; position: relative; opacity: 1; z-index: 2; display: list-item; transition: opacity 500ms ease-in-out 0s;" class="callbacks1_on">
                     
                            <img src="./Images/<%=Hinh2 %>" alt="Đa dạng lựa chọn">
                        <div class="banner-matter">
                            <div class="price">
                                <h2><%=Mota2 %></h2>
                            </div>
                            <div class="banner-para">
                                <p>Nguồn cung cấp hàng hóa đa dạng phù hợp với tất cả nhu cầu về thực phẩm của khách hàng</p>
                            </div>
                        </div>
                    </li>
                    <li id="callbacks1_s2" style="float: none; position: absolute; opacity: 0; z-index: 1; display: list-item; transition: opacity 500ms ease-in-out 0s;" class="">
                       
                            <img src="./Images/<%=Hinh3 %>" alt="Đặt hàng dễ, giao hàng nhanh">
                        <div class="banner-matter">
                            <div class="price">
                                <h2><%=Mota3 %></h2>
                            </div>
                            <div class="banner-para">
                                <p>Dịch vụ tiện ích, đặt hàng nhanh chóng tiện dụng, giao hàng tận nhà, tiết kiệm chi phí.</p>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="callbacks_tabs callbacks1_tabs">
                    <li class="callbacks1_s1"><a href="#" class="callbacks1_s1">1</a></li>
                    <li class="callbacks1_s2 callbacks_here"><a href="#" class="callbacks1_s2">2</a></li>
                    <li class="callbacks1_s3"><a href="#" class="callbacks1_s3">3</a></li>
                </ul>
            </div>
        </div>