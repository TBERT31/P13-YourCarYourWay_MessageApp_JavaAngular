import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, OnDestroy {
  constructor(
    private router: Router,
  ) {}

  ngOnInit(): void {}

  ngOnDestroy() {

  }

  public navigateLogin(): void{
    this.router.navigate(['/login']);
  }

  public navigateRegister(): void{
    this.router.navigate(['/register']);
  }
}
