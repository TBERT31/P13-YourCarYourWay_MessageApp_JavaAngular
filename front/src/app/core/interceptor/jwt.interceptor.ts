import { Injectable } from '@angular/core';
import {HttpEvent, HttpHandler, HttpInterceptor, HttpRequest, HttpHeaders} from "@angular/common/http";
import {Observable} from "rxjs";
import { SessionService } from '../services/session.service';

@Injectable({
  providedIn: 'root'
})
export class JwtInterceptor implements HttpInterceptor{

    constructor(private sessionService: SessionService) { }

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        if(!req.url.includes('/login') || !req.url.includes('/register')){

        const token = this.sessionService.getToken();

        if(token){
            //assigner le token;
            const authReq = req.clone({
            headers: new HttpHeaders({
                Authorization:  `Bearer ${token}`
            })
            });
            return next.handle(authReq);
        }

        }

        return next.handle(req);
    }
}
