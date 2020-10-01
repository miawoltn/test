
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
import { MatStepper } from '@angular/material/stepper';
import { settingsUrl } from 'src/app/settings/settings-url';
import { Router } from '@angular/router';
@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.scss']
})
export class EmployeeComponent implements OnInit {

  @ViewChild('stepper', { static: false }) private myStepper: MatStepper;

  isEditable = true;
  isLinear = true;

  data = [];
  obj = {
    FirstName: null, SurName: null, FullName: null, DateOfBirth: null, GradeID: null, GradeLevelID: null, UnitID: null,
    CompanyID: null, BranchID: null, StateID: null, DepartmentID: null, DesignationID: null, StatusID: null, EmployeeTitleID: null,
    NationalityID: null, GenderID: null, MobileNum: null, HomeNum: null, Email: null, ResidentialAddress: null, StateofOriginID: null,
    LgaID: null, CityID: null, Tribe: null, Hobbies: null, EmployeeTypeID: null, NHFNo: null, PensionProviderID: null, BankID: null,
    BankAccountNo: null, EmployeeStatusID: null, MiddleName: null, EmployeeNumber: null, MaritalStatusID: null, ReligionID: null,
    Gender: null, MaritalStatus: null, EmployeeTitle: null, EmployeeType: null, EmployeeStatus: null
  };
  displayForm = false;
  displayTable = true;
  operation = 'Add';
  title = 'Employee';
  parent = 'Employee';
  Gender = []; MaritalStatus = []; EmployeeTitle = []; EmployeeType = []; EmployeeStatus = [];

  constructor(protected http: HttpService, protected router: Router) {
    this.loadProfile = this.loadProfile.bind(this);
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(employeeUrl.employee.list)
      .subscribe(res => {
        this.data = res.data.sort(function(a, b) { return a.id - b.id });
      }, err => { console.log(err); });

    this.http.get(settingsUrl.gender.list)
      .subscribe(res => {
        this.Gender = res.data;
      }, err => { console.log(err); });

    this.http.get(settingsUrl.maritalstatus.list)
      .subscribe(res => {
        this.MaritalStatus = res.data;
      }, err => { console.log(err); });

    this.http.get(employeeUrl.employeetitle.list)
      .subscribe(res => {
        this.EmployeeTitle = res.data;
      }, err => { console.log(err); });

    this.http.get(employeeUrl.employeetype.list)
      .subscribe(res => {
        this.EmployeeType = res.data;
      }, err => { console.log(err); });

  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  onConfirm() {
    this.obj.Gender = this.Gender.filter(i => i.id === this.obj.GenderID)[0].Gender;
    this.obj.MaritalStatus = this.MaritalStatus.filter(i => i.id === this.obj.MaritalStatusID)[0].MaritalStatus;
    this.obj.EmployeeTitle = this.EmployeeTitle.filter(i => i.id === this.obj.EmployeeTitleID)[0].EmployeeTitle;
    this.obj.EmployeeType = this.EmployeeType.filter(i => i.id === this.obj.EmployeeTypeID)[0].EmployeeType;
  }

  processForm() {
    let url = employeeUrl.employee.add;
    if (this.operation === 'Update') {
      url = employeeUrl.employee.update;
    }
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        this.resetForm();
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
        this.myStepper.previous();
      });

  }

  loadProfile(id) {
    const empId = id.row.data.id;
    this.router.navigate(['/ess/employee-profile', empId]);
  }

  loadItem(id) {
    this.router.navigate(['/employee/employee-data', id.row.data.id]);
    // this.obj = this.data.find(item => item.id === id.row.data.id);
  }

  resetForm() {
    this.obj = {
      FirstName: null, SurName: null, FullName: null, DateOfBirth: null, GradeID: null, GradeLevelID: null, UnitID: null,
      CompanyID: null, BranchID: null, StateID: null, DepartmentID: null, DesignationID: null, StatusID: null, EmployeeTitleID: null,
      NationalityID: null, GenderID: null, MobileNum: null, HomeNum: null, Email: null, ResidentialAddress: null, StateofOriginID: null,
      LgaID: null, CityID: null, Tribe: null, Hobbies: null, EmployeeTypeID: null, NHFNo: null, PensionProviderID: null, BankID: null,
      BankAccountNo: null, EmployeeStatusID: null, MiddleName: null, EmployeeNumber: null, MaritalStatusID: null, ReligionID: null,
      Gender: null, MaritalStatus: null, EmployeeTitle: null, EmployeeType: null, EmployeeStatus: null
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
