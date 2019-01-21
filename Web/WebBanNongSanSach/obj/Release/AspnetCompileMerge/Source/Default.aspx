<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebBanNongSanSach.Default" %>


<%@ Register Src="~/UCHeader.ascx" TagPrefix="uc1" TagName="UCHeader" %>
<%@ Register Src="~/UCFooter.ascx" TagPrefix="uc1" TagName="UCFooter" %>
<%@ Register Src="~/UCHead.ascx" TagPrefix="uc1" TagName="UCHead" %>
<%@ Register Src="~/UCSliderTrangChu.ascx" TagPrefix="uc1" TagName="UCSliderTrangChu" %>







<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:UCHead runat="server" ID="UCHead" />
    <title>- Thế giới rau sạch</title>

</head>
<body>
    <form runat="server">
        <uc1:UCHeader runat="server" ID="UCHeader" />

        <uc1:UCSliderTrangChu runat="server" ID="UCSliderTrangChu" />



        <div class="container">
            <div class="top-content">
                <h3 class="title wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;">SẢN PHẨM MỚI</h3>
                <div class="content-top">
                    <div class="row">
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow bounceInLeft  " data-wow-delay="3s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft;'>
                                <asp:DataList ID="dlSanPham1" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>

                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow fadeInUpBig  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUpBig;'>
                                <asp:DataList ID="dlSanPham2" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow fadeInDownBig  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDownBig;'>
                                <asp:DataList ID="dlSanPham3" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;'>
                                <asp:DataList ID="dlSanPham4" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow bounceInLeft  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft;'>
                                <asp:DataList ID="dlSanPham5" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow fadeInDownBig  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDownBig;'>
                                <asp:DataList ID="dlSanPham6" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child wow fadeInUpBig  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUpBig;'>
                                <asp:DataList ID="dlSanPham7" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                        <div class='col-md-3 col-sm-4 col-xs-6 col-min-12 look dv-sanpham'>
                            <div class='dv-sanpham-child  wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;'>
                                <asp:DataList ID="dlSanPham8" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass='img-responsive' ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' />

                                        <br />
                                        <h4>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("Tensp") %>'>Tên sản phẩm</asp:HyperLink></h4>
                                        <asp:Label ID="Label2" runat="server" CssClass='price-sp' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'></asp:Label>
                                        <strike><asp:Label ID="Label1" runat="server" CssClass='price-goc' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'></asp:Label></strike>

                                        <br />
                                        <asp:HyperLink ID="HyperLink5" runat="server" CssClass='<%# "btn btn-show btn-1c" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# "Xem Ngay" %>'></asp:HyperLink>

                                    </ItemTemplate>

                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="content-bottom-top" style="background: url('../Images/14867216836587_linh-anh-sx-ngat-ngay-voi-khu-vuon-40m-ngap-tran-rau-qua-tuoi-xanh-cua-ba-me-pho-nui_af8126f41c1.jpg') no-repeat 0px 0px fixed;">
            <div class="wmuSlider example1">
                <div class="wmuSliderWrapper">
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="content-bottom">
                            <div class="container">
                                <span class="corn">
                                    <img src="../Images/14867210197317_14750369071798_1384489545_8.jpg" alt="Nhóm trái cây"></span>
                                <h3>Nhóm trái cây</h3>
                                <p>Là một trong những ngành kinh tế chủ lực, nông nghiệp Việt Nam đang có bước chuyển mình phát triển mạnh mẽ. Các hộ gia đình đã mạnh dạn đầu tư vào sản xuất nông nghiệp nay càng có thêm...</p>
                            </div>
                        </div>
                    </article>
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="content-bottom">
                            <div class="container">
                                <span class="corn">
                                    <img src="../Images/14867211797956_14750370207534_bo-do-choi-rau-cu-qua-trang-tiki-500x500.jpg" alt="Nhóm củ, quả"></span>
                                <h3>Nhóm củ, quả</h3>
                                <p>Các giống đu đủ của Việt Nam hay của Thái Lan, Đài Loan, Trung Quốc, ấn Độ... đều để giống được, với điều kiện không phải là giống lai F1...</p>
                            </div>
                        </div>
                    </article>
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="content-bottom">
                            <div class="container">
                                <span class="corn">
                                    <img src="../Images/14867212395063_14750371694137_gap2009-500x500.jpg" alt="Nhóm cải bắp, rau lá"></span>
                                <h3>Nhóm cải bắp, rau lá</h3>
                                <p>Có rất nhiều cây xoài mọc từ hạt mà không hề thoái hoá mà chất lượng trái xoài vẫn được đảm bảo. Nhiều giống xoài của ta trong hạt có nhiều phôi...</p>
                            </div>
                        </div>
                    </article>
                </div>
                <script src="Scripts/JS/jquery.wmuSlider.js"></script>
                <script>
                    $('.example1').wmuSlider();
                </script>
            </div>
        </div>

        <div class="content-bottom-tt">
            <div class="container">
                <h4 class="wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;">Tin tức</h4>
                <div class="row">
                    <div class='col-md-6 col-sm-6 content-bottom-tintuc'>
                        <div class='dv-tintuc wow bounceInLeft  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft;'>
                            <div class='dv-tinleft'>
                                <a href='suc-hut-dau-tu-may-nong-nghiep-rat-lon.aspx'>
                                    <img class='img-responsive' src='../Images/14867224514903_14750453388438_tr7ta.jpg' alt='Sức hút đầu tư máy nông nghiệp rất lớn'></a>
                            </div>
                            <div class='dv-tinright'>
                                <div class='dv-homett'>
                                    <div class='tit'><a href='suc-hut-dau-tu-may-nong-nghiep-rat-lon.aspx'>Sức hút đầu tư máy nông nghiệp rất lớn</a></div>
                                    <p>Cho đến th&aacute;ng cuối năm 2011, ở ĐBSCL hoạt động đầu tư cơ giới h&oacute;a n&ocirc;ng nghiệp, thiết bị m&aacute;y m&oacute;c...</p>
                                </div>
                                <a href='suc-hut-dau-tu-may-nong-nghiep-rat-lon.aspx' class='hvr-icon-wobble-horizontal'>Xem ngay</a>
                            </div>
                            <div class='clear'></div>
                        </div>
                    </div>
                    <div class='col-md-6 col-sm-6 content-bottom-tintuc'>
                        <div class='dv-tintuc wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;'>
                            <div class='dv-tinleft'>
                                <a href='-tao-viec-lam-tu-dich-vu-nong-nghiep.aspx'>
                                    <img class='img-responsive' src='../Images/14867224048557_14750454231894_artworks-000139171563-t9ajyn-t500x500.jpg' alt=' Tạo việc làm từ dịch vụ nông nghiệp'></a>
                            </div>
                            <div class='dv-tinright'>
                                <div class='dv-homett'>
                                    <div class='tit'><a href='-tao-viec-lam-tu-dich-vu-nong-nghiep.aspx'>Tạo việc làm từ dịch vụ nông nghiệp</a></div>
                                    <p>Đ&acirc;y l&agrave; h&igrave;nh thức tạo việc l&agrave;m do n&ocirc;ng d&acirc;n tự li&ecirc;n kết lại; vừa tạo việc l&agrave;m cho LĐ n&ocirc;ng th&ocirc;n, vừa...</p>
                                </div>
                                <a href='-tao-viec-lam-tu-dich-vu-nong-nghiep.aspx' class='hvr-icon-wobble-horizontal'>Xem ngay</a>
                            </div>
                            <div class='clear'></div>
                        </div>
                    </div>
                    <div class='col-md-6 col-sm-6 content-bottom-tintuc'>
                        <div class='dv-tintuc wow bounceInLeft  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft;'>
                            <div class='dv-tinleft'>
                                <a href='-lao-dong-nong-nghiep-so-luong-lon-chat-luong-thap.aspx'>
                                    <img class='img-responsive' src='../Images/14867223339809_14750452342439_raised-beds.jpg' alt=' Lao động nông nghiệp: Số lượng lớn, chất lượng thấp'></a>
                            </div>
                            <div class='dv-tinright'>
                                <div class='dv-homett'>
                                    <div class='tit'><a href='-lao-dong-nong-nghiep-so-luong-lon-chat-luong-thap.aspx'>Lao động nông nghiệp: Số lượng lớn, chất lượng thấp</a></div>
                                    <p>Trong 10 năm qua, đ&atilde; c&oacute; 15 triệu lao động c&oacute; việc l&agrave;m, trong đ&oacute;, khoảng 50% l&agrave;m trong lĩnh vực n&ocirc;ng nghiệp...</p>
                                </div>
                                <a href='-lao-dong-nong-nghiep-so-luong-lon-chat-luong-thap.aspx' class='hvr-icon-wobble-horizontal'>Xem ngay</a>
                            </div>
                            <div class='clear'></div>
                        </div>
                    </div>
                    <div class='col-md-6 col-sm-6 content-bottom-tintuc'>
                        <div class='dv-tintuc wow bounceInRight  " data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;'>
                            <div class='dv-tinleft'>
                                <a href='-phat-trien-dich-vu-nong-nghiep-niem-vui-cho-nha-nong.aspx'>
                                    <img class='img-responsive' src='../Images/14867222706790_14779082017502_tt6.png' alt=' Phát triển dịch vụ nông nghiệp: Niềm vui cho nhà nông'></a>
                            </div>
                            <div class='dv-tinright'>
                                <div class='dv-homett'>
                                    <div class='tit'><a href='-phat-trien-dich-vu-nong-nghiep-niem-vui-cho-nha-nong.aspx'>Phát triển dịch vụ nông nghiệp: Niềm vui cho nhà nông</a></div>
                                    <p>Ra ng&otilde; gặp dịch vụ, đ&oacute; l&agrave; mơ ước của bất cứ người n&ocirc;ng d&acirc;n n&agrave;o v&agrave; trong những năm qua, việc ph&aacute;t...</p>
                                </div>
                                <a href='-phat-trien-dich-vu-nong-nghiep-niem-vui-cho-nha-nong.aspx' class='hvr-icon-wobble-horizontal'>Xem ngay</a>
                            </div>
                            <div class='clear'></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <uc1:UCFooter runat="server" ID="UCFooter" />
    </form>
</body>
</html>
