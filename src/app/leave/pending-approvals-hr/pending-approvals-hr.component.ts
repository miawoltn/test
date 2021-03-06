import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';
import { payrollUrl } from 'src/app/payroll/payroll-url';
import { employeeUrl } from 'src/app/employee/employee-url';

@Component({
  selector: 'app-pending-approvals-hr',
  templateUrl: './pending-approvals-hr.component.html',
  styleUrls: ['./pending-approvals-hr.component.css']
})
export class PendingApprovalsHrComponent implements OnInit {
  data = [];
  dataResumption = [];
  title = 'Leave Appproval Bin (HR)';
  parent = 'Leave';
  LeaveTypes: any;
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];

  constructor(
    protected http: HttpService,
    private router: Router
  ) {
    this.loadLeave = this.loadLeave.bind(this);
    this.loadResumption = this.loadResumption.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveapproval.hrlist)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leaveresumptionapproval.hrlist)
      .subscribe(res => {
        this.dataResumption = res.data;
      }, err => { console.log(err); });
  }

  loadLeave(id) {
    // console.log(id.row.data.id);
    const leaveId = id.row.data.id;
    this.router.navigate(['leave/leave-hr', leaveId]);
    // this.obj = this.data.find(item => item.id === id.row.data.id);
    // this.operation = "Update";
    // this.showForm();
  }
  loadResumption(id) {
    // console.log(id.row.data.id);
    const leaveId = id.row.data.id;
    this.router.navigate(['leave/resume-approve-hr', leaveId]);
    // this.obj = this.data.find(item => item.id === id.row.data.id);
    // this.operation = "Update";
    // this.showForm();
  }

}
