import { Injectable, Injector } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';
import {NavController} from "ionic-angular";
import {LoginPage} from "../login/login";
 
@Injectable()
export class AuthInterceptor implements HttpInterceptor {
 
    constructor(private authService: AuthService) {
    }
 
    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
 
        const idToken = localStorage.getItem('id_token');
 
        if (idToken) {
 
            if (!this.authService.isLoggedIn()) {
                alert('Hết phiên đăng nhập, vui lòng đăng nhập lại');
                //location.href = '/authorize/login';
                var nav: NavController;
                nav.setRoot(LoginPage);
            }
 
            const cloned = req.clone({
                headers: req.headers.set('Authorization', 'Bearer ' + idToken)
            });
            return next.handle(cloned);
        } else {
            return next.handle(req);
        }
    }
}