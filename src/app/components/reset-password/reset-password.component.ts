import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import swal from "sweetalert2";
import { employeeUrl } from 'src/app/employee/employee-url';

@Component({
  selector: "app-reset-password",
  templateUrl: "./reset-password.component.html",
  styleUrls: ["./reset-password.component.scss"],
})
export class ResetPasswordComponent implements OnInit {
  obj = { password: "", confirmPassword: "", token: "" };
  token: any;

  constructor(protected http: HttpService, protected route: ActivatedRoute, protected router: Router) {
    this.token = this.route.snapshot.params.token;
    localStorage.setItem('token', this.token);
  }

  ngOnInit() {}

  resetPassword() {
    if (this.obj.password == this.obj.confirmPassword) {
      let url = employeeUrl.employee.resetPassword2;
      this.obj.token = this.token;
      this.reset(url);
    } else {
      swal.fire("Process Unsuccessful", "Password does not match!", "error");
    }
  }

  reset(url) {
    console.log(this.obj);
    this.http.post(url, this.obj).subscribe(
      (res) => {
        // swal.fire("Reset Complete", "Password reset was successful.", "success");

        swal
        .fire({
          title: "Reset Complete",
          text: "Password reset was successful.",
          // type: "warning",
          showCancelButton: false,
          confirmButtonColor: "#D03F7F",
          confirmButtonText: "Sign-in",
        })
        .then(() => {
          // log user to profile page
          this.router.navigate(["/login"]);
        });

        this.resetForm();
      },
      (err) => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, "error");
      }
    );
  }

  resetForm() {
    this.obj = { password: "", confirmPassword: "", token: "" };
  }
}
