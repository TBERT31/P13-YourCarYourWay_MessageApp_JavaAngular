import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { HeaderComponent } from './components/header/header.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { SharedModule } from '../shared/shared.module';



@NgModule({
  declarations: [
    HomeComponent,
    HeaderComponent,
    NotFoundComponent,
  ],
  imports: [
    SharedModule,
    CommonModule,
    RouterModule,
  ], exports: [
    HomeComponent,
    HeaderComponent,
    NotFoundComponent,
  ]
})
export class CoreModule { }