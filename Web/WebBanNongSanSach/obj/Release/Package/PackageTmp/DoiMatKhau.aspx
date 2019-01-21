<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="WebBanNongSanSach.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="boxstyle_center text_color">
        <div class="header_cp"><strong>Đổi mật khẩu</strong></div><form class="nomargin" id="changpass_normal" action="https://webnongnghiep.web30s.vn" method="post" name="TheFormChangePass" onsubmit="return Check_MemberChangePass('id_matkhau1','id_matkhau2'); return false;"><input name="module" type="hidden" value="user">
                                    <input name="action" type="hidden" value="doi_mat_khau_thanh_vien">
								    <table width="100%" border="0" cellspacing="0" cellpadding="2">
									<tbody><tr>
									  <td width="90"><strong>Mật khẩu cũ</strong></td>
									  <td>                            <asp:TextBox ID="txbMatkhau" CssClass="box_input" placeholder="Mật khẩu" runat="server" TextMode="Password"></asp:TextBox>
</td>
									</tr>
									<tr>  
									  <td width="90"><strong>Mật khẩu mới</strong></td>
									  <td>                            <asp:TextBox ID="txbMatkhauMoi" CssClass="box_input" placeholder="Mật khẩu mới" runat="server" TextMode="Password"></asp:TextBox>

                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txbMatkhau" ControlToValidate="txbMatkhauMoi" ErrorMessage="Mật khẩu mới phải khác mật khẩu cũ" Operator="NotEqual"></asp:CompareValidator>
</td>
									</tr>
                                        <tr>
                                            <td width="90"><strong>Nhập lại</strong></td>
                                            <td>
                                                 <asp:TextBox ID="txbNhaplaiMatkhau" CssClass="box_input" placeholder="Nhập lại mật khẩu mới" runat="server" TextMode="Password"></asp:TextBox>

                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txbMatkhauMoi" ControlToValidate="txbNhaplaiMatkhau" ErrorMessage="Mật khẩu nhập lại không giống"></asp:CompareValidator>

                                            </td>
                                        </tr>
									<tr> 
									  <td></td> 
									  <td>
                                          
									</tr>
								  </tbody></table>
            <asp:Button ID="btnDoiMK" cssclass="btn btn-danger" runat="server" Text="Đổi mật khẩu" OnClick="btnDoiMK_Click" />
                                                                  </form>
    </div>
</asp:Content>
