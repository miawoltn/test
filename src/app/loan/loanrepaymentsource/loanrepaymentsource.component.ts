
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { loanUrl } from '../loan-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-loanrepaymentsource',
  templateUrl: './loanrepaymentsource.component.html',
  styleUrls: ['./loanrepaymentsource.component.scss']
})
export class LoanrepaymentsourceComponent implements OnInit {

  displayedColumns: string[] = ['RepaymentSourceID', 'RepaymentSource'];
  data = [];
  obj = { RepaymentSourceID: null, RepaymentSource: null };
  displayForm = false;
  operation = 'Add';
  title = 'Loan Repayment Source';
  parent = 'Loans';

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(loanUrl.loanrepaymentsource.list)
      .subscribe(res => {
        this.data = res.data;
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

  processForm() {
    let url = loanUrl.loanrepaymentsource.add;
    if (this.operation === 'Update') {
      url = loanUrl.loanrepaymentsource.update;
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

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { RepaymentSourceID: null, RepaymentSource: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
