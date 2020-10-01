
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-leaveplanner',
  templateUrl: './leaveplanner.component.html',
  styleUrls: ['./leaveplanner.component.scss']
})
export class LeaveplannerComponent implements OnInit {

  displayedColumns: string[] = ['EmployeeID', 'DateFrom', 'DateTo', 'LeaveTypeID', 'DepartmentID'];
  data = [];
  obj = { EmployeeID: null, DateFrom: null, DateTo: null, LeaveTypeID: null, DepartmentID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Leave Planner';
  parent = 'Leave';
  leavetype = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveplanner.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leavetype.list)
      .subscribe(res => {
        this.leavetype = res.data;
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
    let url = leaveUrl.leaveplanner.add;
    if (this.operation === 'Update') {
      url = leaveUrl.leaveplanner.update;
    }
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
        //const message = JSON.parse(JSON.stringify(err.error));
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { EmployeeID: null, DateFrom: null, DateTo: null, LeaveTypeID: null, DepartmentID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
