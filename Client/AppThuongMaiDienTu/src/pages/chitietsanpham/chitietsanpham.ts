import { Component } from '@angular/core';
import { NavController, NavParams,AlertController } from 'ionic-angular';

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
  constructor(private alertCtrl: AlertController,public navCtrl: NavController, public navParams: NavParams) {
    console.log(this.navParams.data);
    this.getData();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ChiTietSanPham');
  }
  getData(){
    this.ttsp = this.navParams.data;
  }

  DatHang(){
    let alert = this.alertCtrl.create({
      title: 'Thông báo',
      subTitle: 'Đặt hàng thành công',
      buttons: ['Đồng ý']
    });
    alert.present();
  }
}
