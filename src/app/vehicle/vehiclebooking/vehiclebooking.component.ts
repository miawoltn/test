
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vehicleUrl } from '../vehicle-url';
import swal from 'sweetalert2';
import { employeeUrl } from 'src/app/employee/employee-url';
@Component({
  selector: 'app-vehiclebooking',
  templateUrl: './vehiclebooking.component.html',
  styleUrls: ['./vehiclebooking.component.scss']
})
export class VehiclebookingComponent implements OnInit {

  displayedColumns: string[] = ['FirstName', 'Make', 'NumberOfTravellers', 'DateFrom', 'DateTo', 'PickupTime', 'PickupAddress', 'DropoffAddress', 'Comment', 'RequestedBy', 'NextApprovingOfficerID', 'ApprovalStageID'];
  data = [];
  obj = { EmployeeID: null, VehicleID: null, NumberOfTravellers: null, DateFrom: null, DateTo: null, PickupTime: null, PickupAddress: null, DropoffAddress: null, Comment: null, RequestedBy: null, NextApprovingOfficerID: null, ApprovalStageID: null };
  displayForm = false;
  operation = "Add";
  title = "Vehicle Booking";
  parent = "Vehicle";
  employee = []; vehicle = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(vehicleUrl.vehiclebooking.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(employeeUrl.employee.list)
      .subscribe(res => {
        this.employee = res.data;
      }, error => { console.log(error) });
    this.http.get(vehicleUrl.vehicle.list)
      .subscribe(res => {
        this.vehicle = res.data;
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
    let url = vehicleUrl.vehiclebooking.add;
    if (this.operation == "Update")
      url = vehicleUrl.vehiclebooking.update;
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
    this.obj = { EmployeeID: null, VehicleID: null, NumberOfTravellers: null, DateFrom: null, DateTo: null, PickupTime: null, PickupAddress: null, DropoffAddress: null, Comment: null, RequestedBy: null, NextApprovingOfficerID: null, ApprovalStageID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
