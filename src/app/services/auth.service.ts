import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { API_URL } from './app-config';
import Swal from 'sweetalert2';
// import 'rxjs/add/operator/map';

@Injectable()
export class AuthService {

  private _registerUrl = API_URL + '/register';
  private _loginUrl = API_URL + 'login';
  private _logoutUrl = API_URL + 'logout';
  private _menuUrl = API_URL + 'menu';

  constructor(private http: HttpClient, private _router: Router) { }

  registerUser(user) {
    return this.http.post<any>(this._registerUrl, JSON.stringify(user));
  }

  loginUser(user) {
    return this.http.post<any>(this._loginUrl, JSON.stringify(user));
  }

  menu() {
    return this.http.post<any>(this._menuUrl, null);
  }

  logoutUser() {
    Swal.showLoading();
    this.http.post(this._logoutUrl, {}).subscribe(success => {
      localStorage.removeItem('token');
      localStorage.removeItem('menus');
      localStorage.removeItem('userinfo');
      localStorage.removeItem('modules');
      localStorage.removeItem('moduleId');
      localStorage.removeItem('br');
      Swal.close();
      this._router.navigate(['/login']);
    });
  }


  getToken() {
    // console.log(localStorage.getItem('token'))
    return localStorage.getItem('token') || '';
  }

  getUserInfo() {
    return localStorage.getItem('userinfo') || '';
  }

  loggedIn() {
    return !!localStorage.getItem('token');
  }
}
