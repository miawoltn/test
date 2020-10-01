
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: 'app-payrollledger',
  templateUrl: './payrollledger.component.html',
  styleUrls: ['./payrollledger.component.scss']
})
export class PayrollledgerComponent implements OnInit {

  displayedColumns: string[] = ['PayrollPeriod', 'CompanyName', 'PayingAccountID', 'LedgerDate'];
  data = [];
  obj = { PayrollPeriodID: null, CompanyID: null, PayingAccountID: null, LedgerDate: null };
  displayForm = false;
  operation = "Add";
  title = "Payrollledger";
  parent = "payroll";
  company = []; payrollperiod = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(payrollUrl.payrollledger.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(companyUrl.company.list)
      .subscribe(res => {
        this.company = res.data;
      }, error => { console.log(error) });
    this.http.get(payrollUrl.payrollperiod.list)
      .subscribe(res => {
        this.payrollperiod = res.data;
      }, error => { console.log(error) });

  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = payrollUrl.payrollledger.add;
    if (this.operation == "Update")
      url = payrollUrl.payrollledger.update;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetForm();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { PayrollPeriodID: null, CompanyID: null, PayingAccountID: null, LedgerDate: null };
    this.hideForm();
    this.operation = "Add";
  }
}
