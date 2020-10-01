import { Component, OnInit } from '@angular/core';
import { employeeUrl } from '../employee-url';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.css']
})
export class ReportComponent implements OnInit {

  data = [];
  constructor(public http: HttpService) { }

  ngOnInit() {
    this.http.get(employeeUrl.employee.listActive)
      .subscribe(res => {
        this.data = res.data;

      }, err => { console.log(err); });

  }

}
