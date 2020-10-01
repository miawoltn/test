import { Component, OnInit } from '@angular/core';
import { Appointment } from '../planner-calendar/appointment';
import { leaveUrl } from '../leave-url';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from 'src/app/employee/employee-url';
import { CalendarOptions } from '@fullcalendar/angular';
import { companyUrl } from 'src/app/company/company-url';
import { settingsUrl } from 'src/app/settings/settings-url';
import { projectUrl } from 'src/app/project/project-url';

@Component({
  selector: 'app-leave-calendar',
  templateUrl: './leave-calendar.component.html',
  styleUrls: ['./leave-calendar.component.scss']
})
export class LeaveCalendarComponent implements OnInit {

  data = { events: [], resources: [] };
  LeaveTypes = [];
  Departments = [];
  StaffCategory = [];
  Office = [];
  Residency = [];
  Project = [];
  obj = { LeaveTypeID: null, DepartmentID: null, GradeCadreID: null, ResidencyID: null, BranchID: null, ProjectID: null };
  employees = [];
  currentDate: Date = new Date();
  calendarOptions: CalendarOptions = {
    schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
    initialView: 'resourceTimelineYear',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'resourceTimelineMonth,resourceTimelineYear'
    },
    views: {
      resourceTimelineYear: {
        type: 'resourceTimelineYear',
        slotLabelInterval: { days: 7 },
        slotLabelFormat: [
          { month: 'long', year: 'numeric' }, // top level of text
          { day: 'numeric' } // lower level of text
        ],
      },
      resourceTimelineMonth: {
        type: 'resourceTimelineMonth',
        slotLabelInterval: { days: 3 },
        slotLabelFormat: [
          { month: 'long', year: 'numeric' }, // top level of text
          { day: 'numeric' } // lower level of text
        ],
      },
    },
    resourceAreaWidth: '12%',
    resourceAreaColumns: [
      // {
      //   group: true,
      //   field: 'building',
      //   headerContent: 'Building'
      // },
      {
        field: 'title',
        headerContent: 'Employees'
      },
      // {
      //   field: 'occupancy',
      //   headerContent: 'Occupancy'
      // }
    ],
  };
  constructor(public http: HttpService) { }

  ngOnInit() {
    this.http.get(leaveUrl.leavetype.list)
      .subscribe(res => {
        this.LeaveTypes = res.data;
      }, err => { console.log(err); });

    this.http.get(leaveUrl.leaveplanner.calendar3)
      .subscribe(res => {
        this.data = res.data;
        this.calendarOptions.resources = res.data.resources;
        this.calendarOptions.events = res.data.events;
      }, err => { console.log(err); });

    this.http.get(companyUrl.departments.list)
      .subscribe(res => {
        this.Departments = res.data;
      }, err => { console.log(err); });

    this.http.get(companyUrl.branches.list)
      .subscribe(res => {
        this.Office = res.data;
      }, err => { console.log(err); });

    this.http.get(companyUrl.staffcategory.list)
      .subscribe(res => {
        this.StaffCategory = res.data;
      }, err => { console.log(err); });

    this.http.get(settingsUrl.residency.list).subscribe(
      (success) => {
        this.Residency = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.project.list).subscribe(
      (success) => {
        this.Project = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  processForm() {
    let data = this.data.resources;

    if (this.obj.DepartmentID != null && this.obj.DepartmentID.length > 0) {
      data = data.filter(item => this.obj.DepartmentID.find((i) => i === item.DepartmentID));
    }
    if (this.obj.BranchID != null && this.obj.BranchID.length > 0) {
      // data = data.filter(item => item.BranchID === this.obj.BranchID);
      data = data.filter(item => this.obj.BranchID.find((i) => i === item.BranchID));
    }
    if (this.obj.GradeCadreID != null && this.obj.GradeCadreID.length > 0) {
      // data = data.filter(item => item.GradeCadreID === this.obj.GradeCadreID);
      data = data.filter(item => this.obj.GradeCadreID.find((i) => i === item.GradeCadreID));
    }
    if (this.obj.ResidencyID != null && this.obj.ResidencyID.length > 0) {
      // data = data.filter(item => item.ResidencyID === this.obj.ResidencyID);
      data = data.filter(item => this.obj.ResidencyID.find((i) => i === item.ResidencyID));
    }

    if (this.obj.ProjectID != null && this.obj.ProjectID.length > 0) {
      // data = data.filter(item => item.ResidencyID === this.obj.ResidencyID);
      data = data.filter(item => this.obj.ProjectID.find((i) => i === item.ProjectID));
    }

    this.calendarOptions.resources = data;
    if (this.obj.LeaveTypeID) {
      const x = this.obj.LeaveTypeID;
      console.log(this.obj.LeaveTypeID);
      // this.calendarOptions.events = this.data.events.filter(item => item.LeaveTypeID === this.obj.LeaveTypeID);
      this.calendarOptions.events = this.data.events.filter(item => {
        return x.includes(item.LeaveTypeID);
      });
    }
  }

  resetForm() {
    this.obj = { LeaveTypeID: null, DepartmentID: null, GradeCadreID: null, ResidencyID: null, BranchID: null, ProjectID: null };
    this.calendarOptions.resources = this.data.resources;
    this.calendarOptions.events = this.data.events;
  }
}
