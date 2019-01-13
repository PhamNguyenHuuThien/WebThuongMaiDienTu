import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpParams} from '@angular/common/http';
import { Router } from '@angular/router';
import * as moment from 'moment';
declare var ApiUrl: any;
 @Injectable({providedIn: 'root'})

export class XuLyDangKy {

  constructor(private http: HttpClient) { }

  // Gọi API login vào hệ thống
  register(ho:string,ten:string,email:string,sodienthoai:string,diachi:string,tendangnhap:string,matkhau:string) {
    console.log("Hiển thị trang đăng ký");
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/x-www-form-urlencoded');
    headers.append('Cookie','abc');
    let params = new HttpParams().set('ho', ho); // create params object
    params = params.append('ten', ten); // add a new param, creating a new object
    params = params.append('email', email); // add another param 
    params = params.append('sodienthoai', sodienthoai); // add another param 
    params = params.append('diachi', diachi); // add another param 
    params = params.append('tendangnhap', tendangnhap); // add another param 
    params = params.append('matkhau', matkhau); // add another param 

    return this.http.post<any>('http://thien.opestek.com/API/DangKy.php',{ho,ten,sodienthoai,diachi,tendangnhap,matkhau,email}, {headers: headers});

    //this.nav.setRoot(HomePage);
  }

  

}