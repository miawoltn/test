
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { loanUrl } from '../loan-url';
import swal from 'sweetalert2';
import { salaryUrl } from 'src/app/salary/salary-url';
@Component({
  selector: 'app-loantypes',
  templateUrl: './loantypes.component.html',
  styleUrls: ['./loantypes.component.scss']
})
export class LoantypesComponent implements OnInit {

  data = [];
  obj = { LoanType: null, SalaryComponentID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Loan Types';
  parent = 'Loan';
  SalaryComponents = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(loanUrl.loantypes.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });
    this.http.get(salaryUrl.salarycomponents.list)
      .subscribe(res => {
        this.SalaryComponents = res.data.filter(item => item.SalaryTypeID == 2);
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
    let url = loanUrl.loantypes.add;
    if (this.operation === 'Update') {
      url = loanUrl.loantypes.update;
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
    this.obj = { LoanType: null, SalaryComponentID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
