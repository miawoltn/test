import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { periodsUrl } from 'src/app/periods/periods-url';
import swal from 'sweetalert2';
import { kpiUrl } from 'src/app/kpi/kpi-url';
import { appraisalUrl } from 'src/app/appraisal/appraisal-url';
import { Router } from '@angular/router';

@Component({
  selector: 'app-kpi-for-approval',
  templateUrl: './kpi-for-approval.component.html',
  styleUrls: ['./kpi-for-approval.component.scss']
})
export class KpiForApprovalComponent implements OnInit {
  data = [];
  obj = {
    period_id: null, employee_id: null, depunit_id: null, designation_id: null, posted_by: null,
    date_posted: null, transID: null, approvalStage_id: null, approving_officer: null, exceptflagID: null, work_id: null,
    department_id: null
  };
  displayForm = false;
  operation = 'Forward for Approval';
  title = '';
  period = [];
  employees = [];
  kpi_types = [];
  kpi_type = []; kpiclass = [];
  constructor(protected http: HttpService, public router: Router) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpiconfig.getEmp)
      .subscribe(success => {
        this.obj = success.data;
      }, error => { console.log(error); });

    this.http.get(kpiUrl.employees.supervisors)
      .subscribe(success => {
        this.employees = success.data;
      }, error => { console.log(error); });
    this.http.get(appraisalUrl.kpi.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpi_type.list)
      .subscribe(success => {
        this.kpi_types = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpiclass.list)
      .subscribe(success => {
        this.kpiclass = success.data;
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
    let url = kpiUrl.kpiconfig.add;
    url = kpiUrl.kpiconfig.update;
    this.save(url);
  }

  save(url) {
    this.http.put(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire('Process Complete', success.message, 'success');
        // this.resetForm();
        this.router.navigate(['/appraisal/kpi']);
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
    this.obj = {
      period_id: null, employee_id: null, depunit_id: null, designation_id: null,
      posted_by: null, date_posted: null, transID: null, approvalStage_id: null, approving_officer: null,
      exceptflagID: null, work_id: null, department_id: null
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
