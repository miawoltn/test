import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from 'src/app/employee/employee-url';
import swal from "sweetalert2";

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.scss']
})
export class ForgotPasswordComponent implements OnInit {
  obj = { Email: "" };

  constructor(protected http: HttpService) { }

  ngOnInit() {
  }

  resetPassword() {
    let url = employeeUrl.employee.resetPassword;
      this.reset(url);
  }

  reset(url) {
    // console.log(this.obj);
    swal.showLoading();
    this.http.post(url, this.obj).subscribe(
      (res) => {
        swal.close();
        swal.fire(res.title, res.message, res.type);
        this.resetForm();
      },
      (err) => {
        console.log(err);
        swal.fire(err.error.title, err.error.message, err.error.type);
      }
    );
  }

  resetForm() {
    this.obj = { Email: "" };
  }

}