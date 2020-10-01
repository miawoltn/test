
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { loanUrl } from '../loan-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-loanrepaymenttype',
  templateUrl: './loanrepaymenttype.component.html',
  styleUrls: ['./loanrepaymenttype.component.scss']
})
export class LoanrepaymenttypeComponent implements OnInit {

  displayedColumns: string[] = ['RepaymentTypeID', 'RepaymentType'];
  data = [];
  obj = { RepaymentTypeID: null, RepaymentType: null };
  displayForm = false;
  operation = 'Add';
  title = 'Loan Repayment Types';
  parent = 'Loans';

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(loanUrl.loanrepaymenttype.list)
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
    let url = loanUrl.loanrepaymenttype.add;
    if (this.operation === 'Update') {
      url = loanUrl.loanrepaymenttype.update;
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
    this.obj = { RepaymentTypeID: null, RepaymentType: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
