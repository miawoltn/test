
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vehicleUrl } from '../vehicle-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-vehicle',
  templateUrl: './vehicle.component.html',
  styleUrls: ['./vehicle.component.scss']
})
export class VehicleComponent implements OnInit {

  displayedColumns: string[] = ['Make', 'Model', 'Type', 'Year', 'InitialMileage', 'EngineTypeID', 'HorsePower', 'Color', 'VIN', 'LicensePlateNumber', 'inService'];
  data = [];
  obj = { Make: null, Model: null, Type: null, Year: null, InitialMileage: null, EngineTypeID: null, HorsePower: null, Color: null, VIN: null, LicensePlateNumber: null, inService: null };
  displayForm = false;
  operation = "Add";
  title = "Vehicle";
  parent = "Vehicle";
  EngineType: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(vehicleUrl.vehicle.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(vehicleUrl.enginetype.list)
      .subscribe(res => {
        this.EngineType = res.data;
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
    let url = vehicleUrl.vehicle.add;
    if (this.operation == "Update")
      url = vehicleUrl.vehicle.update;
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
    this.obj = { Make: null, Model: null, Type: null, Year: null, InitialMileage: null, EngineTypeID: null, HorsePower: null, Color: null, VIN: null, LicensePlateNumber: null, inService: null };
    this.hideForm();
    this.operation = "Add";
  }
}
