import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { loanUrl } from '../loan-url';
@Component({
  selector: 'app-loanrepayment',
  templateUrl: './loanrepayment.component.html',
  styleUrls: ['./loanrepayment.component.scss']
})
export class LoanrepaymentComponent implements OnInit {

  parent = 'Loans';
  title = 'Loan Repayment';
  isEditable = true;
  isLinear = true;
  subtotal = 0;


  obj = {
    LoanApplicationID: null, Amount: null, PayrollPeriodID: null, RepaymentTypeID: null,
    RepaymentSourceID: 2, LoanID: null, RepaymentSource: null, RepaymentType: null
  };
  operation = 'Add';
  loanapplication = []; loanrepaymentsource = []; loanrepaymenttype = [];
  readonly = false;

  constructor(protected http: HttpService, protected route: ActivatedRoute) { }

  print(){
    window.print();
  }
 
  ngOnInit() {
    this.route.params.subscribe(params => {
      console.log(params);
      if (params.id) {
        this.loadItem(params.id);
      }
    });
    this.http.get(loanUrl.loanapplication.balance)
      .subscribe(success => {
        this.loanapplication = success.data;
      }, error => { console.log(error); });
    this.http.get(loanUrl.loanrepaymentsource.list)
      .subscribe(success => {
        this.loanrepaymentsource = success.data;
      }, error => { console.log(error); });
    this.http.get(loanUrl.loanrepaymenttype.list)
      .subscribe(success => {
        this.loanrepaymenttype = success.data;
      }, error => { console.log(error); });

  }

  // addItem() {
  //   this.obj.detail.push({});
  // }

  // removeItem(i) {
  //   this.obj.detail.splice(i, 1);
  // }

  onConfirm() {
    this.obj.LoanID = this.loanapplication.find(item => this.obj.LoanApplicationID == item.id).FullName;
    this.obj.RepaymentSource = this.loanrepaymentsource.find(item => this.obj.RepaymentSourceID == item.id).RepaymentSource;
    this.obj.RepaymentType = this.loanrepaymenttype.find(item => this.obj.RepaymentTypeID == item.id).RepaymentType;
  }

  setAmount() {
    if (this.obj.RepaymentTypeID === '1') {
      this.obj.Amount = this.loanapplication.find(item => this.obj.LoanApplicationID === item.id).Balance;
      this.readonly = true;
    } else {
      this.obj.Amount = 0;
      this.readonly = false;
    }
  }

  processForm() {
    let url = loanUrl.loanrepayment.add;
    if (this.operation === 'Update') {
      url = loanUrl.loanrepayment.update;
    }
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.loanapplication = success.data;
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
    this.http.get(loanUrl.loanrepayment.get + '/' + id)
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
