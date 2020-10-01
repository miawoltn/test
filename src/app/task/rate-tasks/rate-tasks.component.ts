import { projectUrl } from './../../project/project-url';
import { employeeUrl } from './../../employee/employee-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { taskUrl } from '../task-url';
import { MatStepper } from '@angular/material/stepper';

@Component({
  selector: 'app-rate-tasks',
  templateUrl: './rate-tasks.component.html',
  styleUrls: ['./rate-tasks.component.css']
})
export class RateTasksComponent implements OnInit {


  title = 'Rate Task';
  isEditable = true;
  isLinear = true;
  subtotal = 0;
  displayForm = false;

  obj = {
    Task: null,
    PriorityID: null,
    TaskStatusID: null,
    AssignTo: null,
    TaskNoteID: null,
    ProjectID: null,
    CustomerID: null,
    DueDate: null,
    SurName: null,
    TaskNote: null,
    TaskPriority: null,
    TaskStatus: null,
    Priority: null,
    ratingScore: null,
    FullName: null,
    ProjectDescription: null,
    Description: null,
  };
  operation = 'Add';
  employee = [];
  project = [{ id: '0', title: '0' }, { id: '1', title: '1' },
  { id: '2', title: '2' }, { id: '3', title: '3' }, { id: '4', title: '4' }, { id: '5', title: '5' }];
  tasknote = [];
  taskpriority = [];
  taskstatus = [];
  data = [];

  constructor(protected http: HttpService, protected route: ActivatedRoute) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(taskUrl.task.pendingRating).subscribe(
      (success) => {
        this.data = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  loadItem(id) {
    this.showForm();
    this.obj = this.data.find(item => item.id === id.row.data.id);
  }

  processForm() {
    const url = taskUrl.task.rateTask;
    // if (this.operation == 'Update') url = taskUrl.task.update;
    this.save(url);
  }

  save(url) {
    swal.showLoading();
    this.http.post(url, this.obj).subscribe(
      (success) => {
        swal.fire('Success', success.message, 'success');
        this.data = success.data;
        this.hideForm();
      },
      (error) => {
        console.log(error);
        swal.fire(
          'Error',
          error.message || 'Some Error Occured',
          'error'
        );
      }
    );
  }

  resetForm() {
    this.obj = {
      Task: null,
      PriorityID: null,
      TaskStatusID: null,
      AssignTo: null,
      TaskNoteID: null,
      ProjectID: null,
      CustomerID: null,
      DueDate: null,
      SurName: null,
      TaskNote: null,
      TaskPriority: null,
      TaskStatus: null,
      Priority: null,
      ratingScore: null,
      FullName: null,
      ProjectDescription: null,
      Description: null,
    };

    this.operation = 'Add';
    this.isEditable = true;
  }

  hideForm() {
    this.resetForm();
    this.displayForm = false;
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }


}
