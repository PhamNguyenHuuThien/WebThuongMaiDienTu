<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="WebBanNongSanSach.Reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">Đăng ký</h3>
      <div class="servc-grids">
          <div class="dv-dangky-thanhvien" id="load-main">
    
    <div class="contact">
        <form class="form_col" id="reg_normal" action="http://webnongnghiep.web30s.vn" method="post" onsubmit="return Check_RegMember(); return false;" name="TheFormChangePass">
            <input name="module" type="hidden" value="user">
            <input name="action" type="hidden" value="dang_ky_thanh_vien_moi">
            <input name="source" type="hidden" value="">
            <input name="sourceid" type="hidden" value="">
                        <div class="tv-left">
                <div id="tieude_login">Thông tin cá nhân</div>
                <li>
                    <input name="hovaten" placeholder="Họ tên" onfocus="this.placeholder=''" onblur="this.placeholder='Họ tên'" value="" type="text" class="box_input" id="hovaten" >
                </li>
                <li>
                    <input name="sodienthoai" placeholder="Điện thoại" onfocus="this.placeholder=''" onblur="this.placeholder='Điện thoại'" value="" type="text" class="box_input" id="sodienthoai">
                </li>
                <li>
                    <input name="congty" placeholder="Thuộc công ty" onfocus="this.placeholder=''" onblur="this.placeholder='Thuộc công ty'" value="" type="text" class="box_input" id="congty">
                </li>
                <li>
                    <input name="diachi" placeholder="Địa chỉ" onfocus="this.placeholder=''" onblur="this.placeholder='Địa chỉ'" value="" type="text" class="box_input" id="diachi">
                </li>


            </div>
            <div class="tv-right">
                <div id="tieude_login">Thông tin tài khoản</div>
                <li>
                    <input name="tentruycap" placeholder="Tên truy cập" onfocus="this.placeholder=''" onblur="this.placeholder='Tên truy cập'" value="" type="text" class="box_input" id="reg_tentruycap">
                </li>
                <li>
                    <input name="email" placeholder="Email" value="" onfocus="this.placeholder=''" onblur="this.placeholder='Email'" type="text" class="box_input" id="reg_email">
                </li>
                <li>
                    <input name="matkhau" placeholder="Mật khẩu" onfocus="this.placeholder=''" onblur="this.placeholder='Mật khẩu'" value="" type="password" class="box_input" id="reg_matkhau">
                </li>
                <li>
                    <input name="mabaove" type="text" class="box_input" placeholder="Mã bảo vệ" onfocus="this.placeholder=''" onblur="this.placeholder='Mã bảo vệ'" style="text-transform: uppercase" id="reg_mabaove">
                    <div data-type="signup" class="autoCaptcha imgCaptcha"><img src="http://webnongnghiep.web30s.vn/imgcode.php?time=0.18285228004862697&type=signup"><a class="renewCaptcha"><i class="fa fa-refresh" aria-hidden="true"></i></a></div>
                </li>
            </div>
            <div class="clr"></div>
            <div align="center">
                
                
                <button type="submit" class="buttonSignup">Đăng ký</button>
                <button type="reset" class="buttonSignup">Làm lại</button>
            </div>
        </form>
    </div>
</div>
<div class="clr"></div>
<style>
    .buttonSignup{
        border-radius: 5px;
        padding: 14px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
        background-color: white;
        color: black;
        border: 2px solid #555555;
    }
    .buttonSignup:hover{
        background-color: #555555;
        color: white;
        box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
    }

@-webkit-keyframes marqueeAnimation-2148338  { 100%  {margin-top:-480px}}</style>        <div class="clearfix"> </div>
      </div>
</asp:Content>
