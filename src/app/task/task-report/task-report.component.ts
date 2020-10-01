import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { taskUrl } from '../task-url';

@Component({
  selector: 'app-task-report',
  templateUrl: './task-report.component.html',
  styleUrls: ['./task-report.component.css']
})
export class TaskReportComponent implements OnInit {

  data = [];
  choices = [{ value: 1, label: 'Yes' }, { value: 0, label: 'No' }];
  constructor(public http: HttpService) { }

  ngOnInit() {
    this.http.get(taskUrl.task.report)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

  }

}
