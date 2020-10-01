import { Component, OnInit, AfterViewInit, ViewChild } from '@angular/core';
import { DxPivotGridComponent, DxChartComponent, DxPieChartComponent } from 'devextreme-angular';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';

@Component({
  selector: 'app-employee-report',
  templateUrl: './employee-report.component.html',
  styleUrls: ['./employee-report.component.css']
})
export class EmployeeReportComponent implements OnInit, AfterViewInit {


  @ViewChild(DxPivotGridComponent) pivotGrid: DxPivotGridComponent;
  @ViewChild(DxChartComponent) chart: DxChartComponent;
  @ViewChild(DxPieChartComponent) pieChart: DxPieChartComponent;

  pivotGridDataSource: any;
  data = [];
  bar = 'bar';
  bars: string[] = ['bar', 'stackedBar', 'fullStackedBar'];
  showDataFields: boolean = true;
  showRowFields: boolean = true;
  showColumnFields: boolean = true;
  showFilterFields: boolean = true;
  constructor(public http: HttpService) {
    this.customizeTooltip = this.customizeTooltip.bind(this);
  }
  ngOnInit() {

    this.http.get(employeeUrl.employee.chart)
      .subscribe(res => {
        this.data = res.data;
        this.pivotGridDataSource = {
          allowExpandAll: true,
          fields: [
            {
              caption: 'Department',
              dataField: 'Department',
              width: 150,
              expanded: true,
              area: 'row'
            },
            {
              caption: 'Employee Type',
              dataField: 'Employee Type',
              width: 150,
              expanded: true,
              area: 'column'
            },
            {
              summaryType: 'count',
              area: 'data'
            }
          ],
          store: this.data
        };
      }, err => { console.log(err); });

  }

  ngAfterViewInit() {
    this.pivotGrid.instance.bindChart(this.chart.instance, {
      dataFieldsDisplayMode: 'splitPanes',
      alternateDataFields: true
    });

    setTimeout(() => {
      const dataSource = this.pivotGrid.instance.getDataSource();
      console.log(dataSource);
      // dataSource.expandHeaderItem('row', ['North America']);
      // dataSource.expandHeaderItem('column', [2013]);
      dataSource.expandAll(1);
    }, 0);
  }

  customizeTooltip(args) {
    return {
      html: args.seriesName + ' | Total <div>' + args.valueText + '</div>'
    };
  }
}
