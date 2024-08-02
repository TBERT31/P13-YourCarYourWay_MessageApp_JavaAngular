import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ReactiveFormsModule } from '@angular/forms';
import { HTTP_INTERCEPTORS, HttpClient, HttpClientModule } from '@angular/common/http';
import { SharedModule } from './shared/shared.module';
import { HeaderComponent } from './components/header/header.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { RegisterComponent } from './pages/auth/register/register.component';
import { LoginComponent } from './pages/auth/login/login.component';
import { JwtInterceptor } from './core/interceptor/jwt.interceptor';
import { HomeComponent } from './pages/home/home.component';
import { DiscussionsListComponent } from './pages/discussions/discussions-list/discussions-list.component';
import { DiscussionsDetailComponent } from './pages/discussions/discussions-detail/discussions-detail.component';
import { DiscussionsFormComponent } from './pages/discussions/discussions-form/discussions-form.component';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    HomeComponent,
    NotFoundComponent,
    RegisterComponent,
    LoginComponent,
    DiscussionsListComponent,
    DiscussionsDetailComponent,
    DiscussionsFormComponent,
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    SharedModule,
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true},
    HttpClient,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
