import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';

@Component({
  selector: 'app-leave-report',
  templateUrl: './leave-report.component.html',
  styleUrls: ['./leave-report.component.css']
})
export class LeaveReportComponent implements OnInit {

  data = [];
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];
  constructor(public http: HttpService) { }

  ngOnInit() {
    this.http.get(leaveUrl.leaveapplication.report)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

  }

}
