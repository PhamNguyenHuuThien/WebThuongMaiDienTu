import {Component} from "@angular/core";
import {NavController, LoadingController, AlertController} from "ionic-angular";
import {LoginPage} from "../login/login";
import {HomePage} from "../home/home";
import {HttpClient, HttpHeaders, HttpParams } from "@angular/common/http";
import{XuLyDangKy} from "./XuLyDangKy";

@Component({
  selector: 'page-register',
  templateUrl: 'register.html'
})
export class RegisterPage {
public ho:string;
public ten:string;
public email:string;
public diachi:string;
public sodienthoai:string;
public tendangnhap:string;
public matkhau:string;


  constructor(public nav: NavController,private http: HttpClient,public XLDK: XuLyDangKy,public loadingCtrl: LoadingController,private alertCtrl: AlertController) {
  }

  // register and go to home page
  register(ho:string,ten:string,email:string,sodienthoai:string,diachi:string,tendangnhap:string,matkhau:string) {
    console.log("Hiển thị trang đăng ký");
    let loading = this.loadingCtrl.create({
      content: 'Đang đăng ký tài khoản...'
    });
  
    loading.present();
if(ho==""||ten==""||email==""||sodienthoai==""||diachi==""||tendangnhap==""||matkhau=="" ||  ho==null||ten==null||sodienthoai==null||diachi==null||tendangnhap==null||matkhau==null){
    loading.dismiss();
    let alert = this.alertCtrl.create({
      title: 'Chú ý',
      subTitle: 'Vui lòng nhập đầy đủ tất cả thông tin',
      buttons: ['Đồng ý']
    });
    alert.present();

}else{
    this.XLDK.register(ho,ten,email,sodienthoai,diachi,tendangnhap,matkhau)
    .subscribe((result)=>
    {
      if (result.message=="User was created.")
      {
        console.log("Đăng ký thành công");
        loading.dismiss();
        let alert = this.alertCtrl.create({
          title: 'Đăng ký thành công',
          subTitle: 'Bây giờ bạn có thể đăng nhập!',
          buttons: ['Đồng ý']
        });
        alert.present();
        this.nav.setRoot(LoginPage);

      }
      if(result.message=="Unable to create user.")
      {
        console.log("Không thể tạo tài khoản");
        loading.dismiss();
        let alert = this.alertCtrl.create({
          title: 'Đăng ký thất bại',
          subTitle: '1. Hãy kiểm tra và nhập đầy đủ thông tin\n2. Tên đăng nhập hoặc email đã tồn tại trên hệ thống!',
          buttons: ['Đồng ý']
        });
        alert.present();

      }
      //else{console.log(result.message)}
    },
    error => {
      loading.dismiss();
    let alert = this.alertCtrl.create({
    title: 'Thông báo',
    subTitle: 'Không thể kết nối đến máy chủ',
    buttons: ['Đồng ý']
  });
  alert.present();
  });
}
  


  }
  

  // go to login page
  login() {
    this.nav.setRoot(LoginPage);
  }
}
