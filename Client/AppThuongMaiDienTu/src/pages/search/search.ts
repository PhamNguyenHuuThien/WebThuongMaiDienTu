import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import {ChiTietSanPham} from "../chitietsanpham/chitietsanpham";

/**
 * Generated class for the SearchPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-search',
  templateUrl: 'search.html',
})
export class SearchPage {
  searchQuery: string = '';
  items: any;
  dulieu: any;
  ten: string;
  constructor(public navCtrl: NavController, public navParams: NavParams, public http: HttpClient) {
    this.getData();
      
  }
  initializeItems() {
    this.items=this.dulieu;
  }
  getData(){
    let url = 'http://thien.opestek.com/API/GetSanPham.php'
    let data: Observable<any> = this.http.get(url);
    data.subscribe(result => { 
      console.log(result)
      this.dulieu=result.sanpham;
    })
    this.initializeItems(); 
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad SearchPage');
  }
  getItems(ev: any) {
    // Reset items back to all of the items
    this.initializeItems();

    // set val to the value of the searchbar
    const val = ev.target.value;

    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.items = this.items.filter((item) => {
        this.ten = item.TenSP;
        return (this.ten.toLowerCase().indexOf(val.toLowerCase(),0) > -1);
      })
    }
  }
  ToiCTSP(item){
    this.navCtrl.push(ChiTietSanPham,item);
  }
}
