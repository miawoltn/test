
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
import { paymentUrl } from 'src/app/payment/payment-url';
@Component({
  selector: 'app-propertyallocation',
  templateUrl: './propertyallocation.component.html',
  styleUrls: ['./propertyallocation.component.scss']
})
export class PropertyallocationComponent implements OnInit {

  displayedColumns: string[] = ['PropertyApplicantID', 'AllocationDate', 'Comments', 'SubscriberInfoID', 'PropertyID', 'PropertyAmount', 'AmountReceived', 'BalanceAmount', 'PaymentMethodID', 'PaymentDate'];
  data = [];
  obj = { PropertyApplicationID: null, AllocationDate: null, Comments: null, SubscriberInfoID: null, PropertyID: null, PropertyAmount: null, AmountReceived: null, BalanceAmount: null, PaymentMethodID: null, PaymentDate: null };
  displayForm = false;
  operation = "Add";
  title = "Propertyallocation";
  parent = "property";
  propertyapplication = [];
  PropertyApplicationInfo: any;
  PaymentMethod: any;
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.propertyallocation.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(propertyUrl.propertyapplication.list)
      .subscribe(success => {
        this.propertyapplication = success.data;
      }, error => { console.log(error) });
    this.http.get(paymentUrl.paymentmethod.list)
      .subscribe(success => {
        this.PaymentMethod = success.data;
      }, error => { console.log(error) });
  }

  fetchApplicationPropertyInfo(e) {
    swal.showLoading();
    this.http.get(propertyUrl.propertyapplication.get + e.id)
      .subscribe(success => {
        swal.hideLoading()
        console.log(success.data)
        this.PropertyApplicationInfo = success.data;
        this.obj.PropertyID = this.PropertyApplicationInfo.PropertyID
        this.obj.PropertyAmount = this.PropertyApplicationInfo.PaymentAmount
        this.obj.AmountReceived = this.PropertyApplicationInfo.InitialDeposit
        this.obj.BalanceAmount = this.PropertyApplicationInfo.PaymentAmount - this.PropertyApplicationInfo.InitialDeposit
        this.obj.PaymentDate = this.PropertyApplicationInfo.DateCreated
        // this.propertyapplication = success.data;
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
    let url = propertyUrl.propertyallocation.add;
    if (this.operation == "Update")
      url = propertyUrl.propertyallocation.update;
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
    this.obj = this.data.find(item => item.id == id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { PropertyApplicationID: null, AllocationDate: null, Comments: null, SubscriberInfoID: null, PropertyID: null, PropertyAmount: null, AmountReceived: null, BalanceAmount: null, PaymentMethodID: null, PaymentDate: null };
    this.hideForm();
    this.operation = "Add";
  }
}
