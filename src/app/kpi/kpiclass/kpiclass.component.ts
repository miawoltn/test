import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import swal from 'sweetalert2';
import { GenericService } from 'src/app/services/generic.service';
@Component({
  selector: 'app-kpiclass',
  templateUrl: './kpiclass.component.html',
  styleUrls: ['./kpiclass.component.scss']
})
export class KpiclassComponent implements OnInit {

  data = [];
  statuses = [];
  obj = { kpiclass: null, ActiveID: null };
  displayForm = false;
  operation = 'Add';
  title = 'KPI Classification';

  constructor(protected http: HttpService, protected generics: GenericService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpiclass.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });

    this.generics.getStatus()
      .subscribe(success => {
        this.statuses = success;
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
    let url = kpiUrl.kpiclass.add;
    if (this.operation === 'Update') {
      url = kpiUrl.kpiclass.update;
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
    this.obj = { kpiclass: null, ActiveID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
