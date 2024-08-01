import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SessionService } from "../modules/core/services/session.service";

@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor(private sessionService: SessionService) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = this.sessionService.getToken();

    if (token) {
      const cloned = req.clone({
        setHeaders: {
          Authorization: `Bearer ${token}` 
        }
      });

      return next.handle(cloned);
    }

    return next.handle(req);
  }
}
