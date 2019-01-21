<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThongTinTaiKhoan.aspx.cs" Inherits="WebBanNongSanSach.ThongTinTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
    Trang cá nhân
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server"> <h3 class="title">Trang cá nhân</h3>
      <div class="servc-grids">
          <div class="dv-dangky-thanhvien" id="load-main">
    
    <div class="contact">
        
        <form method="post">
                     <div class="tv-left">
                <div id="tieude_login" ><center>Thông tin cá nhân</center></div>
                <li>
                    <p id="tieude_login">Họ và tên:</p>
     
                    <input  name="hovaten"  runat="server" placeholder="Họ tên" onfocus="this.placeholder=''" onblur="this.placeholder='Họ tên'" value="" type="text" class="box_input" id="hovaten">
                </li>
                <li>
                    <p id="tieude_login">Số điện thoại:</p>
                    <input name="sodienthoai" runat="server" placeholder="Điện thoại" onfocus="this.placeholder=''" onblur="this.placeholder='Điện thoại'" value="" type="text" class="box_input" id="sodienthoai">
                </li>
                <li>
                    <p id="tieude_login">Nơi công tác:</p>
                    <input name="congty" runat="server" placeholder="Thuộc công ty" onfocus="this.placeholder=''" onblur="this.placeholder='Thuộc công ty'" value="" type="text" class="box_input" id="congty">
                </li>
                <li>
                    <p id="tieude_login">Địa chỉ:</p>
                    <input name="diachi" runat="server" placeholder="Địa chỉ" onfocus="this.placeholder=''" onblur="this.placeholder='Địa chỉ'" value="" type="text" class="box_input" id="diachi">
                </li>


            </div>
            <div class="tv-right">
                <div id="tieude_login"><center>Thông tin tài khoản</center></div>
                <li>
                    <p id="tieude_login">Tên đăng nhập:</p>
                    <input disabled name="tentruycap" runat="server" placeholder="Tên truy cập" onfocus="this.placeholder=''" onblur="this.placeholder='Tên truy cập'" value="" type="text" class="box_input" id="reg_tentruycap">
                </li>
                <li>
                    <p id="tieude_login">Địa chỉ Email:</p>
                    <input name="email" runat="server" placeholder="Email" value="" onfocus="this.placeholder=''" onblur="this.placeholder='Email'" type="text" class="box_input" id="reg_email">
                </li>
                <li>
                    <p id="tieude_login">Mật khẩu:</p>
                    <input name="matkhau" runat="server" placeholder="Mật khẩu" onfocus="this.placeholder=''" onblur="this.placeholder='Mật khẩu'" value="" type="password" class="box_input" id="reg_matkhau">
                </li>
                </div>
            <div class="clr"></div>
            <div align="center">
                
                <asp:button ID="btnLuu" CssClass="buttonSignup" runat="server" text="Cập nhật thông tin" OnClick="btnLuu_Click" UseSubmitBehavior="false"></asp:Button>
                <button type="submit" class="buttonSignup">Cập nhật thông tin</button>
                <button type="reset" class="buttonSignup">Đổi mật khẩu</button>
            </div>
      
</form>
    </div>
              </div>
          </div>
</asp:Content>
