import {Injectable} from "@angular/core";
import {CanActivate, Router} from "@angular/router"; 
import { SessionService } from "../modules/core/services/session.service";

@Injectable({providedIn: 'root'})
export class AuthGuard implements CanActivate {

  constructor( 
    private router: Router,
    private sessionService: SessionService,
  ) {}


  canActivate(): boolean {
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