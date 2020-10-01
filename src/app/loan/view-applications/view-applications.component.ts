import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { loanUrl } from '../loan-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-view-applications',
  templateUrl: './view-applications.component.html',
  styleUrls: ['./view-applications.component.css']
})
export class ViewApplicationsComponent implements OnInit {

  data = [];
  obj = {
    LoanID: null, LoanDate: null, LoanTypeID: null, Amount: null, InterestRate: null, Tenor: null,
    RepaymentAmount: null, ApprovalStageID: null, ApprovingOfficer: null, LoanStatusID: null, ApprovalStagesID: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'Loan Applications';
  parent = 'Loans';
  repayments = [];
  history = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(loanUrl.loanapplication.mine)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(loanUrl.loanrepayment.list)
      .subscribe(res => {
        this.repayments = res.data;
      }, err => { console.log(err); });

    this.http.get(loanUrl.loanapproval.list)
      .subscribe(res => {
        this.history = res.data;
      }, err => { console.log(err); });


  }
  customizeItemTemplate(item: any) {
    item.template = 'formItem';
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
    let url = loanUrl.loanapplication.add;
    if (this.operation === 'Update') {
      url = loanUrl.loanapplication.update;
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
      });

  }

  getApprovalHistoryData(id): any {
    // return this.history;
    console.log(id);
    return this.history.filter(item => item.LoanApplicationID == id);
  }

  getRepaymentHistoryData(id): any {
    // return this.repayments;
     return this.repayments.filter(item => item.LoanApplicationID == id);
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      LoanID: null, LoanDate: null, LoanTypeID: null, Amount: null, InterestRate: null, Tenor: null,
      RepaymentAmount: null, ApprovalStageID: null, ApprovingOfficer: null, LoanStatusID: null, ApprovalStagesID: null
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
