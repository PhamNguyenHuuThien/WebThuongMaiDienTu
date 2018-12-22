import {Component} from "@angular/core";
import {NavController} from "ionic-angular";
import {LoginPage} from "../login/login";
import {HomePage} from "../home/home";


@Component({
  selector: 'sanpham',
  templateUrl: 'sanpham.html'
})
export class SanPham {

  constructor(public nav: NavController) {
  }

  // register and go to home page
  register() {
    this.nav.setRoot(HomePage);
  }

  // go to login page
  login() {
    this.nav.setRoot(LoginPage);
  }
}