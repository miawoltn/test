import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-processpayroll',
  templateUrl: './process-payroll.component.html',
  styleUrls: ['./process-payroll.component.scss']
})
export class Processpayroll2Component implements OnInit {

  displayedColumns: string[] = ['PayrollPeriod'];
  data = [];
  obj = { PayrollPeriodID: null, PayrollID: null };
  obj2 = { PayrollPeriodID: null, PayrollID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Process Payroll';
  parent = 'Payroll';
  payrollperiod = [];
  payrollperiod2 = [];
  pivotGridDataSource: any;
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    swal.showLoading();
    this.http.get(payrollUrl.payrollperiod.unprocessed)
      .subscribe(success => {
        this.payrollperiod = success.data;
        swal.close();
      }, error => { console.log(error); });

    this.http.get(payrollUrl.payrollperiod.processed)
      .subscribe(success => {
        this.payrollperiod2 = success.data;
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
    const url = payrollUrl.payrollinstances.process;
    this.save(url, 1, this.obj);
  }

  processForm2() {
    const url = payrollUrl.payrollinstances.cancel;
    this.save(url, 2, this.obj2);
  }

  processForm3() {
    const url = payrollUrl.payrollgenerated.details;
    this.save(url, 3, this.obj);
  }

  save(url, id, data) {
    this.http.post(url, data)
      .subscribe(success => {
        if (id !== 3) {
          this.payrollperiod = success.data.unprocessed;
          this.payrollperiod2 = success.data.processed;
          this.data = success.data.data;
          this.resetForm();
          this.loadReport();
        } else if (id === 3) {
          this.data = success.data;
          this.loadReport();
        }
        swal.fire('Process Complete', success.message, 'success');

      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }

  loadReport() {
    this.pivotGridDataSource = {
      fields: [{
        caption: 'Employee Name',

        dataField: 'FullName',
        area: 'row',
        expanded: true,
        width: '200'
        // sortBySummaryField: "Total"
      },
      {
        dataField: 'SalaryType',
        area: 'column',
        expanded: true,
        sortOrder: 'desc',


      },
      {
        dataField: 'SalaryComponent',
        area: 'column',
        expanded: true,
        sortBy: 'none'
      },
      {
        caption: 'Amount',
        dataField: 'Amount',
        dataType: 'number',
        summaryType: 'sum',
        area: 'data',
        format: {
          type: 'fixedPoint',
          precision: 2
        },
      }
      ],
      store: this.data
    };
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { PayrollPeriodID: null, PayrollID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
