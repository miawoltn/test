import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import swal from 'sweetalert2';
import { AuthService } from '../../services/auth.service';
import { AlertService } from 'src/app/services/alert.service';

import { MySharedEvent } from 'src/app/services/shared-events.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  obj = { username: '', password: '' };

  constructor(private _auth: AuthService, protected router: Router, private _router: Router,
    private alert: AlertService,  private events: MySharedEvent) {
    this.router.routeReuseStrategy.shouldReuseRoute = function () {
      return false;
    };
  }

  ngOnInit() {

  }



  loginUser() {
    swal.showLoading();
    this._auth.loginUser(this.obj)
      .subscribe(
        res => {
          // console.log(res);
          localStorage.setItem('token', res.token);
          localStorage.setItem('userinfo', res.data.lastname + ', ' + res.data.firstname + ' ' + res.data.middlename);
          localStorage.setItem('empId', res.data.staff_id);
          localStorage.setItem('empStatus', res.data.StatusID);
          if (res.url) {
            localStorage.setItem('moduleId', res.moduleId);
            localStorage.setItem('br', '0');
            this.events.eventData.emit(res.moduleId);
            this.events.breadcrumbData.emit(0);
            this._router.navigate([res.url]);
          } else { this._router.navigate(['dashboard']); }
          /* if (this._router.navigate([''])) {
            window.location.replace('');
          } */
          this.alert.success(res.message);
        },
        err => {
          console.log(err);
          swal.fire({
            type: 'error',
            title: 'Oops...',
            text: err.error.message || 'Something went wrong!',
          });
        }
      );
  }
}
