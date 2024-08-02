import { Injectable } from '@angular/core';
import {ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree} from "@angular/router";
import {Observable} from "rxjs";
import { SessionService } from '../services/session.service';

@Injectable({
  providedIn: 'root'
})
export class TokenGuard implements CanActivate{

    constructor(
        private router: Router,
        private sessionService: SessionService,
    ) { }

    canActivate(
        route: ActivatedRouteSnapshot,
        state: RouterStateSnapshot
    ): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
        let isLogged: boolean = false;

        this.sessionService.$isLogged().subscribe(loggedIn => {
            isLogged = loggedIn;
        });

        if (!isLogged) {
            this.router.navigate(['login']);
            return false;
        }
  
        return true;
    }
}
