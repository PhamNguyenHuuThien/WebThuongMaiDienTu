<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ckEditor.ascx.cs" Inherits="BTThucHanh.ckEditor" %>


<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
<script type="text/javascript">
    CKEDITOR.replace( '<%= TextBox1.ClientID %>');
</script>