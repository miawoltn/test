
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
import { MatStepper } from '@angular/material/stepper';
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: 'app-employeedeployment',
  templateUrl: './employeedeployment.component.html',
  styleUrls: ['./employeedeployment.component.scss']
})
export class EmployeedeploymentComponent implements OnInit {

  @ViewChild('stepper', { static: true }) private myStepper: MatStepper;

  isEditable = true;
  isLinear = true;

  displayedColumns: string[] = ['EmployeeID', 'CompanyID', 'BranchID', 'DepartmentID', 'UnitID', 'DesignationID', 'GradeID', 'JobDescription'];
  data = [];
  obj = { EmployeeID: null, CompanyID: null, BranchID: null, DepartmentID: null, UnitID: null, DesignationID: null, GradeID: null, JobDescription: null, Employee: null, Company: null, Branch: null, Department: null, Unit: null, Designation: null, Grade: null };
  displayForm = false;
  operation = "Add";
  title = "Employeedeployment";
  parent = "employee";
  Employees: any;
  Company: any;
  Branch: any;
  Departments: any;
  Units: any;
  Designations: any;
  Grades: any;
  FilteredBranches: any;
  FilteredUnits: any;

  constructor(protected http: HttpService) {
    // this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(employeeUrl.employeedeployment.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });

    this.http.get(employeeUrl.employee.list)
      .subscribe(res => {
        this.Employees = res.data;
      }, err => { console.log(err) });

    this.http.get(companyUrl.company.list)
      .subscribe(res => {
        this.Company = res.data;
      }, err => { console.log(err) });

    this.http.get(companyUrl.branches.list)
      .subscribe(res => {
        this.Branch = res.data;
      }, err => { console.log(err) });

    this.http.get(companyUrl.departments.list)
      .subscribe(res => {
        this.Departments = res.data;
      }, err => { console.log(err) });

    this.http.get(companyUrl.units.list)
      .subscribe(res => {
        this.Units = res.data;
      }, err => { console.log(err) });

    this.http.get(companyUrl.designations.list)
      .subscribe(res => {
        this.Designations = res.data;
      }, err => { console.log(err) });

    this.http.get(companyUrl.grades.list)
      .subscribe(res => {
        this.Grades = res.data;
      }, err => { console.log(err) });

  }

  filterBranch(evt) {
    console.log(evt)
    this.FilteredBranches = this.Branch.filter(i => i.CompanyID == evt.CompanyID);
    console.log(this.FilteredBranches)
  }

  filterUnits(evt) {
    console.log(evt)
    this.FilteredUnits = this.Units.filter(i => i.DepartmentID == evt.DepartmentID);
    console.log(this.FilteredBranches)
  }

  onConfirm() {
    this.obj.Employee = this.Employees.find(i => i.EmployeeID == this.obj.EmployeeID).FullName;
    this.obj.Company = this.Company.find(i => i.CompanyID == this.obj.CompanyID).CompanyName;
    this.obj.Branch = this.Branch.find(i => i.BranchID == this.obj.BranchID).BranchName;
    this.obj.Department = this.Departments.find(i => i.DepartmentID == this.obj.DepartmentID).DepartmentName;
    this.obj.Unit = this.Units.find(i => i.UnitID == this.obj.UnitID).UnitName;
    this.obj.Designation = this.Designations.find(i => i.DesignationID == this.obj.DesignationID).DesignationName;
    this.obj.Grade = this.Grades.find(i => i.GradeID == this.obj.GradeID).GradeName;
  }

  processForm() {
    let url = employeeUrl.employeedeployment.add;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetForm();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
        this.myStepper.previous();
      });

  }

  resetForm() {
    this.obj = { EmployeeID: null, CompanyID: null, BranchID: null, DepartmentID: null, UnitID: null, DesignationID: null, GradeID: null, JobDescription: null, Employee: null, Company: null, Branch: null, Department: null, Unit: null, Designation: null, Grade: null };
    this.operation = "Add";
  }
}
