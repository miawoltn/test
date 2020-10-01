
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import swal from 'sweetalert2';
import { educationUrl } from 'src/app/education/education-url';
@Component({
  selector: 'app-leaveapplicationsetup',
  templateUrl: './leaveapplicationsetup.component.html',
  styleUrls: ['./leaveapplicationsetup.component.scss']
})
export class LeaveapplicationsetupComponent implements OnInit {

  displayedColumns: string[] = ['LeaveTypeID', 'GradeID', 'NotEntitled'];
  data = [];
  obj = { LeaveTypeID: null, GradeID: null, NotEntitled: null };
  displayForm = false;
  operation = "Add";
  title = 'Leave Entitlement Setup';
  parent = 'Leave';
  leavetype = [];
  grades = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveapplicationsetup.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leavetype.list)
      .subscribe(res => {
        this.leavetype = res.data;
      }, err => { console.log(err); });

    this.http.get(educationUrl.grades.list)
      .subscribe(res => {
        this.grades = res.data;
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
    let url = leaveUrl.leaveapplicationsetup.add;
    if (this.operation === 'Update') {
      url = leaveUrl.leaveapplicationsetup.update;
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
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { LeaveTypeID: null, GradeID: null, NotEntitled: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
