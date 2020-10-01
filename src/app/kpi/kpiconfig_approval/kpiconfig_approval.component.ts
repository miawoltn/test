import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-kpiconfig_approval',
  templateUrl: './kpiconfig_approval.component.html',
  styleUrls: ['./kpiconfig_approval.component.scss']
})
export class KpiconfigApprovalComponent implements OnInit {

  data = [];
  obj = { kpi_id: null, approve_id: null, date_approve: null, time_approve: null, approve_by: null, comments: null, transID: null, config_id: null, nextapprovingofficer: null };
  displayForm = false;
  operation = "Add";
  title = "KPI Config Approval";
  kpiconfig = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(kpiUrl.kpiconfig_approval.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpiconfig.list)
      .subscribe(success => {
        this.kpiconfig = success.data;
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
    let url = kpiUrl.kpiconfig_approval.add;
    if (this.operation == "Update") {
      url = kpiUrl.kpiconfig_approval.update;
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
    this.obj = this.data.find(item => item.id == id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { kpi_id: null, approve_id: null, date_approve: null, time_approve: null, approve_by: null, comments: null, transID: null, config_id: null, nextapprovingofficer: null };
    this.hideForm();
    this.operation = "Add";
  }
}
