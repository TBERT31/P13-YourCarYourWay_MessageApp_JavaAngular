import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginRequest } from '../interfaces/loginRequest.interface';
import { Session } from '../../core/interfaces/session.interface';
import { User } from '../../core/interfaces/user.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private pathService = 'api/auth';

  constructor(private httpClient: HttpClient) { }

  public register(user: User): Observable<User> {
    return this.httpClient.post<User>(`${this.pathService}/register`, user);
  }

  public login(loginRequest: LoginRequest): Observable<Session> {
    return this.httpClient.post<Session>(`${this.pathService}/login`, loginRequest);
  }
}
