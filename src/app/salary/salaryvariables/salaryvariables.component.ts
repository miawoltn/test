
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { salaryUrl } from '../salary-url';
import swal from 'sweetalert2';
import { employeeUrl } from 'src/app/employee/employee-url';
import { payrollUrl } from 'src/app/payroll/payroll-url';
import { settingsUrl } from 'src/app/settings/settings-url';
@Component({
  selector: 'app-salaryvariables',
  templateUrl: './salaryvariables.component.html',
  styleUrls: ['./salaryvariables.component.scss']
})
export class SalaryvariablesComponent implements OnInit {

  data = [];
  VariableCategory = [];
  VariableType = [];
  obj = {
    VariableTypeID: null, VariableCategoryID: null, EmployeeID: null, Amount: null, Tenor: null, PayrollPeriodID: null,
    StatusID: null, PostedBy: null, DatePosted: null, SalaryComponentID: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'Salary Variables';
  parent = 'Payroll Manager';
  Employee = []; PayrollPeriod = []; SalaryComponents = []; Statuses = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    swal.showLoading();
    this.http.get(salaryUrl.salaryvariables.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(employeeUrl.employee.list)
      .subscribe(success => {
        this.Employee = success.data;
      }, error => { console.log(error); });
    this.http.get(payrollUrl.payrollperiod.list)
      .subscribe(success => {
        this.PayrollPeriod = success.data;
      }, error => { console.log(error); });
    this.http.get(salaryUrl.salarycomponents.list)
      .subscribe(success => {
        this.SalaryComponents = success.data;
      }, error => { console.log(error); });

      this.http.get(salaryUrl.salaryvariablecategory.list)
      .subscribe(success => {
        this.VariableCategory = success.data;
      }, error => { console.log(error); });

      this.http.get(salaryUrl.salaryvariabletype.list)
      .subscribe(success => {
        this.VariableType = success.data;
      }, error => { console.log(error); });

    this.http.get(settingsUrl.statuses.list)
      .subscribe(success => {
        this.Statuses = success.data;
        swal.close();
      }, error => { console.log(error); });

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
    let url = salaryUrl.salaryvariables.add;
    if (this.operation === 'Update') {
      url = salaryUrl.salaryvariables.update;
    }
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire('Process Complete', success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      VariableTypeID: null, VariableCategoryID: null, EmployeeID: null, Amount: null, Tenor: null, PayrollPeriodID: null,
      StatusID: null, PostedBy: null, DatePosted: null, SalaryComponentID: null
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
