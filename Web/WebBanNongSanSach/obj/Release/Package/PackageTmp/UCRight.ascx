<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCRight.ascx.cs" Inherits="WebBanNongSanSach.UCRight" %>


<div class="dv-child-right">
    <div class="product">
        <div class="dv_content_leftsp">
            <h3>DANH MỤC SẢN PHẨM</h3>
            <ul class="dv_list_dmsp">
                <li><a href="/DanhSachSanpham.aspx?MaLoai=RS">Rau sạch</a><span class="SHOW_menu_left" data="Rau-sach-355765"></span></li>
                <li><a href="/DanhSachSanpham.aspx?MaLoai=RSHC">Rau hữu cơ</a><span class="SHOW_menu_left" data="Rau-huu-co-355779"></span></li>
                <li><a href="/DanhSachSanpham.aspx?MaLoai=RSDL">Rau sạch Đà Lạt</a><span class="SHOW_menu_left" data="Rau-sach-Da-Lat-355781"></span></li>
                <li><a href="/DanhSachSanpham.aspx?MaLoai=NSV">Nấm sạch Việt</a><span class="SHOW_menu_left" data="Nam-sach-Viet-355782"></span></li>
                <li><a href="/DanhSachSanpham.aspx?MaLoai=RAT">Rau an toàn</a><span class="SHOW_menu_left" data="Rau-an-toan-355778"></span></li>
                <li><a href="/DanhSachSanpham.aspx?MaLoai=RS">Hoa quả sạch</a><span class="SHOW_menu_left" data="Hoa-qua-sach-355768">+</span><ul class="dv_list_dmsp_2 ul-data-Hoa-qua-sach-355768" style="overflow: hidden; display: none;">
                    <li><a href="/DanhSachSanpham.aspx?MaLoai=HQNK">Hoa quả nhập khẩu</a></li>
                    <li><a href="/DanhSachSanpham.aspx?MaLoai=HQVN">Hoa quả Việt Nam</a></li>
                    <li><a href="/DanhSachSanpham.aspx?MaLoai=HQSKDL">Hoa quả sấy khô Đà Lạt</a></li>
                </ul>
                </li>
            </ul>
            <script type="text/javascript">
                $(".SHOW_menu_left").click(function () {
                    var data = $(this).attr('data');
                    var data_text = $(this).html();
                    if (data_text == "+") {

                        $(".SHOW_menu_left").each(function (index) {
                            if ($(this).html() == "-") {
                                $(this).html('+');
                            }
                        });

                        $(this).html("-");
                        $(".dv_list_dmsp_2").hide('500');
                        $(".ul-data-" + data).show('500');
                    }
                    else if (data_text == "-") {
                        $(this).html("+");
                        $(".ul-data-" + data).hide('500');
                    }
                });
            </script>
        </div>


    </div>
    <div class="dv_content_leftsp">
        <h3>SẢN PHẨM BÁN CHẠY</h3>
        <div class="marqueew" style="height: 400px;">
             <div class="js-marquee-wrapper" style="margin-top: 0px; animation: marqueeAnimation-21483380 20.9s linear 0s infinite normal none running;">
                <div class="js-marquee" style="margin-right: 0px; float: none; margin-bottom: 0px;">
                    <asp:DataList ID="ListBanChay" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                        <ItemTemplate> 
                            
                            <div class="dv-spleft">
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>' CssClass='<%# "img-responsive" %>'/>
                            
                            <h4><asp:HyperLink ID="HyperLink2" runat="server" CssClass='<%# "img-responsive" %>' NavigateUrl='<%# "~/ChiTietSanpham.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("TenSP") %>'></asp:HyperLink></h4>
                            <asp:HyperLink ID="HyperLink3" runat="server" CssClass='<%# "item_price" %>' Text='<%# Eval("GiaBan","{0:0,0} <sup>đ</sup>") +"/"+ Eval("DonViTinh") %>'>Giá bán</asp:HyperLink>
                            <strike><asp:HyperLink ID="HyperLink4" runat="server" CssClass='<%# "item_goc" %>' Text='<%# Eval("GiaGoc","{0:0,0} <sup>đ</sup>") %>'>Giá gốc</asp:HyperLink></strike>
                    <div class="clearfix"></div>
                           
                               </div>
                    </ItemTemplate>
                    </asp:DataList>

                </div>
 </div>
                                
            </div>

        <script type="text/javascript" src="../Scripts/JS/jquery.marquee.min.js"></script>
        <script>$('.marqueew').marquee({
                duration: 9000,
                gap: 0,
                delayBeforeStart: 0,
                direction: 'up',
                duplicated: false,
                pauseOnHover: true,
                startVisible: true
            });
        </script>
    </div>
    <div class="dv_content_leftsp">
        <h3>TIN TỨC HOT</h3>
        <div id="newsRight">

            <asp:DataList ID="ListTinTuc" runat="server" RepeatLayout="Flow" >
            <ItemTemplate> 
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>'/>
           
                <h4><asp:HyperLink ID="HyperLink6" runat="server"  NavigateUrl='<%# "~/TinTuc.aspx?MaTinTuc="+Eval("MaTinTuc") %>' Text='<%# Eval("TieuDe") %>'>tiêu đề</asp:HyperLink></h4>
                <div class="clear"></div>
            </ItemTemplate>
            </asp:DataList>

        </div>
    </div>
    <div class="dv_content_leftsp">
        <h3>Tags</h3>
        <ul class="tags_links" style="inl">

            <asp:DataList ID="ListTags" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                <ItemTemplate>

                <li>
                    <asp:HyperLink ID="HyperLink1" CssClass="tags_links " runat="server" Text='<%# Eval("TenTag") %>' NavigateUrl='<%# "/Timkiem.aspx?keysearch="+Eval("tentag") %>'>HyperLink</asp:HyperLink>
                </li>
                </ItemTemplate>
            </asp:DataList>
            </ul>

            
             
      </div>
    </div>
 
<div class="clear"></div>    <div class="clear"></div>
