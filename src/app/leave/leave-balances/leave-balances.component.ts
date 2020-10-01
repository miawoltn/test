import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
@Component({
  selector: 'app-leave-balances',
  templateUrl: './leave-balances.component.html',
  styleUrls: ['./leave-balances.component.css']
})
export class LeaveBalancesComponent implements OnInit {
  data = [];
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];
  constructor(public http: HttpService) { }

  ngOnInit() {
    this.http.get(leaveUrl.leaveemployeeapplication.balances)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });
  }
}
