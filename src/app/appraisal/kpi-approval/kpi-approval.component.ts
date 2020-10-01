
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute, Router } from '@angular/router';
import { approvalUrl } from 'src/app/approval/approval-url';
import { AuthService } from 'src/app/services/auth.service';
import { kpiUrl } from 'src/app/kpi/kpi-url';

@Component({
  selector: 'app-kpi-approval',
  templateUrl: './kpi-approval.component.html',
  styleUrls: ['./kpi-approval.component.scss']
})
export class KpiApprovalComponent implements OnInit {
  isEditable = true;
  isLinear = true;
  data = [];
  detail = [];
  obj = {
    ConfigID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null, Comment: null,
    ProcessModuleID: null, ApprovalInstancesID: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'KPI Approval';
  parent = 'Appraisal';
  leaveId: any;
  leaveInfo = { period_name: null, FullName: null, DesignationName: null, WorkLocation: null, DepartmentName: null };
  Employee: any;
  ApprovalInstances: any;
  user_name = '';
  show = true;
  isRequired = true;

  constructor(
    protected http: HttpService,
    private route: ActivatedRoute,
    private router: Router, public auth: AuthService
  ) {
    this.leaveId = this.route.snapshot.params.id;
    // this.loadItem = this.loadItem.bind(this);
    this.obj.ConfigID = this.leaveId;
  }


  ngOnInit() {
    this.user_name = this.auth.getUserInfo();
    this.http.get(kpiUrl.kpiconfig.get + '/' + this.leaveId)
      .subscribe(res => {
        console.log(res.data);
        this.leaveInfo = res.data;
      }, err => { console.log(err); });

    this.http.get(kpiUrl.kpiconfig_approval.history + '/' + this.leaveId)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(kpiUrl.kpiconfig.detail + '/' + this.leaveId)
      .subscribe(res => {
        this.detail = res.data;
      }, err => { console.log(err); });


    this.http.get(kpiUrl.employees.supervisors)
      .subscribe(res => {
        console.log(res.data);
        this.Employee = res.data;
      }, err => { console.log(err); });

    this.http.get(approvalUrl.approvalinstances.getApprovalInstances)
      .subscribe(res => {
        console.log(res.data);
        this.ApprovalInstances = res.data;
      }, err => { console.log(err); });

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
    let url = kpiUrl.kpiconfig_approval.add;
    if (this.operation === 'Update') {
      url = kpiUrl.kpiconfig_approval.update;
    }
    this.save(url);
  }

  loadEvent(data) {
    if (data.ApprovalTypeID == 1) {
      this.show = true;
      this.isRequired = true;
    } else {
      this.show = false;
      this.isRequired = false;
    }

  }

  save(url) {
    console.log(this.obj);
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        // this.resetForm();
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      ConfigID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null, Comment: null,
      ProcessModuleID: null, ApprovalInstancesID: null
    };
    // this.hideForm();
    // this.operation = "Add";
  }
}

