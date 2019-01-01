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
  public username;
  public password;
  constructor(public nav: NavController, public forgotCtrl: AlertController, public menu: MenuController, public toastCtrl: ToastController) {
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
  let toast = this.toastCtrl.create({
    showCloseButton: true,
    message: 'Đăng nhập thành công!',
    duration: 3000,
    position: 'bottom'
  });
  toast.onDidDismiss(() => {
    console.log('Dismissed toast');
  });
  toast.present();
  this.nav.setRoot(HomePage);




  // Gọi phương thức login của AuthService class mà chúng ta đã viết ở phía trên
   var authService: AuthService;
   var  router: Router;
  authService.login(username,password).subscribe(
      response => {
        console.log(response);
        if (response.sucess) {

          // Đăng nhập thành công thì lưu lại JWT vào storage, sau đó redirect tới trang dahshboard
          authService.setSession(response);
          //this.router.navigateByUrl('/dashboard');
          this.nav.setRoot(HomePage);
        } else {
          console.log( response.message);
        }
      },
      error => {
        console.log( 'Lỗi kết nối tới máy chủ');
      }
    );
    
  
  
      
      
    this.nav.setRoot(HomePage);
  
   }
  }

  forgotPass() {
    let forgot = this.forgotCtrl.create({
      title: 'Forgot Password?',
      message: "Enter you email address to send a reset link password.",
      inputs: [
        {
          name: 'email',
          placeholder: 'Email',
          type: 'email'
        },
      ],
      buttons: [
        {
          text: 'Cancel',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Send',
          handler: data => {
            console.log('Send clicked');
            let toast = this.toastCtrl.create({
              message: 'Email was sended successfully',
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

}
