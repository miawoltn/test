
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vehicleUrl } from '../vehicle-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-vehicleincomecategory',
  templateUrl: './vehicleincomecategory.component.html',
  styleUrls: ['./vehicleincomecategory.component.scss']
})
export class VehicleincomecategoryComponent implements OnInit {

  displayedColumns: string[] = ['VehicleIncomeCategory', 'Amount'];
  data = [];
  obj = { VehicleIncomeCategory: null, Amount: null };
  displayForm = false;
  operation = "Add";
  title = "Vehicle Income Category";
  parent = "Vehicle";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(vehicleUrl.vehicleincomecategory.list)
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
    let url = vehicleUrl.vehicleincomecategory.add;
    if (this.operation == "Update")
      url = vehicleUrl.vehicleincomecategory.update;
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
    this.obj = { VehicleIncomeCategory: null, Amount: null };
    this.hideForm();
    this.operation = "Add";
  }
}
