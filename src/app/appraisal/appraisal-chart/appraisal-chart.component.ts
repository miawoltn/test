import { Component, OnInit } from '@angular/core';
import { PercentPipe } from '@angular/common';
import { HttpService } from 'src/app/services/http.service';
import { appraisalUrl } from '../appraisal-url';
import { periodsUrl } from 'src/app/periods/periods-url';

@Component({
  selector: 'app-appraisal-chart',
  templateUrl: './appraisal-chart.component.html',
  styleUrls: ['./appraisal-chart.component.scss']
})
export class AppraisalChartComponent implements OnInit {
  pipe: any = new PercentPipe('en-US');
  data = [];
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
    this.http.post(appraisalUrl.appraisalheader.benchmark, this.obj)
      .subscribe(success => {
        this.displayChart = true;
        this.data = success.data;
      }, error => { console.log(error); });
  }

  customizeTooltip = (arg: any) => {
    return {
      text: arg.valueText + ' - ' + this.pipe.transform(arg.percent, '1.2-2')
    };
  }

  customizeLabel = (arg: any) => {
    return arg.argumentText + '\n' + this.pipe.transform(arg.percent, '1.2-2');
  }


  customizeText = (arg: any) => {
    return arg.valueText;
  }

}
