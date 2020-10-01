import { Component, OnInit, ViewChild } from '@angular/core';
import {
  DxPivotGridComponent,
  DxChartComponent
} from 'devextreme-angular';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { payrollUrl } from '../payroll-url';

@Component({
  selector: 'app-netpay-report',
  templateUrl: './netpay-report.component.html',
  styleUrls: ['./netpay-report.component.css']
})
export class NetpayReportComponent implements OnInit {

  @ViewChild(DxPivotGridComponent) pivotGrid: DxPivotGridComponent;
  @ViewChild(DxChartComponent) chart: DxChartComponent;

  pivotGridDataSource: any;
  payrollperiod = [];
  obj = { PayrollID: null};

  constructor(public http: HttpService) {
    this.customizeTooltip = this.customizeTooltip.bind(this);
  }


  ngOnInit() {
    this.http.get(payrollUrl.payrollperiod.processed)
      .subscribe(success => {
        this.payrollperiod = success.data;
        swal.close();
      }, error => { console.log(error); });
  }

  customizeTooltip(args) {
    const valueText = args.originalValue;
    return {
      html: args.seriesName + '<div class=\'currency\'>' + valueText + '</div>'
    };
  }

  processForm() {
    swal.showLoading();
    this.http.post(payrollUrl.payrollgenerated.details, this.obj)
      .subscribe(success => {
        this.pivotGridDataSource = {
          fields: [{
            caption: 'Employee Name',

            dataField: 'FullName',
            area: 'row',
            expanded: true,
            width: '200'
            // sortBySummaryField: "Total"
          },
          {
            dataField: 'SalaryType',
            area: 'column',
            expanded: true,
            sortOrder: 'desc',


          },
          {
            dataField: 'SalaryComponent',
            area: 'column',
            expanded: true,
            sortBy: 'none'
          },
          {
            caption: 'Amount',
            dataField: 'Amount',
            dataType: 'number',
            summaryType: 'sum',
            area: 'data',
            format: {
              type: 'fixedPoint',
              precision: 2
            },
          }
          ],
          store: success.data
        };
        // this.pivotGridDataSource.store = success.data;
        swal.close();
      }, error => {
        swal.close();
        console.log(error);
      });
  }

}
