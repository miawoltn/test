import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { leaveUrl } from '../leave-url';
import { Appointment } from './appointment';

@Component({
  selector: 'app-planner-calendar',
  templateUrl: './planner-calendar.component.html',
  styleUrls: ['./planner-calendar.component.css']
})
export class PlannerCalendarComponent implements OnInit {

  data: Appointment[] = [];
  displayForm = false;
  operation = 'Add';
  title = 'Leave Planner';
  parent = 'Leave';
  currentDate: Date = new Date();

  constructor(protected http: HttpService) {
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveplanner.calendar)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

  }


}


