
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vehicleUrl } from '../vehicle-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-vehicleexpensetransactions',
  templateUrl: './vehicleexpensetransactions.component.html',
  styleUrls: ['./vehicleexpensetransactions.component.scss']
})
export class VehicleexpensetransactionsComponent implements OnInit {

  displayedColumns: string[] = ['Make', 'VehicleExpenseCategory', 'Comment'];
  data = [];
  obj = { VehicleID: null, VehicleExpenseCategoryID: null, Comment: null };
  displayForm = false;
  operation = "Add";
  title = "Vehicle Expense Transactions";
  parent = "Vehicle";
  vehicle = []; vehicleexpensecategory = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(vehicleUrl.vehicleexpensetransactions.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(vehicleUrl.vehicle.list)
      .subscribe(res => {
        this.vehicle = res.data;
      }, error => { console.log(error) });
    this.http.get(vehicleUrl.vehicleexpensecategory.list)
      .subscribe(res => {
        this.vehicleexpensecategory = res.data;
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
    let url = vehicleUrl.vehicleexpensetransactions.add;
    if (this.operation == "Update")
      url = vehicleUrl.vehicleexpensetransactions.update;
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
    this.obj = { VehicleID: null, VehicleExpenseCategoryID: null, Comment: null };
    this.hideForm();
    this.operation = "Add";
  }
}
