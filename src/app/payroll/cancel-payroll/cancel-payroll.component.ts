import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';

@Component({
  selector: 'app-cancel-payroll',
  templateUrl: './cancel-payroll.component.html',
  styleUrls: ['./cancel-payroll.component.css']
})
export class CancelPayrollComponent implements OnInit {

  data = [];
  obj = { PayrollPeriodID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Cancel Payroll';
  parent = 'payroll';
  payrollperiod = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    swal.showLoading();

    this.http.get(payrollUrl.payrollperiod.processed)
      .subscribe(success => {
        this.payrollperiod = success.data;
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
    const url = payrollUrl.payrollinstances.cancel;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.payrollperiod = success.data;
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
    this.obj = { PayrollPeriodID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
