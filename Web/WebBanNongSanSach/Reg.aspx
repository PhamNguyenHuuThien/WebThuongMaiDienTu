<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="WebBanNongSanSach.Reg" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server">Đăng ký</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoiDung" runat="server">
    <h3 class="title">Đăng ký</h3>
	<div class="servc-grids">
		<div class="dv-dangky-thanhvien" id="load-main">
			
			
				<div class="contact">
					<div class="tv-left">
						<div id="tieude_login">Thông tin cá nhân</div>
						<li>
							<asp:TextBox ID="txbHo" cssclass="box_input" runat="server" placeholder="Họ"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbHo" ErrorMessage="Vui lòng nhập vào Họ" SetFocusOnError="True"></asp:RequiredFieldValidator>
						</li>
						<li>
							<asp:TextBox ID="txbTen" cssclass="box_input" placeholder="Tên" runat="server"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbTen" ErrorMessage="Vui lòng nhập vào Tên"></asp:RequiredFieldValidator>
						</li>
						<li>
							<asp:TextBox ID="txbSodienthoai" cssclass="box_input" placeholder="Điện thoại" min="0" MaxLength="10" max="9999999999" runat="server"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbSodienthoai" ErrorMessage="Vui lòng nhập vào SĐT"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbSodienthoai" ErrorMessage="Vui lòng nhập đúng số điện thoại" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
						</li>
						<li>
							<asp:TextBox ID="txbCongty" cssclass="box_input" placeholder="Thuộc công ty" runat="server"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbCongty" ErrorMessage="Hãy nhập vào tên công ty"></asp:RequiredFieldValidator>
						</li>
						<li>
							<asp:TextBox ID="txbDiaChi" cssclass="box_input" placeholder="Địa chỉ" runat="server"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txbDiaChi" ErrorMessage="Hãy nhập địa chỉ vào"></asp:RequiredFieldValidator>
						</li>
					</div>
					<div class="tv-right">
						<div id="tieude_login">Thông tin tài khoản</div>
						<li>
							<asp:TextBox ID="txbTenTruycap" placeholder="Tên truy cập" cssclass="box_input" runat="server"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbTenTruycap" ErrorMessage="Hãy nhập vào tên truy cập"></asp:RequiredFieldValidator>
						</li>
						<li>
							<asp:TextBox ID="txbEmail" placeholder="Email" cssclass="box_input" runat="server"></asp:TextBox>
						    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
						</li>
						<li>
							<asp:TextBox ID="txbMatKhau" cssclass="box_input" placeholder="Mật khẩu" runat="server" TextMode="Password"></asp:TextBox>

						    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbMatKhau" ErrorMessage="Vui lòng nhập vào mật khẩu"></asp:RequiredFieldValidator>
						</li>
						<li>
							<asp:TextBox ID="txbNhaplaimatkhau" cssclass="box_input" placeholder="Nhập lại mật khẩu" runat="server" TextMode="Password"></asp:TextBox>
						    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txbMatKhau" ControlToValidate="txbNhaplaimatkhau" ErrorMessage="Mật khẩu nhập lại không giống"></asp:CompareValidator>
						</li>
					</div>
					<div class="clr"></div>
					<div align="center">
						<asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        <br />
						<asp:Button ID="btnDangky" cssclass="buttonSignup" runat="server" Text="Đăng ký" OnClick="btnDangky_Click" />
						<asp:Button ID="btnLamlai" cssclass="buttonSignup" runat="server" Text="Làm lại" OnClick="btnLamlai_Click" />
					</div>
				</div>
		
		</div>
		<div class="clr"></div>
		<style>
            .buttonSignup {
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
                
            .buttonSignup:hover {
                background-color: #555555;
                color: white;
                box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
            }
                
            @-webkit-keyframes marqueeAnimation-2148338 {
                100% {
                    margin-top: -480px
                }
            }
        </style>
		<div class="clearfix"></div>
	</div>
</asp:Content>
