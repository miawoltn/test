import { employeeUrl } from "src/app/employee/employee-url";
import { Component, OnInit, ElementRef, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { ActivatedRoute, Router } from "@angular/router";
import { AuthService } from "src/app/services/auth.service";
import swal from "sweetalert2";
import { API_URL } from 'src/app/services/app-config';

@Component({
  selector: "app-employee-profile-2",
  templateUrl: "./employee-profile-2.component.html",
  styleUrls: ["./employee-profile-2.component.css"],
})
export class EmployeeProfile2Component implements OnInit {
  @ViewChild("newPassword", { read: ElementRef, static: true })
  newPasswordElementRef: ElementRef;
  @ViewChild("confirmPassword", { read: ElementRef, static: true })
  confirmPasswordElementRef: ElementRef;
  @ViewChild("currentPassword", { read: ElementRef, static: true })
  currentPasswordElementRef: ElementRef;

  API_URL2 = API_URL;

  obj = {
    FirstName: null,
    SurName: null,
    FullName: null,
    DateOfBirth: null,
    GradeID: null,
    GradeLevelID: null,
    Country: null,
    UnitID: null,
    CompanyID: null,
    BranchID: null,
    StateID: null,
    DepartmentID: null,
    DesignationID: null,
    State: null,
    StatusID: null,
    EmployeeTitleID: null,
    NationalityID: null,
    GenderID: null,
    MobileNum: null,
    HomeNum: null,
    Email: null,
    ResidentialAddress: null,
    StateofOriginID: null,
    LgaID: null,
    CityID: null,
    Tribe: null,
    Hobbies: null,
    EmployeeTypeID: null,
    NHFNo: null,
    PensionProviderID: null,
    BankID: null,
    BankAccountNo: null,
    EmployeeStatusID: null,
    MiddleName: null,
    EmployeeNumber: null,
    MaritalStatusID: null,
    ReligionID: null,
    BranchName: null,
    CompanyName: null,
    DepartmentName: null,
    DesignationName: null,
    EmployeeTitle: null,
    EmployeeType: null,
    Gender: null,
    GradeLevelName: null,
    GradeName: null,
    local_govt: null,
    MaritalStatus: null,
    Name: null,
    PensionProvider: null,
    Religion: null,
    state: null,
    StatusName: null,
    UnitName: null,
    BankName: null,
    PensionPIN: null,
    PersonalEmail: null,
    LeaveType: null,
    Residency: null,
    ResidencyCheckFlag: null,
    ContractLetter: null,
    ProfilePhoto: null,
    JobDescription: null,
  };

  empworkhistory = [];
  empedu = [];
  empfam = [];
  empdependent = [];
  emphealth = [];
  obj2 = { currentPassword: null, newPassword: null, confirmPassword: null };
  title = "Merchant Profile";
  parent = "Profile";

  displayPasswordForm = false;
  empID: string;

  constructor(
    protected http: HttpService,
    private route: ActivatedRoute,
    private router: Router,
    protected auth: AuthService
  ) {
    this.empID = this.route.snapshot.params.id;
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }

  ngOnInit() {
    this.http.get(employeeUrl.employee.get2 + this.empID).subscribe(
      (res) => {
        this.obj = res.data.employee;
        this.empworkhistory = res.data.empworkhistory;
        this.empedu = res.data.empedu;
        this.empfam = res.data.empfam;
        this.empdependent = res.data.empdependent;
        this.emphealth = res.data.emphealth;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  onPrint() {
    window.print();
  }

  showForm2() {
    this.displayPasswordForm = true;
  }

  showCurrentPassword() {
    if (this.currentPasswordElementRef.nativeElement.type === "text") {
      this.currentPasswordElementRef.nativeElement.type = "password";
    } else {
      this.currentPasswordElementRef.nativeElement.type = "text";
    }
  }

  showNewPassword() {
    if (this.newPasswordElementRef.nativeElement.type === "text") {
      this.newPasswordElementRef.nativeElement.type = "password";
    } else {
      this.newPasswordElementRef.nativeElement.type = "text";
    }
  }

  showConfirmPassword() {
    if (this.confirmPasswordElementRef.nativeElement.type === "text") {
      this.confirmPasswordElementRef.nativeElement.type = "password";
    } else {
      this.confirmPasswordElementRef.nativeElement.type = "text";
    }
  }

  processChangePassword() {
    if (this.obj2.newPassword !== this.obj2.confirmPassword) {
      swal.fire(
        "Password Mismatch",
        "confirm Password does not match new password!",
        "error"
      );
    } else {
      // this.ApplicationUser.user.Password = this.obj2.newPassword;
      const url = employeeUrl.employee.changePassword;
      this.changePassword(url);
    }
  }

  changePassword(url) {
    console.log(this.obj);
    // this.http.put(url, this.ApplicationUser, httpOptions).subscribe(
    //     (res) => {
    //         this.data = res.data;
    //         this.resetForm2();
    //         swal.fire({
    //             title: 'Password Successfully Changed',
    //             text: 'Please logout to re-authenticate your session',
    //             type: 'success',
    //             showCancelButton: false,
    //             confirmButtonColor: '#15537d',
    //             // cancelButtonColor: '#d33',
    //             confirmButtonText: 'Logout',
    //         }).then(() => {
    //             // log user out and re-direct to login screen
    //             this.auth.logoutUser();
    //         });
    //     },
    //     (error) => {
    //         console.log(error);
    //         swal.fire('Process Unsuccessful', error.error.message, 'error');
    //     }
    // );
  }

  resetForm2() {
    // this.obj = {};
    this.obj2 = {
      currentPassword: null,
      newPassword: null,
      confirmPassword: null,
    };
    this.displayPasswordForm = false;
    // this.operation = "Add";
  }
}
