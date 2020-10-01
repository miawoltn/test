import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalUrl } from '../appraisal-url';
import { periodsUrl } from 'src/app/periods/periods-url';

@Component({
  selector: 'app-appraisal-report',
  templateUrl: './appraisal-report.component.html',
  styleUrls: ['./appraisal-report.component.scss']
})
export class AppraisalReportComponent implements OnInit {

  data = [];
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];

  obj = { id: null };
  PayrollPeriod = [];
  displayChart = false;
  constructor(protected http: HttpService) {
  }

  ngOnInit() {
    this.http.get(periodsUrl.period.list)
      .subscribe(success => {
        this.PayrollPeriod = success.data;
      }, error => { console.log(error); });
  }

  loadData() {
    this.http.post(appraisalUrl.appraisalheader.report, this.obj)
      .subscribe(success => {
        this.displayChart = true;
        this.data = success.data;
      }, error => { console.log(error); });
  }

}
