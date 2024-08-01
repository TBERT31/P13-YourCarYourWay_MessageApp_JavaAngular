import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NotFoundComponent } from './modules/core/components/not-found/not-found.component';
import { AuthGuard } from './guards/auth.guard';
import { UnauthGuard } from './guards/unauth.guard';
import { HomeComponent } from './modules/core/components/home/home.component';
import { RegisterComponent } from './modules/auth/components/register/register.component';
import { LoginComponent } from './modules/auth/components/login/login.component';

const routes: Routes = [
  { path: '', component: HomeComponent },          
  { path: 'register', component: RegisterComponent }, 
  { path: 'login', component: LoginComponent },       
  { path: '**', redirectTo: '' }                     
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
