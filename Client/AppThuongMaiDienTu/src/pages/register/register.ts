import {Component} from "@angular/core";
import {NavController} from "ionic-angular";
import {LoginPage} from "../login/login";
import {HomePage} from "../home/home";


@Component({
  selector: 'page-register',
  templateUrl: 'register.html'
})
export class RegisterPage {
public ho:string;
public ten:string;
public email:string;
public tendangnhap:string;
public matkhau:string;

  constructor(public nav: NavController) {
  }

  // register and go to home page
  register(ho:string,ten:string,email:string,tendangnhap:string,matkhau:string) {
    console.log("Hiển thị trang đăng ký");
    this.nav.setRoot(HomePage);
  }

  // go to login page
  login() {
    this.nav.setRoot(LoginPage);
  }
}
