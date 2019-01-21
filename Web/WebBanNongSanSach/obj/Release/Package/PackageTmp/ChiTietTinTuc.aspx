<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="WebBanNongSanSach.ChiTietTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <asp:DataList ID="dlChiTietTinTuc" runat="server">
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" cssclass="tieude" Text='<%# "<h3><b>"+Eval("TieuDe") +"</b></h3>" %>'></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text='<%# "Ngày đăng: "+Eval("NgayDang") %>'></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
        </ItemTemplate>
    </asp:DataList>
    <div class="fbcomment">
                        <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-like" data-href="<%=HttpContext.Current.Request.Url.AbsoluteUri %>" data-layout="standard" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
                        <div class="fb-comments" data-href="<%=HttpContext.Current.Request.Url.AbsoluteUri %>" data-numposts="5" width="100%"></div>

                    </div>
            
</asp:Content>
