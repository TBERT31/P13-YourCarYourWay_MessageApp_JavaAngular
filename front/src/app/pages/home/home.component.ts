import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { SessionService } from 'src/app/core/services/session.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, OnDestroy {
  constructor(
    private sessionService: SessionService,
    private router: Router,
  ) {}

  ngOnInit(): void {}

  ngOnDestroy() {

  }

  public $isLogged(): Observable<boolean> {
    return this.sessionService.$isLogged();
  }

  public navigateLogin(): void{
    this.router.navigate(['/login']);
  }

  public navigateRegister(): void{
    this.router.navigate(['/register']);
  }
}
