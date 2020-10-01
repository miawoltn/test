
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';
import { payrollUrl } from 'src/app/payroll/payroll-url';
import { employeeUrl } from 'src/app/employee/employee-url';
import { MatStepper } from '@angular/material/stepper';
@Component({
  selector: 'app-leaveapplication',
  templateUrl: './leaveapplication.component.html',
  styleUrls: ['./leaveapplication.component.scss']
})
export class LeaveapplicationComponent implements OnInit {

  isEditable = true;
  isLinear = true;
  data = [];
  years = [];
  supervisors = [];
  halfDay = false;
  approver = [];
  obj = {
    EmployeeID: null, DateFrom: null, DateBack: null, LeaveTypeID: null, YearID: null, ApprovalOfficerID: null,
    ApprovalStageID: null, PayLeaveGrant: null, NoDayApplied: null, RelieveOfficerID: null, DepartmentID: null,
    ContactAddress: null, handover: null, reason: null
  };
  obj2 = {
    EmployeeID: null, DateFrom: null, DateBack: null, LeaveTypeName: null, YearName: null, ApprovalOfficerName: null,
    ApprovalStageID: null, PayLeaveGrantName: null, NoDayApplied: null, RelieveOfficerName: null, DepartmentID: null,
    ContactAddress: null, handover: null, reason: null
  };
  displayForm = false;
  operation = 'Submit Application';
  title = 'Leave Application';
  parent = 'Leave';
  LeaveTypes: any;
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];
  reliever = [];
  @ViewChild('stepper', { static: true }) stepper: MatStepper;

  constructor(
    protected http: HttpService,
    private router: Router
  ) {
    this.loadItem = this.loadItem.bind(this);
    this.loadLeave = this.loadLeave.bind(this);
    this.resume = this.resume.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveapplication.employee_request)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leavetype.list)
      .subscribe(res => {
        this.LeaveTypes = res.data;
      }, err => { console.log(err); });

    this.http.get(payrollUrl.payrollyear.list)
      .subscribe(res => {
        this.years = res.data;
      }, err => { console.log(err); });
    this.http.get(employeeUrl.employee.supervisors)
      .subscribe(res => {
        this.approver = res.data;
      }, err => { console.log(err); });
    this.http.get(employeeUrl.employee.relievers)
      .subscribe(res => {
        this.reliever = res.data;
      }, err => { console.log(err); });
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  onConfirm() {
    this.obj2.ApprovalOfficerName = this.approver.find(i => i.id === this.obj.ApprovalOfficerID).FullName;
    this.obj2.PayLeaveGrantName = this.choices.find(i => i.value === this.obj.PayLeaveGrant).label;
    this.obj2.RelieveOfficerName = this.reliever.find(i => i.id === this.obj.RelieveOfficerID).FullName;
    this.obj2.LeaveTypeName = this.LeaveTypes.find(i => i.id === this.obj.LeaveTypeID).LeaveType;
    this.obj2.YearName = this.years.find(i => i.id === this.obj.YearID).YearName;
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    const url = leaveUrl.leaveapplication.add;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        this.resetForm();
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
        this.stepper.previous();
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  loadLeave(id) {
    // console.log(id.row.data.id);
    const leaveId = id.row.data.id;
    this.router.navigate(['leave/view', leaveId]);
    // this.obj = this.data.find(item => item.id === id.row.data.id);
    // this.operation = "Update";
    // this.showForm();
  }

  resume(id) {
    // console.log(id.row.data.id);
    const leaveId = id.row.data.id;
    this.router.navigate(['leave/resumption', leaveId]);
  }

  resetForm() {
    this.obj = {
      EmployeeID: null, DateFrom: null, DateBack: null, LeaveTypeID: null, YearID: null, ApprovalOfficerID: null,
      ApprovalStageID: null, PayLeaveGrant: null, NoDayApplied: null, RelieveOfficerID: null, DepartmentID: null,
      ContactAddress: null, handover: null, reason: null
    };
    this.hideForm();
    this.operation = 'Submit Application';
  }

  CheckLeaveType(data) {
    this.halfDay = false;
    if (data.dayValue === '0.5') {
      this.halfDay = true;
    }
  }
}
