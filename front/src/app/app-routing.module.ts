import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { RegisterComponent } from './pages/auth/register/register.component';
import { LoginComponent } from './pages/auth/login/login.component';
import { TokenGuard } from './core/guard/token-guard';
import { DiscussionsListComponent } from './pages/discussions/discussions-list/discussions-list.component';
import { DiscussionsFormComponent } from './pages/discussions/discussions-form/discussions-form.component';
import { DiscussionsDetailComponent } from './pages/discussions/discussions-detail/discussions-detail.component';

const routes: Routes = [
  { title: "Homepage" , path: "", component: HomeComponent },
  { title: "Register" , path: "register", component: RegisterComponent },
  { title: "Login" , path: "login", component: LoginComponent },
  { path: 'discussion',
    canActivate: [TokenGuard],
    children: [
      {
        path: '',
        redirectTo: 'list',
        pathMatch: 'full' 
      },
      {
        title: 'Discussions List',
        path: 'list',
        component: DiscussionsListComponent
      },
      {
        title: 'Discussion Detail',
        path: 'detail/:id',
        component: DiscussionsDetailComponent
      },
    ],
  },
  { title: "404 Error" , path: '404', component: NotFoundComponent },
  { path: '**', redirectTo: '404' }, 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
