<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuTest.aspx.cs" Inherits="WebBanNongSanSach.MenuTest" %>

<%@ Register Src="~/UCHead.ascx" TagPrefix="uc1" TagName="UCHead" %>
<%@ Register Src="~/UCMenuNgang.ascx" TagPrefix="uc1" TagName="UCMenuNgang" %>
<%@ Register Src="~/UCMenuDoc.ascx" TagPrefix="uc1" TagName="UCMenuDoc" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:UCHead runat="server" ID="UCHead" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <uc1:UCMenuNgang runat="server" id="UCMenuNgang" />

            <uc1:UCMenuDoc runat="server" ID="UCMenuDoc" />

                    



                  
                    
       
        </div>

    </form>
</body>
</html>
