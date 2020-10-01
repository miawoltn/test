
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { paymentUrl } from '../payment-url';
import swal from 'sweetalert2';
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.scss']
})
export class PaymentComponent implements OnInit {

  displayedColumns: string[] = ['PVNumber', 'CompanyName', 'PayingAccountID', 'PaymentMethod', 'ChequeNo', 'PaymentDate', 'PaymentType', 'PayeeID'];
  data = [];
  obj = { PVNumber: null, CompanyID: null, PayingAccountID: null, PaymentMethodID: null, ChequeNo: null, PaymentDate: null, PaymentTypeID: null, VATID: null, WHTID: null, PayeeID: null };
  displayForm = false;
  operation = "Add";
  title = "Payment";
  parent = "payment";
  company = []; paymentmethod = []; paymenttype = []; vat = []; wht = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(paymentUrl.payment.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(paymentUrl.paymentmethod.list)
      .subscribe(res => {
        this.paymentmethod = res.data;
      }, error => { console.log(error) });
    this.http.get(paymentUrl.paymenttype.list)
      .subscribe(res => {
        this.paymenttype = res.data;
      }, error => { console.log(error) });
    this.http.get(companyUrl.company.list)
      .subscribe(res => {
        this.company = res.data;
      }, error => { console.log(error) });
    // this.http.get(Url.vat.list)
    //   .subscribe(res => {
    //     this.vat = res.data;
    //   }, error => { console.log(error) });
    // this.http.get(Url.wht.list)
    //   .subscribe(res => {
    //     this.wht = res.data;
    //   }, error => { console.log(error) });

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
    let url = paymentUrl.payment.add;
    if (this.operation == "Update")
      url = paymentUrl.payment.update;
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
    this.obj = { PVNumber: null, CompanyID: null, PayingAccountID: null, PaymentMethodID: null, ChequeNo: null, PaymentDate: null, PaymentTypeID: null, VATID: null, WHTID: null, PayeeID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
