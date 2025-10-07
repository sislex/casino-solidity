import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {environment} from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class RegistrationService {
  constructor(private http: HttpClient) {}

  private apiUrl =  `${environment.hostUrl}/api/auth`;

  addNewUser(data: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, data );
  }

  checkAuth(data: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, data );
  }
}
