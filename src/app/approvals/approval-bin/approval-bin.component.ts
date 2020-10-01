import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { Router } from '@angular/router';
import { loanUrl } from 'src/app/loan/loan-url';


@Component({
  selector: 'app-approval-bin',
  templateUrl: './approval-bin.component.html',
  styleUrls: ['./approval-bin.component.css']
})
export class ApprovalBinComponent implements OnInit {

  data = [];
  title = 'Loan Appproval Bin';
  parent = 'Loans';
  LeaveTypes: any;
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];

  constructor(
    protected http: HttpService,
    private router: Router
  ) {
    this.loadLeave = this.loadLeave.bind(this);
  }

  ngOnInit() {
    this.http.get(loanUrl.loanapplication.mylist)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

  }

  loadLeave(id) {
    // console.log(id.row.data.id);
    const leaveId = id.row.data.id;
    this.router.navigate(['loan/approval', leaveId]);
  }

}
