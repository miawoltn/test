import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import swal from 'sweetalert2';
import { GenericService } from 'src/app/services/generic.service';
@Component({
  selector: 'app-kpi-type',
  templateUrl: './kpi_type.component.html',
  styleUrls: ['./kpi_type.component.scss']
})
export class KpiTypeComponent implements OnInit {

  data = [];
  statuses = [];
  yesNo = [];
  obj = { kpitype: null, ActiveID: null, visible: null, kpiclass_id: null };
  displayForm = false;
  operation = 'Add';
  title = 'KPI Type';
  kpiclass = [];
  constructor(protected http: HttpService, protected generics: GenericService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpi_type.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpiclass.list)
      .subscribe(success => {
        this.kpiclass = success.data;
      }, error => { console.log(error); });
    this.generics.getStatus()
      .subscribe(success => {
        this.statuses = success;
      }, error => { console.log(error); });

    this.generics.getYesNo()
      .subscribe(success => {
        this.yesNo = success;
      }, error => { console.log(error); });

  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = kpiUrl.kpi_type.add;
    if (this.operation === 'Update') {
      url = kpiUrl.kpi_type.update;
      this.save(url);
    }
    else {
      this.add(url);
    }
    // e.preventDefault();
  }

  save(url) {
    this.http.put(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire('Process Complete', success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }
  add(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire('Process Complete', success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { kpitype: null, ActiveID: null, visible: null, kpiclass_id: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
