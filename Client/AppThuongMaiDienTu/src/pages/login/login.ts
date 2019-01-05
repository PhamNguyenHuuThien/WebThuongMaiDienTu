import {Component} from "@angular/core";
import {NavController, AlertController, ToastController, MenuController} from "ionic-angular";
import {HomePage} from "../home/home";
import {RegisterPage} from "../register/register";
import {AuthService} from './auth.service';
import { Router } from '@angular/router';


@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  public username:string;
  public password:string;
  constructor( public authService: AuthService,public nav: NavController, public forgotCtrl: AlertController, public menu: MenuController, public toastCtrl: ToastController) {
 this.menu.swipeEnable(false);
  }

  // go to register page
  register() {
    this.nav.setRoot(RegisterPage);
  }

  // login and go to home page
  login(username:string,password:string) {
    
    console.log(username);
    console.log(password);
    console.log("Đăng nhập");

    if(username=="" || username==null )
    {
      let toast = this.toastCtrl.create({
        showCloseButton: true,
        message: 'Bạn chưa nhập tên đăng nhập!',
        duration: 3000,
        position: 'bottom'
      });
      toast.onDidDismiss(() => {
        console.log('Dismissed toast');
      });
      toast.present();
    }
    else
    if( password==""||password==null)
    {
      let toast = this.toastCtrl.create({
        showCloseButton: true,
        message: 'Bạn chưa nhập mật khẩu!',
        duration: 3000,
        position: 'bottom'
      });
      toast.onDidDismiss(() => {
        console.log('Dismissed toast');
      });
      toast.present();
    }
else{
  // let toast = this.toastCtrl.create({
  //   showCloseButton: true,
  //   message: 'Đăng nhập thành công!',
  //   duration: 3000,
  //   position: 'bottom'
  // });
  // toast.onDidDismiss(() => {
  //   console.log('Dismissed toast');
  // });
  // toast.present();
  // this.nav.setRoot(HomePage);




  // Gọi phương thức login của AuthService class mà chúng ta đã viết ở phía trên
   //var authService: AuthService;
  // var  router: Router;

   

  this.authService.login(username,password)
    .subscribe((result) => {
      let hoten= result.ho + " "+ result.ten;
      console.log('User Logged in as: ', hoten);
        if (result.message=="Successful login.") {
          let toast = this.toastCtrl.create({
            showCloseButton: true,
            message: 'Xin chào ' + hoten +' !',
            duration: 3000,
            position: 'bottom'
          });
          toast.onDidDismiss(() => {
            console.log('Dismissed toast');
          });
          toast.present();
          // Đăng nhập thành công thì lưu lại JWT vào storage, sau đó redirect tới trang dahshboard
          this.authService.setSession(result.jwt);
          //this.router.navigateByUrl('/dashboard');
          this.nav.setRoot(HomePage);
        }
         if(result.message=="Login failed.") {
          let toast = this.toastCtrl.create({
            showCloseButton: true,
            message: 'Đăng nhập thất bại. Hãy kiểm tra lại tên đăng nhập và mật khẩu!',
            duration: 3000,
            position: 'bottom'
          });
          toast.onDidDismiss(() => {
            console.log('Dismissed toast');
          });
          toast.present();
          
        }
      },
      error => {
      //   console.log( 'Lỗi kết nối tới máy chủ');
  }
  );
    
  
  
      
      
    //this.nav.setRoot(HomePage);
  
   }
  }

  forgotPass() {
    let forgot = this.forgotCtrl.create({
      title: 'Quên mật khẩu?',
      message: "hãy nhập vào Email của bạn để nhận link đặt lại mật khẩu.",
      inputs: [
        {
          name: 'email',
          placeholder: 'Địa chỉ Email của bạn',
          type: 'email'
        },
      ],
      buttons: [
        {
          text: 'Huỷ',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Gửi',
          handler: data => {
            console.log('Send clicked');
            let toast = this.toastCtrl.create({
              message: 'Đã gửi Email thành công',
              duration: 3000,
              position: 'top',
              cssClass: 'dark-trans',
              closeButtonText: 'OK',
              showCloseButton: true
            });
            toast.present();
          }
        }
      ]
    });
    forgot.present();
  }
wodb(){
  this.nav.setRoot(HomePage);
  }
}
