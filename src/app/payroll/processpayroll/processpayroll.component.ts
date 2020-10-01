
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-processpayroll',
  templateUrl: './processpayroll.component.html',
  styleUrls: ['./processpayroll.component.scss']
})
export class ProcesspayrollComponent implements OnInit {

  displayedColumns: string[] = ['PayrollPeriod'];
  data = [];
  obj = { PayrollPeriodID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Process Payroll';
  parent = 'Payroll';
  payrollperiod = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(payrollUrl.payrollperiod.unprocessed)
      .subscribe(res => {
        this.payrollperiod = res.data;
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
    let url = payrollUrl.payrollinstances.process;
    if (this.operation === 'Update') {
      url = payrollUrl.payrollinstances.update;
    }
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.payrollperiod = res.data;
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
    this.obj = { PayrollPeriodID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
