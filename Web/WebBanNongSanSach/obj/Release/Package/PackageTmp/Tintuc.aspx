<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Tintuc.aspx.cs" Inherits="WebBanNongSanSach.Tintuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
    Tin Tức
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">Tin tức</h3>
    <div class="content-top">
        <div class="cont-tintuc dm_tintuc">

            <asp:DataList ID="ListTinTuc" runat="server">
                <ItemTemplate>

                    <div class="one-news">
                <div class="news-img">
                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/"+Eval("HinhMinhHoa") %>'/>

                </div>
                <div class="news-view">
                    

                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="tieude_tintuc" NavigateUrl='<%# "/TinTuc.aspx?MaTinTuc="+Eval("MaTinTuc") %>' Text='<%# "<b>"+Eval("TieuDe")+"</b>" %>'>tên bài viết</asp:HyperLink>
       <br />
                    <asp:Label ID="Label1" runat="server" CssClass="news-day" Text='<%# "Ngày đăng: "+Eval("NgayDang","{0:dd/MM/yyyy}") %>'>ngày đăng</asp:Label><br />
                    <asp:Label ID="Label2" runat="server" CssClass="dv-mota-tintuc" Text='<%# Eval("MoTaNgan") %>'>nôi dung</asp:Label>
                </div>
                <div class="clear"></div>
            </div>



                </ItemTemplate>
            </asp:DataList>

            




            
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>


</asp:Content>
