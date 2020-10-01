import { Component, OnInit, ViewChild, AfterViewInit } from '@angular/core';
import { DxPivotGridComponent, DxChartComponent, DxPieChartComponent } from 'devextreme-angular';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';

@Component({
  selector: 'app-chart-report',
  templateUrl: './chart-report.component.html',
  styleUrls: ['./chart-report.component.css']
})
export class ChartReportComponent implements OnInit, AfterViewInit {

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

    this.http.get(leaveUrl.leaveapplication.chart)
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
              caption: 'Leave Type',
              dataField: 'Leave Type',
              width: 150,
              expanded: true,
              area: 'column'
            },
            {
              caption: 'Days Taken',
              dataField: 'Days Taken',
              width: 150,
              dataType: 'number',
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
