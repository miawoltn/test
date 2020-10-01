import { Component, OnInit } from '@angular/core';
import { essUrl } from '../es-url';
import { HttpService } from 'src/app/services/http.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-my-pay-slips',
  templateUrl: './my-pay-slips.component.html',
  styleUrls: ['./my-pay-slips.component.css']
})
export class MyPaySlipsComponent implements OnInit {

  data = [];
  constructor(protected http: HttpService, public router: Router) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.post(essUrl.payroll.mypayroll, {})
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });
  }

  loadItem(id) {
    this.router.navigate(['/ess/view-slip', id.row.data.id, id.row.data.PayrollPeriodID]);
  }

}
