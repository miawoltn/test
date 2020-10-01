import { employeeUrl } from 'src/app/employee/employee-url';
import { Component, OnInit, ElementRef, ViewChild, AfterViewInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import swal from 'sweetalert2';
import { API_URL } from 'src/app/services/app-config';
import { UploadService } from 'src/app/services/upload.service';

@Component({
  selector: 'app-employee-profile',
  templateUrl: './employee-profile.component.html',
  styleUrls: ['./employee-profile.component.css'],
})
export class EmployeeProfileComponent implements AfterViewInit, OnInit {
  // @ViewChild("newPassword", { read: ElementRef, static: true }) newPasswordElementRef: ElementRef;
  @ViewChild('newPassword') newPasswordElementRef: ElementRef;
  @ViewChild('confirmPassword', { read: ElementRef, static: true })
  confirmPasswordElementRef: ElementRef;
  @ViewChild('currentPassword', { read: ElementRef, static: true })
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
  obj2 = { currentPassword: null, newPassword: null, confirmPassword: null, Email: null };
  title = "Merchant Profile";
  parent = "Profile";

  displayPasswordForm = false;
  showProfileUpdate = false;
  newVar: any;

  constructor(
    protected http: HttpService,
    private route: ActivatedRoute,
    private router: Router,
    protected auth: AuthService,
    private uploadService: UploadService
  ) {
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  ngOnInit() {
    this.employeeProfile();
  }

  employeeProfile() {
    this.http.get(employeeUrl.employee.employeeProfile).subscribe(
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

  handleFileInputProfilePhoto(e) {
    console.log(e);
    let file = e.target.files[0];
    console.log(file);

    const formData: FormData = new FormData();
    formData.append('file', file, file.name);

    this.uploadService.upload(formData, `${this.API_URL2}photo`).subscribe(
      (res) => {
        console.log(res.data);
        if (res.data != undefined) {
          this.obj.ProfilePhoto = res.data;
          this.processProfileUpdate();
        }
      },
      (error) => console.log(error)
    );
  }

  onPrint() {
    window.print();
  }

  showProfileUpdateForm() {
    this.showProfileUpdate = true;
  }

  hideProfileUpdateForm() {
    this.showProfileUpdate = false;
  }

  showForm2() {
    this.displayPasswordForm = true;
  }

  ngAfterViewInit() {
    this.newVar = this.currentPasswordElementRef;
  }

  showCurrentPassword() {
    console.log(this.newVar);
    // if (this.currentPasswordElementRef.nativeElement.type === "text") {
    //   this.currentPasswordElementRef.nativeElement.type = "password";
    // } else {
    //   this.currentPasswordElementRef.nativeElement.type = "text";
    // }
  }

  showNewPassword() {
    if (this.newPasswordElementRef.nativeElement.type === 'text') {
      this.newPasswordElementRef.nativeElement.type = 'password';
    } else {
      this.newPasswordElementRef.nativeElement.type = 'text';
    }
  }

  showConfirmPassword() {
    if (this.confirmPasswordElementRef.nativeElement.type === 'text') {
      this.confirmPasswordElementRef.nativeElement.type = 'password';
    } else {
      this.confirmPasswordElementRef.nativeElement.type = 'text';
    }
  }

  processProfileUpdate() {
    let url = employeeUrl.employee.update;
    this.update(url);
  }

  update(url) {
    // console.log(this.obj);
    this.http.post(url, this.obj).subscribe(
      (success) => {
        this.hideProfileUpdateForm();
        this.employeeProfile();
        swal.fire(
          'Update Successful',
          'Profile Picture Updated Successfully',
          'success'
        );
      },
      (error) => {
        console.log(error);
        swal.fire('Error', error.message || 'Some Error Occured', 'error');
      }
    );
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
      this.obj2.Email = this.obj.PersonalEmail;
      const url = employeeUrl.employee.changePassword;
      this.changePassword(url);
    }
  }

  changePassword(url) {
    this.http.post(url, this.obj2).subscribe(
        (res) => {
            // this.data = res.data;
            this.resetForm2();
            swal.fire({
                title: 'Password Update Successful',
                text: 'Please logout to re-authenticate your session',
                type: 'success',
                showCancelButton: false,
                confirmButtonColor: '#15537d',
                // cancelButtonColor: '#d33',
                confirmButtonText: 'Logout',
            }).then(() => {
                // log user out and re-direct to login screen
                this.auth.logoutUser();
            });
        },
        (error) => {
            console.log(error);
            swal.fire('Process Unsuccessful', error.error.message, 'error');
        }
    );
  }

  resetForm2() {
    // this.obj = {};
    this.obj2 = {
      currentPassword: null,
      newPassword: null,
      confirmPassword: null,
      Email: null,
    };
    this.displayPasswordForm = false;
    // this.operation = "Add";
  }
}
