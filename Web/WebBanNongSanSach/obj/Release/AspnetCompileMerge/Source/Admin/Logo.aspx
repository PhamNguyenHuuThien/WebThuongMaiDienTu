<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="Logo.aspx.cs" Inherits="WebBanNongSanSach.Admin.Logo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# "Logo hiện tại:" %>'></asp:Label>
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "/images/"+Eval("Logotrang") %>' />
            <br />
        <strong>FILE UPLOAD<br />
        </strong>
    <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
&nbsp;
        <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="27px" OnClick="btnUpload_Click" />
    &nbsp;<br />
        <br />
      
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Display="None" ErrorMessage="Bạn cần chọn một tệp ảnh trước khi ấn nút &quot;Upload&quot;"></asp:RequiredFieldValidator>
                    
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    <asp:Image ID="Image2" runat="server" Width="150px" />
    </div>
        
        </ItemTemplate>

    </asp:DataList>

    

</asp:Content>
