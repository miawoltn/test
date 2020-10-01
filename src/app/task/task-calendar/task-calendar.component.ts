import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { Appointment } from './appointment';
import { leaveUrl } from 'src/app/leave/leave-url';
import { taskUrl } from '../task-url';

@Component({
    selector: 'app-task-calendar',
    templateUrl: './task-calendar.component.html',
    styleUrls: ['./task-calendar.component.css'],
})
export class TaskCalendarComponent implements OnInit {
    data: Appointment[] = [];
    displayForm = false;
    operation = 'Add';
    title = 'Task Planner';
    parent = 'Task';
    currentDate: Date = new Date();

    constructor(protected http: HttpService) {}

    ngOnInit() {
        // this.data = [
        //     {
        //         text: 'Website Re-Design Plan',
        //         startDate: new Date(2020, 5, 22, 9, 30),
        //         endDate: new Date(2020, 6, 23, 11, 30),
        //     },
        //     {
        //         text: 'Book Flights to San Fran for Sales Trip',
        //         startDate: new Date(2020, 6, 22, 12, 0),
        //         endDate: new Date(2020, 6, 24, 13, 0),
        //         allDay: true,
        //     },
        //     {
        //         text: 'Install New Router in Dev Room',
        //         startDate: new Date(2020, 6, 22, 14, 30),
        //         endDate: new Date(2020, 6, 26, 15, 30),
        //     },
        //     {
        //         text: 'Approve Personal Computer Upgrade Plan',
        //         startDate: new Date(2020, 6, 23, 10, 0),
        //         endDate: new Date(2020, 6, 23, 11, 0),
        //     },
        //     {
        //         text: 'Final Budget Review',
        //         startDate: new Date(2020, 6, 23, 12, 0),
        //         endDate: new Date(2020, 6, 23, 13, 35),
        //     },
        //     {
        //         text: 'New Brochures',
        //         startDate: new Date(2020, 6, 23, 14, 30),
        //         endDate: new Date(2020, 6, 23, 15, 45),
        //     },
        //     {
        //         text: 'Install New Database',
        //         startDate: new Date(2020, 6, 24, 9, 45),
        //         endDate: new Date(2020, 6, 24, 11, 15),
        //     },
        //     {
        //         text: 'Approve New Online Marketing Strategy',
        //         startDate: new Date(2020, 6, 24, 12, 0),
        //         endDate: new Date(2020, 6, 24, 14, 0),
        //     },
        //     {
        //         text: 'Upgrade Personal Computers',
        //         startDate: new Date(2020, 6, 24, 15, 15),
        //         endDate: new Date(2020, 6, 24, 16, 30),
        //     },
        //     {
        //         text: 'Customer Workshop',
        //         startDate: new Date(2020, 6, 25, 11, 0),
        //         endDate: new Date(2020, 6, 25, 12, 0),
        //         allDay: true,
        //     },
        //     {
        //         text: 'Prepare 2015 Marketing Plan',
        //         startDate: new Date(2020, 6, 25, 11, 0),
        //         endDate: new Date(2020, 6, 25, 13, 30),
        //     },
        //     {
        //         text: 'Brochure Design Review',
        //         startDate: new Date(2020, 6, 25, 14, 0),
        //         endDate: new Date(2020, 6, 25, 15, 30),
        //     },
        //     {
        //         text: 'Create Icons for Website',
        //         startDate: new Date(2020, 6, 26, 10, 0),
        //         endDate: new Date(2020, 6, 26, 11, 30),
        //     },
        //     {
        //         text: 'Upgrade Server Hardware',
        //         startDate: new Date(2020, 6, 26, 14, 30),
        //         endDate: new Date(2020, 6, 26, 16, 0),
        //     },
        //     {
        //         text: 'Submit New Website Design',
        //         startDate: new Date(2020, 6, 26, 16, 30),
        //         endDate: new Date(2020, 6, 26, 18, 0),
        //     },
        //     {
        //         text: 'Launch New Website',
        //         startDate: new Date(2020, 6, 26, 12, 20),
        //         endDate: new Date(2020, 6, 26, 14, 0),
        //     },
        // ];

        this.http.get(taskUrl.task.tasklist).subscribe(
            (res) => {
                console.log(res.data);
                this.data = res.data;
                // this.data = 
            },
            (err) => {
                console.log(err);
            }
        );
    }
}
