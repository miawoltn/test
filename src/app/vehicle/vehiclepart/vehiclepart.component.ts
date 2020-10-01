
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vehicleUrl } from '../vehicle-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-vehiclepart',
  templateUrl: './vehiclepart.component.html',
  styleUrls: ['./vehiclepart.component.scss']
})
export class VehiclepartComponent implements OnInit {

  displayedColumns: string[] = ['VehiclePart', 'Brand', 'BrandRef', 'OEM', 'Cost', 'CustomDuty', 'Transport', 'Quantity', 'CreatedBt'];
  data = [];
  obj = { VehiclePart: null, Brand: null, BrandRef: null, OEM: null, Cost: null, CustomDuty: null, Transport: null, Quantity: null, CreatedBt: null };
  displayForm = false;
  operation = "Add";
  title = "Vehicle Part";
  parent = "Vehicle";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(vehicleUrl.vehiclepart.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });

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
    let url = vehicleUrl.vehiclepart.add;
    if (this.operation == "Update")
      url = vehicleUrl.vehiclepart.update;
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
    this.obj = { VehiclePart: null, Brand: null, BrandRef: null, OEM: null, Cost: null, CustomDuty: null, Transport: null, Quantity: null, CreatedBt: null };
    this.hideForm();
    this.operation = "Add";
  }
}
