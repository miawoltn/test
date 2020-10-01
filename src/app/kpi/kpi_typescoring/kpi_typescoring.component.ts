import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import { periodsUrl } from 'src/app/periods/periods-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-kpi-typescoring',
  templateUrl: './kpi_typescoring.component.html',
  styleUrls: ['./kpi_typescoring.component.scss']
})
export class KpiTypescoringComponent implements OnInit {

  data = [];
  obj = { period_id: null, kpitype_id: null, percentage: null, posted_by: null, posted_date: null, supervisortypeID: null };
  displayForm = false;
  operation = 'Add';
  title = 'KPI Type Scoring';
  kpi_type = []; period = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpi_typescoring.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpi_type.list)
      .subscribe(success => {
        this.kpi_type = success.data;
      }, error => { console.log(error); });
    this.http.get(periodsUrl.period.list)
      .subscribe(success => {
        this.period = success.data;
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
    let url = kpiUrl.kpi_typescoring.add;
    if (this.operation === 'Update') {
      url = kpiUrl.kpi_typescoring.update;
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
    this.obj = { period_id: null, kpitype_id: null, percentage: null, posted_by: null, posted_date: null, supervisortypeID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
