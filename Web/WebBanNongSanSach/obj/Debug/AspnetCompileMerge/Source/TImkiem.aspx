<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TImkiem.aspx.cs" Inherits="WebBanNongSanSach.TImkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">Kết quả tìm kiếm: <%=Request.QueryString["keysearch"] %></h3>
    <asp:Label ID="lbThongbao" runat="server" ></asp:Label>
    <asp:DataList ID="ListSanPham" runat="server" RepeatColumns="3" Width="100%" ShowFooter="False" ShowHeader="False" RepeatLayout="Flow">
    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
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
                </td>
    </ItemTemplate>
</asp:DataList>
</asp:Content>
