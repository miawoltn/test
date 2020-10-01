import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from 'src/app/leave/leave-url';
import swal from 'sweetalert2';
import { ActivatedRoute, Router } from '@angular/router';
import { employeeUrl } from 'src/app/employee/employee-url';
import { approvalUrl } from 'src/app/approval/approval-url';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-resumption-approval',
  templateUrl: './resumption-approval.component.html',
  styleUrls: ['./resumption-approval.component.css']
})
export class ResumptionApprovalComponent implements OnInit {

  isEditable = true;
  isLinear = true;
  data = [];
  obj = {
    LeaveResumptionID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null,
    Comment: null, ProcessModuleID: null, ApprovalInstancesID: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'Leave Approval';
  parent = 'Leave';
  leaveId: any;
  leaveInfo = {
    Employee: null, DateBack: null, LeaveApplicationID: null, LeaveType: null, DateFrom: null,
    LeaveTypeID: null, YearID: null, ApprovalOfficerID: null,
    ApprovalStageID: null, PayLeaveGrant: null, NoDayApplied: null, RelieveOfficerID: null, RelieveOfficer: null, DepartmentID: null,
    ContactAddress: null, handover: null, LeaveResumptionID: null, DateTo: null, ResumptionDate: null
  };
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
    this.obj.LeaveResumptionID = this.leaveId;
  }

  ngOnInit() {
    this.user_name = this.auth.getUserInfo();
    this.http.get(leaveUrl.leaveresumption.get + '/' + this.leaveId)
      .subscribe(res => {
        console.log(res.data);
        this.leaveInfo = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leaveresumptionapproval.history + '/' + this.leaveId)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(employeeUrl.employee.supervisors)
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
    let url = leaveUrl.leaveresumptionapproval.add;
    if (this.operation === 'Update') {
      url = leaveUrl.leaveresumptionapproval.update;
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
      LeaveResumptionID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null, Comment: null,
      ProcessModuleID: null, ApprovalInstancesID: null
    };
    // this.hideForm();
    // this.operation = "Add";
  }
}
