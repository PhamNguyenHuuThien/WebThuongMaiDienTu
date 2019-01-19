import { Component, ViewChild } from "@angular/core";
import { Platform, Nav } from "ionic-angular";

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { Keyboard } from '@ionic-native/keyboard';

import { HomePage } from "../pages/home/home";
import { LoginPage } from "../pages/login/login";
import { LocalWeatherPage } from "../pages/local-weather/local-weather";
import {SanPham } from "../pages/sanpham/sanpham";



export interface MenuItem {
    title: string;
    component: any;
    icon: string;
}

@Component({
  templateUrl: 'app.html'
})

export class MyApp {

public hoten:string;
  @ViewChild(Nav) nav: Nav;

  rootPage: any = LoginPage;

  appMenuItems: Array<MenuItem>;

  constructor(
    public platform: Platform,
    public statusBar: StatusBar,
    public splashScreen: SplashScreen,
    public keyboard: Keyboard
  ) {
    this.initializeApp();

    this.appMenuItems = [
      {title: 'Trang chủ', component: HomePage, icon: 'home'},
      {title: 'Sản phẩm', component: SanPham, icon: 'flower'},
      {title: 'Thời tiết', component: LocalWeatherPage, icon: 'partly-sunny'}

    ];
    this.hoten=sessionStorage.getItem('hoten');
  }

  initializeApp() {
    this.hoten=sessionStorage.getItem('hoten');
    this.platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.

      //*** Control Splash Screen
      // this.splashScreen.show();
      // this.splashScreen.hide();

      //*** Control Status Bar
      this.statusBar.styleDefault();
      this.statusBar.overlaysWebView(false);

      //*** Control Keyboard
      // this.keyboard.disableScroll(true);
    });
  }

  openPage(page) {
    
    
    // Reset the content nav to have just this page
    // we wouldn't want the back button to show in this scenario
    this.nav.setRoot(page.component);
    
  }

  logout() {
    
    sessionStorage.removeItem('hoten');
    //console.log(sessionStorage.getItem('hoten'));
    this.nav.setRoot(LoginPage);
    
  }

}
