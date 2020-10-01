import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from 'src/app/leave/leave-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';

@Component({
  selector: 'app-pending-resumption',
  templateUrl: './pending-resumption.component.html',
  styleUrls: ['./pending-resumption.component.css']
})
export class PendingResumptionComponent implements OnInit {

  data = [];
  title = 'Pending Leave Resumption';
  parent = 'Leave';
  LeaveTypes: any;
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];

  constructor(
    protected http: HttpService,
    private router: Router
  ) {
    this.loadLeave = this.loadLeave.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveresumption.pending)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

  }

  loadLeave(id) {
    // console.log(id.row.data.id);
    const leaveId = id.row.data.id;
    this.router.navigate(['leave/resumption', leaveId]);
    // this.obj = this.data.find(item => item.id === id.row.data.id);
    // this.operation = "Update";
    // this.showForm();
  }
}
