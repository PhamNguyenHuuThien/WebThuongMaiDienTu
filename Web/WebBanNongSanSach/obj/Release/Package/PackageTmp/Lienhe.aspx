<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Lienhe.aspx.cs" Inherits="WebBanNongSanSach.Lienhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">Liên hệ</h3>
    <div class="content-top">
        <div class="">
            <!--  -->
            <div id="showText">
                <div class="showText">
                    <h3>THẾ GIỚI RAU SẠCH</h3>
                    <p>Hãy liên hệ với chúng tôi để nhận được những tư vấn.</p>
                    
                </div>
                <div class="contact">
                    
                        <input type="hidden" name="module" value="form">
                        <input type="hidden" name="action" value="goilienhe">
                        <div >
                            <ul>
                            <li class="name">
                                Họ và tên: <asp:TextBox ID="txbHoTen" CssClass="form-control" placeholder="Họ tên"  runat="server" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li class="phone">
                      </li>
                            <li class="mail">Email:
<asp:TextBox ID="txbEmail" placeholder="Email" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>                            </li>
                            <li class="local">Địa chỉ: 
                                <asp:TextBox ID="txbDiaChi" CssClass="form-control" placeholder="Địa chỉ" runat="server" ReadOnly="True"></asp:TextBox>
                            </li></ul>
                        </div>
                        
                            <ul>
                            <li class="mess"> Nội dung:
                                <asp:TextBox ID="txbNoiDung" CssClass="form-control" placeholder="Nội dung"  runat="server" TextMode="MultiLine"></asp:TextBox>
                            </li>
                            <li class="code">
                               
                          
                                <div class="clear"></div>
                            </li></ul>
                            <div class="haibuttom">
                                <asp:Button ID="btnGui" style="cursor: pointer" class="button submitbutton" runat="server" Text="Gửi" OnClick="btnGui_Click" />
                                <asp:Button ID="btnLamLai" style="cursor: pointer" class="button submitbutton" runat="server" Text="Làm lại" OnClick="btnLamLai_Click" />
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="clr"></div>
           
                </div>

                <div class="multiple_map">
                  </div>  
            </div>
            <!--  -->
        </div>

    <div class="clearfix"></div>

</asp:Content>
