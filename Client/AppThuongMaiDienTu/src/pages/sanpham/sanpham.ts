import {Component} from "@angular/core";
import {NavController} from "ionic-angular";
import {LoginPage} from "../login/login";
import {HomePage} from "../home/home";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import {ChiTietSanPham} from "../chitietsanpham/chitietsanpham";
import {SearchPage} from "../search/search";

@Component({
  selector: 'sanpham',
  templateUrl: 'sanpham.html'
})
export class SanPham {
  public isSearchbarOpened = false;
  public items:any;
  constructor(public nav: NavController, public http: HttpClient) {
    this.getData();
  }
  
  // register and go to home page
  register() {
    this.nav.setRoot(HomePage);
  }

  // go to login page
  login() {
    this.nav.setRoot(LoginPage);
  }

  //get data
  getData() {
    let url = 'http://thien.opestek.com/API/GetSanPham.php'
    let data: Observable<any> = this.http.get(url);
    data.subscribe(result => { 
      console.log(result)
      this.items=result.sanpham;
    })
  }
  onSearch(event){
    console.log(event.target.value);
  }
  ToiCTSP(item){
    this.nav.push(ChiTietSanPham,item);
  }
  GotoSearch(){
    this.nav.push(SearchPage);
  }
}