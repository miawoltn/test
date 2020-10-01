import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';

@Component({
  selector: 'app-calendar2',
  templateUrl: './calendar2.component.html',
  styleUrls: ['./calendar2.component.css']
})
export class Calendar2Component implements OnInit {

  data = [];
  departments = [];
  displayForm = false;
  operation = 'Add';
  title = 'Leave Employee Planner';
  parent = 'Leave';
  pivotGridDataSource: any;
  LeaveTypes = [];
  obj = { LeaveTypeID: null, DepartmentID: null };

  constructor(protected http: HttpService) {
  }

  ngOnInit() {
    this.http.get(leaveUrl.leavetype.list)
      .subscribe(res => {
        this.LeaveTypes = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leaveplanner.calendar2)
      .subscribe(success => {
        this.pivotGridDataSource = {
          fields: [{
            caption: 'Employee Name',
            dataField: 'FullName',
            area: 'row',
            expanded: true,
            width: '200'
          },
          {
            dataField: 'calendar_date',
            area: 'column',
            dataType: 'date',
            groupInterval: 'month',
            expanded: true,
          },
          {
            dataField: 'calendar_date',
            area: 'column',
            dataType: 'date',
            groupInterval: 'day',
            expanded: true,
          },
          {
            caption: 'No',
            dataField: 'total',
            dataType: 'number',
            summaryType: 'sum',
            area: 'data'
          }
          ],
          store: success.data
        };
      }, err => { console.log(err); });
  }

  processForm() { }
}


