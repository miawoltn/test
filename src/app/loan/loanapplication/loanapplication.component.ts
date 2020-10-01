import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { loanUrl } from '../loan-url';
import { employeeUrl } from 'src/app/employee/employee-url';
import { payrollUrl } from 'src/app/payroll/payroll-url';
@Component({
  selector: 'app-loanapplication',
  templateUrl: './loanapplication.component.html',
  styleUrls: ['./loanapplication.component.scss']
})
export class LoanapplicationComponent implements OnInit {

  title = 'Loan Applictions';
  parent = 'Loans';
  isEditable = true;
  isLinear = true;
  subtotal = 0;

  obj = {
    LoanID: null,
    EmployeeID: null,
    LoanDate: null,
    LoanTypeID: null,
    Amount: null,
    InterestRate: 0,
    Tenor: 1,
    RepaymentAmount: null,
    ApprovalStageID: null,
    ApprovingOfficerID: null,
    LoanStatusID: null,
    FullName: null,
    LoanType: null,
    StartPeriodID: null,
    StartPeriod: null,
    MonthlyRepayment: null,
    GuarantorName: null,
    Address: null,
    PhoneNumber: null,
    JobTitle: null,
    Email: null,
  };
  operation = 'Add';
  employee = [];
  loantypes = [];
  PayrollPeriod = [];

  constructor(protected http: HttpService, protected route: ActivatedRoute) { }

  print() {
    window.print();
  }

  ngOnInit() {
    this.route.params.subscribe((params) => {
      console.log(params);
      if (params.id) {
        this.loadItem(params.id);
      }
    });
    this.http.get(payrollUrl.payrollperiod.list)
      .subscribe(success => {
        this.PayrollPeriod = success.data;
        swal.close();
      }, error => { console.log(error); });

    this.http.get(employeeUrl.employee.supervisors)
      .subscribe(success => {
        this.employee = success.data;
      }, error => { console.log(error); });

    this.http.get(loanUrl.loantypes.list)
      .subscribe(success => {
        this.loantypes = success.data;
      }, error => { console.log(error); });

  }

  // addItem() {
  //   this.obj.detail.push({});
  // }

  // removeItem(i) {
  //   this.obj.detail.splice(i, 1);
  // }

  onConfirm() {
    this.obj.FullName = this.employee.find(item => this.obj.ApprovingOfficerID === item.id).FullName;
    this.obj.LoanType = this.loantypes.find(item => this.obj.LoanTypeID === item.id).LoanType;
    this.obj.StartPeriod = this.PayrollPeriod.find(item => this.obj.StartPeriodID === item.PayrollPeriodID).PayrollPeriod;
  }

  calculateAmount() {
    this.obj.RepaymentAmount = this.obj.Amount * (1 + this.obj.InterestRate / 100.0);
    this.obj.MonthlyRepayment = this.obj.RepaymentAmount / this.obj.Tenor;
  }


  processForm() {
    let url = loanUrl.loanapplication.add;
    if (this.operation === 'Update') {
      url = loanUrl.loanapplication.update;
    }
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        swal.fire('Success', success.message, 'success');
        this.isEditable = false;
      }, error => {
        console.log(error);
        swal.fire('Error', error.message || 'Some Error Occured', 'error');
      });
  }

  resetForm() {
    this.operation = 'Add';
    this.isEditable = true;
  }

  loadItem(id) {
    this.http.get(loanUrl.loanapplication.get + '/' + id)
      .subscribe(success => {
        this.obj = success.data;
        this.isEditable = true;
        this.operation = 'Update';
      }, error => {
        console.log(error);
        swal.fire('Error', error.message || 'Some Error Occured', 'error');
      });
  }
}
