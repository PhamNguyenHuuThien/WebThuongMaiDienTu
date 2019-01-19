import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';

/**
 * Generated class for the ChitietsanphamPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */


@Component({
  selector: 'page-chitietsanpham',
  templateUrl: 'chitietsanpham.html',
})
export class ChiTietSanPham {
  public ttsp: ArrayBuffer;
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    console.log(this.navParams.data);
    this.getData();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ChiTietSanPham');
  }
  getData(){
    this.ttsp = this.navParams.data;
  }
}
