import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import { periodsUrl } from 'src/app/periods/periods-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-kpiconfig',
  templateUrl: './kpiconfig.component.html',
  styleUrls: ['./kpiconfig.component.scss']
})
export class KpiconfigComponent implements OnInit {

  data = [];
  obj = { period_id: null, employee_id: null, depunit_id: null, designation_id: null, posted_by: null, date_posted: null, transID: null, approvalStage_id: null, approving_officer: null, exceptflagID: null, work_id: null, department_id: null };
  displayForm = false;
  operation = 'Add';
  title = 'KPI Config';
  period = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpiconfig.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(periodsUrl.period.list)
      .subscribe(success => {
        this.period = success.data;
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
    let url = kpiUrl.kpiconfig.add;
    if (this.operation == 'Update') {
      url = kpiUrl.kpiconfig.update;
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
    this.obj = this.data.find(item => item.id == id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { period_id: null, employee_id: null, depunit_id: null, designation_id: null, posted_by: null, date_posted: null, transID: null, approvalStage_id: null, approving_officer: null, exceptflagID: null, work_id: null, department_id: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
