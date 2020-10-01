
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-payrollinstances',
  templateUrl: './payrollinstances.component.html',
  styleUrls: ['./payrollinstances.component.scss']
})
export class PayrollinstancesComponent implements OnInit {

  displayedColumns: string[] = ['PayrollPeriodID', 'InstanceTypeID', 'GeneratedBy', 'DateGenerated'];
  data = [];
  obj = { PayrollPeriodID: null, InstanceTypeID: null, GeneratedBy: null, DateGenerated: null };
  displayForm = false;
  operation = 'Add';
  title = 'Payrollinstances';
  parent = 'payroll';
  PayrollPeriod = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(payrollUrl.payrollinstances.list)
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
    let url = payrollUrl.payrollinstances.add;
    if (this.operation === 'Update') {
      url = payrollUrl.payrollinstances.update;
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
    this.obj = { PayrollPeriodID: null, InstanceTypeID: null, GeneratedBy: null, DateGenerated: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
