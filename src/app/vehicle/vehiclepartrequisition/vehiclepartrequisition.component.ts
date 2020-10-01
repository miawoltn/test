
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vehicleUrl } from '../vehicle-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-vehiclepartrequisition',
  templateUrl: './vehiclepartrequisition.component.html',
  styleUrls: ['./vehiclepartrequisition.component.scss']
})
export class VehiclepartrequisitionComponent implements OnInit {

  displayedColumns: string[] = ['Make', 'VehiclePart', 'Quantity', 'Comment', 'RequestedBy', 'NextApprovingOfficer'];
  data = [];
  obj = { VehicleID: null, VehiclePartID: null, Quantity: null, Comment: null, RequestedBy: null, NextApprovingOfficer: null };
  displayForm = false;
  operation = "Add";
  title = "Vehicle Part Requisition";
  parent = "Vehicle";
  vehicle = []; vehiclepart = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(vehicleUrl.vehiclepartrequisition.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(vehicleUrl.vehicle.list)
      .subscribe(res => {
        this.vehicle = res.data;
      }, error => { console.log(error) });
    this.http.get(vehicleUrl.vehiclepart.list)
      .subscribe(res => {
        this.vehiclepart = res.data;
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
    let url = vehicleUrl.vehiclepartrequisition.add;
    if (this.operation == "Update")
      url = vehicleUrl.vehiclepartrequisition.update;
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
    this.obj = { VehicleID: null, VehiclePartID: null, Quantity: null, Comment: null, RequestedBy: null, NextApprovingOfficer: null };
    this.hideForm();
    this.operation = "Add";
  }
}
