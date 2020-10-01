
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
import { MatStepper } from '@angular/material/stepper';
import { settingsUrl } from 'src/app/settings/settings-url';
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-employee-profile',
  templateUrl: './employee-profile.component.html',
  styleUrls: ['./employee-profile.component.scss']
})
export class EmployeeprofileComponent implements OnInit {

  @ViewChild('stepper' ,{ static: true }) private myStepper: MatStepper;

  isEditable = true;
  isLinear = true;

  isEditableEducation = false;

  data = [];
  obj = {
    Department: null, Designation: null, local_govt: null, state: null, Branch: null, Company: null,
    PensionProvider: null, Country: null, Religion: null, EmployeeID: null, FirstName: null, SurName: null,
    FullName: null, DateOfBirth: null, GradeID: null, GradeLevelID: null, UnitID: null, CompanyID: null, BranchID: null,
    StateID: null, DepartmentID: null, DesignationID: null, StatusID: null, EmployeeTitleID: null, NationalityID: null,
    GenderID: null, MobileNum: null, HomeNum: null, Email: null, ResidentialAddress: null, StateofOriginID: null, LgaID: null,
    CityID: null, Tribe: null, Hobbies: null, EmployeeTypeID: null, NHFNo: null, PensionProviderID: null, BankID: null,
    BankAccountNo: null, EmployeeStatusID: null, MiddleName: null, EmployeeNumber: null, MaritalStatusID: null, ReligionID: null,
    Gender: null, MaritalStatus: null, EmployeeTitle: null, EmployeeType: null, EmployeeStatus: null
  };

  obj2 = {
    Description: null, SchoolType: null, ProgrammeType: null, SchoolName: null, QualificationName: null, QualificationGradeName: null,
    StartDate: null, EndDate: null, SchoolTypeID: null, ProgrammeTypeID: null, QualificationID: null, QualificationGradeID: null,
    EmployeeID: null
  };

  obj3 = {
    FullName: null, Address: null, RelationshipName: null,
    PhoneNumber: null, JobTitle: null, Email: null, RelationshipID: null, EmployeeID: null
  };

  obj4 = { GuarantorName: null, Address: null, PhoneNumber: null, JobTitle: null, Email: null, EmployeeID: null };

  displayForm = false;
  displayTable = true;
  operation = 'Add';
  title = 'Profile';
  parent = 'Employee';
  Gender = []; MaritalStatus = []; EmployeeTitle = []; EmployeeType = []; EmployeeStatus = [];
  empId: any;
  emp: any;
  Country: any;
  State: any;
  LGA: any;
  Religion: any;
  filteredStates: any;
  filteredLGA: any;
  Bank: any;
  Pensionprovider: any;
  isEditableFamily = false;
  isEditableGuarantor = false;
  isEditableEmployee: boolean;
  employeeInfo: any;
  employeeEdu: any;
  Relationship: any;

  constructor(
    protected http: HttpService,
    private route: ActivatedRoute
  ) {
    // get empId from url
    this.empId = this.route.snapshot.params.id;
    console.log(this.empId);
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    // get user info by id
    this.http.get(employeeUrl.employee.get + this.empId)
      .subscribe(res => {
        console.log(res);
        this.obj = res.data;
        this.employeeInfo = res.data;
      }, err => { console.log(err); });
    // get user info by id
    this.http.get(employeeUrl.employeeeducation.getbyempid + this.empId)
      .subscribe(res => {
        console.log(res);
        if (res.data !== false) {
          this.obj2 = res.data;
        }
        this.employeeEdu = res.data;
      }, err => { console.log(err); });

    // get user family info by id
    this.http.get(employeeUrl.employeefamily.getbyempid + this.empId)
      .subscribe(res => {
        console.log(res);
        if (res.data !== false) {
          this.obj3 = res.data;
        }
        this.employeeEdu = res.data;
      }, err => { console.log(err); });

    // get user gaurantor info by id
    this.http.get(employeeUrl.employeeguarantor.getbyempid + this.empId)
      .subscribe(res => {
        console.log(res);
        if (res.data !== false) {
          this.obj4 = res.data;
        }
        this.employeeEdu = res.data;
      }, err => { console.log(err); });

    this.http.get(employeeUrl.employee.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(settingsUrl.country.list)
      .subscribe(res => {
        this.Country = res.data;
      }, err => {
        console.log(err);
      });
    this.http.get(settingsUrl.state.list)
      .subscribe(res => {
        this.State = res.data;
      }, err => {
        console.log(err);
      });

    this.http.get(settingsUrl.local_govt.list)
      .subscribe(res => {
        this.LGA = res.data;
      }, err => {
        console.log(err);
      });

    this.http.get(settingsUrl.religion.list)
      .subscribe(res => {
        this.Religion = res.data;
      }, err => {
        console.log(err);
      });

    this.http.get(employeeUrl.relationship.list)
      .subscribe(res => {
        this.Relationship = res.data;
      }, err => {
        console.log(err);
      });

    this.http.get(settingsUrl.bank.list)
      .subscribe(res => {
        this.Bank = res.data;
      }, err => {
        console.log(err);
      });

    this.http.get(settingsUrl.pensionprovider.list)
      .subscribe(res => {
        this.Pensionprovider = res.data;
      }, err => {
        console.log(err);
      });

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

  editEmployee() {
    this.isEditableEmployee = true;
  }

  editEducation() {
    this.isEditableEducation = true;
  }

  editFamily() {
    this.isEditableFamily = true;
  }

  editGuarantor() {
    this.isEditableGuarantor = true;
  }

  filterStates(evt) {
    console.log(evt);
    this.filteredStates = this.State.filter(i => i.country_id === evt.country_id);
    console.log(this.filteredStates);
  }

  filterLga(evt) {
    console.log(evt);
    console.log(this.LGA);
    this.filteredLGA = this.LGA.filter(i => i.state_id === evt.state_id);
    console.log(this.filteredLGA);
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

  processForm() {
    this.obj.EmployeeID = this.empId;
    const url = employeeUrl.employee.update;
    this.save(url);
    // if (this.operation == "Update")
    //   url = employeeUrl.employee.update;
  }

  processForm2() {
    console.log(this.empId);
    this.obj2.EmployeeID = this.empId;
    const url = employeeUrl.employeeeducation.add;
    this.save2(url);
  }

  processForm3() {
    this.obj3.EmployeeID = this.empId;
    const url = employeeUrl.employeefamily.add;
    this.save3(url);
  }

  processForm4() {
    this.obj4.EmployeeID = this.empId;
    const url = employeeUrl.employeeguarantor.add;
    this.save4(url);
  }

  save(url) {
    console.log(this.obj);
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

  save2(url) {
    console.log(this.obj2);
    this.http.post(url, this.obj2)
      .subscribe(res => {
        // this.data = res.data;
        this.obj2 = res.data.filter(i => i.EmployeeID === this.empId);
        console.log(this.obj2);
        swal.fire('Process Complete', res.message, 'success');
        this.isEditableEducation = false;
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
        this.myStepper.previous();
      });
  }

  save3(url) {
    console.log(this.obj3);
    this.http.post(url, this.obj3)
      .subscribe(res => {
        // this.data = res.data;
        this.obj3 = res.data.filter(i => i.EmployeeID === this.empId);
        console.log(this.obj3);
        swal.fire('Process Complete', res.message, 'success');
        this.isEditableFamily = false;
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });
  }

  save4(url) {
    console.log(this.obj4);
    this.http.post(url, this.obj4)
      .subscribe(res => {
        // this.data = res.data;
        this.obj4 = res.data.filter(i => i.EmployeeID === this.empId);
        console.log(this.obj4);
        swal.fire('Process Complete', res.message, 'success');
        this.isEditableGuarantor = false;
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    // this.obj = { EmployeeID: null, FirstName: null, SurName: null, FullName: null, DateOfBirth: null, GradeID: null, GradeLevelID: null, UnitID: null, CompanyID: null, BranchID: null, StateID: null, DepartmentID: null, DesignationID: null, StatusID: null, EmployeeTitleID: null, NationalityID: null, GenderID: null, MobileNum: null, HomeNum: null, Email: null, ResidentialAddress: null, StateofOriginID: null, LgaID: null, CityID: null, Tribe: null, Hobbies: null, EmployeeTypeID: null, NHFNo: null, PensionProviderID: null, BankID: null, BankAccountNo: null, EmployeeStatusID: null, MiddleName: null, EmployeeNumber: null, MaritalStatusID: null, ReligionID: null, Gender: null, MaritalStatus: null, EmployeeTitle: null, EmployeeType: null, EmployeeStatus: null };
    this.obj = this.employeeInfo;
    this.operation = 'Add';

    this.isEditableEmployee = false;
  }
  resetForm2() {
    this.obj2 = {
      Description: null, SchoolType: null, ProgrammeType: null, SchoolName: null, QualificationName: null, QualificationGradeName: null,
      StartDate: null, EndDate: null, SchoolTypeID: null, ProgrammeTypeID: null, QualificationID: null, QualificationGradeID: null,
      EmployeeID: null
    };
    this.operation = 'Add';

    this.isEditableEducation = false;
  }

  resetForm3() {
    this.obj3 = {
      FullName: null, Address: null, RelationshipName: null,
      PhoneNumber: null, JobTitle: null, Email: null, RelationshipID: null, EmployeeID: null
    };

    this.operation = 'Add';

    this.isEditableFamily = false;
  }

  resetForm4() {
    this.obj4 = { GuarantorName: null, Address: null, PhoneNumber: null, JobTitle: null, Email: null, EmployeeID: null };
    this.operation = 'Add';

    this.isEditableGuarantor = false;
  }
}
