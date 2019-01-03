import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpParams} from '@angular/common/http';
import { Router } from '@angular/router';
import * as moment from 'moment';
declare var ApiUrl: any;
 @Injectable({providedIn: 'root'})

export class AuthService {

  constructor(private http: HttpClient) { }

  // Gọi API login vào hệ thống
  login(tendangnhap: string, matkhau: string) {
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/x-www-form-urlencoded');
    let params = new HttpParams().set('tendangnhap', tendangnhap); // create params object
    params = params.append('matkhau', matkhau); // add a new param, creating a new object
    //params = params.append('param3', value3); // add another param 

    //let options = { headers: new HttpHeaders({ 'Content-Type': 'application/json'}) };
    //return this.http.post('http://localhost:81/dangnhap.php', { 'tendangnhap':tendangnhap, 'matkhau':matkhau},options);
    return this.http.post<any>('http://localhost:81/dangnhap.php',{tendangnhap ,matkhau}, {headers: headers});
  }

  // Lưu JWT ra localStorage
  setSession(authResult) {
    localStorage.setItem('id_token', authResult.token);
  }

  // Khi logout thì xóa token ra khỏi storage
  logout() {
    localStorage.removeItem('id_token');
  }

  // Kiểm tra đã đăng nhập chưa, dựa vào expire date
  public isLoggedIn() {
    return moment().isBefore(this.getExpiration());
  }

  // lấy expire date của JWT
  getExpiration() {
    const token = this.decodeToken(localStorage.getItem('id_token'));
    if (token === null) {
      return moment().add(-10000, 'd').toDate();
    }

    return moment.unix(token.exp).toDate();
  }

  private decodeToken(token: string) {
    if (!token) {
      return null;
    }

    try {
      const base64Url = token.split('.')[1];
      const base64 = base64Url.replace('-', '+').replace('_', '/');
      return JSON.parse(window.atob(base64));
    } catch (e) {
      return null;
    }
  }

}