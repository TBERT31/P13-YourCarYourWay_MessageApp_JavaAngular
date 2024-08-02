import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { RegisterComponent } from './pages/auth/register/register.component';
import { LoginComponent } from './pages/auth/login/login.component';
import { TokenGuard } from './core/guard/token-guard';

const routes: Routes = [
  { title: "Homepage" , path: "", component: HomeComponent },
  { title: "Register" , path: "register", component: RegisterComponent },
  { title: "Login" , path: "login", component: LoginComponent },
  { title: "404 Error" , path: '404', component: NotFoundComponent },
  { path: '**', redirectTo: '404' },
  { path: 'discussion',
    canActivate: [TokenGuard],
    children: [

    ],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
