import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { periodsUrl } from '../periods-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-period',
  templateUrl: './period.component.html',
  styleUrls: ['./period.component.scss']
})
export class PeriodComponent implements OnInit {

  data = [];
  obj = { period_name: null, Description: null, date_from: null, date_to: null, periodType_id: null, year_id: null, periodStatus_id: null };
  displayForm = false;
  operation = "Add";
  title = "Period";
  periodtype = []; years = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(periodsUrl.period.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(periodsUrl.periodtype.list)
      .subscribe(success => {
        this.periodtype = success.data;
      }, error => { console.log(error); });
    this.http.get(periodsUrl.years.list)
      .subscribe(success => {
        this.years = success.data;
      }, error => { console.log(error); });

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
    let url = periodsUrl.period.add;
    if (this.operation === "Update") {
      url = periodsUrl.period.update;
      this.save(url);
    }
    else
      this.add(url);
    //e.preventDefault();
  }

  save(url) {
    this.http.put(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire("Process Complete", success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire("Process Unsuccessful", error.error.message, 'error');
      });
  }
  add(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire("Process Complete", success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire("Process Unsuccessful", error.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { period_name: null, Description: null, date_from: null, date_to: null, periodType_id: null, year_id: null, periodStatus_id: null };
    this.hideForm();
    this.operation = "Add";
  }
}
