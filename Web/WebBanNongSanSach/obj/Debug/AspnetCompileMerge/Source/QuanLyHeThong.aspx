<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="QuanLyHeThong.aspx.cs" Inherits="WebBanNongSanSach.QuanLyHeThong" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Đăng nhập :: Hệ thống quản trị</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/Scripts/CSS/bootstrap.min.css">
    <link rel="stylesheet" href="/Scripts/CSS/font-awesome.min.css">
    <link rel="stylesheet" href="/Scripts/CSS/ionicons.min.css">
    <link rel="stylesheet" href="/Scripts/CSS/admin.min.css">
    <link rel="stylesheet" href="/Scripts/CSS/blue.css">
    <link rel="stylesheet" href="/Scripts/CSS/_all.css">
</head>
<body class="hold-transition login-page">
<div class="login-box" style="position: relative;">
    <div style="position: absolute; top: 55px; left:-234px; width: 239px; height: 125px; background-color: white; border-radius: 5px; padding: 10px; border: 5px solid #ccc; border-right:0">
        <a href="" target="_blank"><img src="/images/14867154122765_logo.png" width="100%" height="100%" style="margin-top: 10px"></a>
    </div>
    <div class="dv-right-login">
        <p class="tit">Hỗ trợ  24/7: <a href="tel:1900 000">1900 0000</a></p>
        <p>KD Hồ Chí Minh: <a href="tel:0123456789">0123456789</a></p>
        <p>KD Hà Nội: <a href="tel:0969696969">0969696969</a></p>
        <p>Email: <a href="mailto:bibi9768@gmail.com">bibi9768@gmail.com</a></p>
    </div>
    <div class="login-box-body" style=" border-radius: 10px; border: 5px solid #ccc">
        <p class="login-box-msg" style="font-size: 20px; font-weight:bold;text-transform: uppercase;">Hệ thống quản trị WEBSITE</p>

        <form runat="server">
            
            <div class="form-group has-feedback">
                <asp:TextBox ID="admintentruycap" runat="server" CssClass="form-control"></asp:TextBox>
                
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <asp:TextBox ID="adminmatkhau" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                                <asp:Label ID="lbthongbao" runat="server" ></asp:Label>
            </div>
            <div class="row">
                <div class="col-xs-7" style="padding-right: 0;">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> Ghi nhớ mật khẩu                        </label>
                    </div>
                </div>
                <div class="col-xs-5">
                    <asp:Button ID="btnLogin" runat="server"  Text="Đăng nhập" style='text-transform: uppercase;' CssClass="btn btn-primary btn-block btn-flat" OnClick="btnLogin_Click"/>
                    
                </div>
            </div>
        </form>
        <a href="#">Quên mật khẩu</a>
    </div>
    <p style="text-align: center; font-weight: bold; padding-top: 10px; color: #999"><a href="" target="_blank">Thiết kế website bởi PNHT </a></p>
</div>
<script src="/Scripts/JS/jquery.min.js"></script>
<script src="/Scripts/JS/bootstrap.min.js"></script>
<script src="/Scripts/JS/icheck.min.js"></script>
<script type="text/javascript" src="/Scripts/JS/md5.js"></script>
<script type="text/javascript" src="/Scripts/JS/me.js" charset="utf-8"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_minimal-blue',
            increaseArea: '20%' // optional
        });
        $('#admintentruycap').focus();
        var height_wd = $(document).height();
        if(height_wd < 350) {$(".login-box").css("top", "0px");$(".login-box").css("margin-top", "10px")}
    });
</script>
</body>
</html>