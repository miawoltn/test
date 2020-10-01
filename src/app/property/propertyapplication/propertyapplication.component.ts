
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
import { paymentUrl } from 'src/app/payment/payment-url';
import { employeeUrl } from 'src/app/employee/employee-url';
@Component({
  selector: 'app-propertyapplication',
  templateUrl: './propertyapplication.component.html',
  styleUrls: ['./propertyapplication.component.scss']
})
export class PropertyapplicationComponent implements OnInit {

  displayedColumns: string[] = ['ApplicantSurname', 'PropertyName', 'ProjectID', 'PaymentAmount', 'InitialDeposit'];
  data = [];
  obj = { PropertyApplicantID: null, PropertyID: null, PropertyPaymentTypeID: null, PaymentAmount: null, InitialDeposit: null };
  displayForm = false;
  operation = "Add";
  title = "Property Application";
  parent = "Property";
  paymentplan = []; property = []; propertyapplicant = [];
  Employee: any;
  PropertyPaymentType: any;
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.propertyapplication.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(propertyUrl.property.list)
      .subscribe(success => {
        this.property = success.data;
      }, error => { console.log(error) });
    this.http.get(employeeUrl.employee.list)
      .subscribe(success => {
        this.Employee = success.data;
      }, error => { console.log(error) });
    this.http.get(propertyUrl.propertypaymenttype.list)
      .subscribe(success => {
        this.PropertyPaymentType = success.data;
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
    let url = propertyUrl.propertyapplication.add;
    if (this.operation == "Update")
      url = propertyUrl.propertyapplication.update;
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
    this.obj = { PropertyApplicantID: null, PropertyID: null, PropertyPaymentTypeID: null, PaymentAmount: null, InitialDeposit: null };
    this.hideForm();
    this.operation = "Add";
  }
}
