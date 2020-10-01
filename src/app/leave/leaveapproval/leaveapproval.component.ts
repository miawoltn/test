
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-leaveapproval',
  templateUrl: './leaveapproval.component.html',
  styleUrls: ['./leaveapproval.component.scss']
})
export class LeaveapprovalComponent implements OnInit {

  data = [];
  obj = {
    LeaveApplicationID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null,
    Comment: null, ProcessModuleID: null, ApprovalInstancesID: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'Leave Approval';
  parent = 'Leave';

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveapproval.list)
      .subscribe(res => {
        this.data = res.data;
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
    let url = leaveUrl.leaveapproval.add;
    if (this.operation === 'Update') {
      url = leaveUrl.leaveapproval.update;
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
    this.obj = {
      LeaveApplicationID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null,
      Comment: null, ProcessModuleID: null, ApprovalInstancesID: null
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
