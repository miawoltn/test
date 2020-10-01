import { Component, OnInit } from '@angular/core';
import { loanUrl } from '../loan-url';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-loan-report',
  templateUrl: './loan-report.component.html',
  styleUrls: ['./loan-report.component.css']
})
export class LoanReportComponent implements OnInit {


  data = [];
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];
  constructor(public http: HttpService) { }

  ngOnInit() {
    this.http.get(loanUrl.loanapplication.balance)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

  }
}
