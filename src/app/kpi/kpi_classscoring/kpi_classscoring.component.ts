import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import { periodsUrl } from 'src/app/periods/periods-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-kpi-classscoring',
  templateUrl: './kpi_classscoring.component.html',
  styleUrls: ['./kpi_classscoring.component.scss']
})
export class KpiClassscoringComponent implements OnInit {

  data = [];
  obj = { period_id: null, percentage: null, posted_by: null, posted_date: null, supervisortypeID: null, kpiclass_id: null };
  displayForm = false;
  operation = 'Add';
  title = 'KPI Class Scoring';
  kpiclass = []; period = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpi_classscoring.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpiclass.list)
      .subscribe(success => {
        this.kpiclass = success.data;
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
    let url = kpiUrl.kpi_classscoring.add;
    if (this.operation === 'Update') {
      url = kpiUrl.kpi_classscoring.update;
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
    this.obj = { period_id: null, percentage: null, posted_by: null, posted_date: null, supervisortypeID: null, kpiclass_id: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
