
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import swal from 'sweetalert2';
import { Router, ActivatedRoute } from '@angular/router';
import { payrollUrl } from 'src/app/payroll/payroll-url';
import { employeeUrl } from 'src/app/employee/employee-url';
import { MatStepper } from '@angular/material/stepper';

@Component({
  selector: 'app-new-resumption',
  templateUrl: './new-resumption.component.html',
  styleUrls: ['./new-resumption.component.css']
})
export class NewResumptionComponent implements OnInit {

  isEditable = true;
  isLinear = true;
  data = [];
  years = [];
  supervisors = [];
  approver = [];
  obj = {
    EmployeeID: null, DateFrom: null, DateBack: null, LeaveTypeID: null, YearID: null, ApprovalOfficerID: null,
    ApprovalStageID: null, PayLeaveGrant: null, NoDayApplied: null, RelieveOfficerID: null, DepartmentID: null,
    ContactAddress: null, handover: null, LeaveApplicationID: null, LeaveType: null, ResumptionDate: null,
    RelieveOfficer: null
  };
  obj2 = {
    EmployeeID: null, DateFrom: null, DateBack: null, LeaveType: null, YearName: null, ApprovalOfficerName: null,
    ApprovalStageID: null, PayLeaveGrantName: null, NoDayApplied: null, RelieveOfficerName: null, DepartmentID: null,
    ContactAddress: null, handover: null, RelieveOfficer: null
  };
  displayForm = false;
  operation = 'Submit Application';
  title = 'Leave Resumption Application';
  parent = 'Leave';
  LeaveTypes: any;
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];
  reliever = [];
  @ViewChild('stepper' ,{ static: true }) stepper: MatStepper;
  id;
  constructor(
    protected http: HttpService,
    private router: Router, public route: ActivatedRoute
  ) {
    this.id = this.route.snapshot.params.id;
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveapplication.employee_request)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leaveapplication.get + this.id)
      .subscribe(res => {
        this.obj = res.data;
      }, err => { console.log(err); });

    this.http.get(employeeUrl.employee.supervisors)
      .subscribe(res => {
        this.approver = res.data;
      }, err => { console.log(err); });

  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  onConfirm() {
    this.obj2.ApprovalOfficerName = this.approver.find(i => i.id === this.obj.ApprovalOfficerID).FullName;
    this.obj2.LeaveType = this.LeaveTypes.find(i => i.id === this.obj.LeaveTypeID).LeaveType;
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    // this.resetForm();
    this.showForm();
  }

  processForm() {
    const url = leaveUrl.leaveresumption.add;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        // this.resetForm();
        this.isEditable = false;
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
}
