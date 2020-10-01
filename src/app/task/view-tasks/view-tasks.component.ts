import { Component, OnInit, Inject } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { taskUrl } from '../task-url';
import { employeeUrl } from 'src/app/employee/employee-url';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { projectUrl } from 'src/app/project/project-url';
import swal from 'sweetalert2';

@Component({
  selector: 'app-view-tasks',
  templateUrl: './view-tasks.component.html',
  styleUrls: ['./view-tasks.component.css']
})
export class ViewTasksComponent implements OnInit {

  lists: any[] = [];
  statuses: any[] = [];
  employees = {};
  tasks = [];
  employees1 = [];
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
    description: null,
    OwnerId: null,
    operation: 'Add'
  };

  obj2 = {
    TaskNote: null,
    TaskID: null,
    Task: null,
    TaskStatusID: null,
    TaskStatus: null,
    operation: 'Add'
  };

  employee = [];
  supervisor = [];
  project = [];
  tasknote = [];
  taskpriority = [];
  taskstatus = [];
  constructor(public http: HttpService, public dialog: MatDialog) { }

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
      width: '800px',
      data: {
        obj: this.obj, project: this.project, taskpriority: this.taskpriority, taskstatus: this.taskstatus,
        employee: this.employee, supervisor: this.supervisor
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        this.obj = result;
        this.processForm();
      } else {
        this.resetForm();
      }
      console.log(result);
    });

  }
  openDialogNote(): void {
    const dialogNoteRef = this.dialog.open(TaskNoteDialog, {
      width: '800px',
      data: {
        obj: this.obj2, taskstatus: this.taskstatus,
        task: this.obj
      }
    });

    dialogNoteRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        this.obj2 = result;
        this.processNoteForm();
      } else {
        this.resetForm();
      }
      console.log(result);
    });
  }

  ngOnInit() {
    this.http.get(taskUrl.taskstatus.list).
      subscribe(success => {
        this.statuses = success.data;
        this.taskstatus = success.data;
        // this.load();
      }, error => {
        console.log(error);
      });

    this.http.get(employeeUrl.employee.list).
      subscribe(success => {
        this.employees1 = success.data;
        // this.load();
      }, error => {
        console.log(error);
      });

    this.http.get(employeeUrl.employee.evaluators).
      subscribe(success => {
        this.supervisor = success.data;
        // this.load();
      }, error => {
        console.log(error);
      });


    this.http.get(taskUrl.task.list).
      subscribe(success => {
        this.tasks = success.data;
        this.load();
      }, error => {
        console.log(error);
      });

    this.http.get(employeeUrl.employee.list).subscribe(
      (success) => {
        this.employee = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(projectUrl.project.list).subscribe(
      (success) => {
        this.project = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(taskUrl.tasknote.list).subscribe(
      (success) => {
        this.tasknote = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(taskUrl.taskpriority.list).subscribe(
      (success) => {
        this.taskpriority = success.data;
      },
      (error) => {
        console.log(error);
      }
    );


  }

  load() {

    const tasks = this.tasks;
    // this.employees1.forEach(employee => {
    //   this.employees[employee.ID] = employee.Name;
    // });
    this.lists = [];
    this.statuses.forEach(status => {
      this.lists.push(tasks.filter(task => task.TaskStatusID === status.id));
    });
  }

  acceptTask(task) {
    this.obj = task;
    this.obj.TaskStatusID = 2;
    this.save(taskUrl.task.update);
  }
  processForm() {
    let url = taskUrl.task.add;
    if (this.obj.operation === 'Update') {
      url = taskUrl.task.update;
    }
    this.save(url);
  }

  processNoteForm() {
    let url = taskUrl.tasknote.add;
    if (this.obj.operation === 'Update') {
      url = taskUrl.tasknote.update;
    }
    this.saveNote(url);
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
      OwnerId: null,
      Priority: null, operation: 'Add', description: null
    };

    this.obj2 = {
      TaskNote: null,
      TaskID: null,
      Task: null,
      TaskStatusID: null,
      TaskStatus: null,
      operation: 'Add'
    };
  }

  save(url) {
    swal.showLoading();
    this.http.post(url, this.obj).subscribe(
      (success) => {
        swal.fire('Success', success.message, 'success');
        this.tasks = success.data;
        this.resetForm();
        this.load();
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

  saveNote(url) {
    swal.showLoading();
    this.http.post(url, this.obj2).subscribe(
      (success) => {
        swal.fire('Success', success.message, 'success');
        this.tasks = success.tasks;
        this.resetForm();
        this.load();
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

  update(url, obj) {
    this.http.post(url, obj).subscribe(
      (success) => {
        swal.fire('Success', success.message, 'success');
        this.tasks = success.data;
        this.load();
        this.resetForm();
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
  addTask() {
    this.obj.operation = 'Add';
    this.openDialog();
  }

  loadItem(item) {
    this.obj = item;
    this.obj.DueDate = this.obj.DueDate.replace(' ', 'T');
    this.obj.operation = 'Update';
    this.openDialog();
  }

  viewItem(item) {
    this.obj = item;
    // this.obj.DueDate = this.obj.DueDate.replace(' ', 'T');
    this.obj.operation = 'View';
    this.openDialog();
  }

  loadNoteItem(item) {
    this.obj = item;
    this.obj.DueDate = this.obj.DueDate.replace(' ', 'T');
    this.obj2.operation = 'Add';
    this.obj2.TaskID = item.id;
    this.obj2.TaskStatusID = item.TaskStatusID;
    this.openDialogNote();
  }
  onListReorder(e) {
    const list = this.lists.splice(e.fromIndex, 1)[0];
    this.lists.splice(e.toIndex, 0, list);
    const status = this.statuses.splice(e.fromIndex, 1)[0];
    this.statuses.splice(e.toIndex, 0, status);
  }

  onTaskDragStart(e) {
    e.itemData = e.fromData[e.fromIndex];
  }

  onTaskDrop(e, data, index) {
    e.fromData.splice(e.fromIndex, 1);
    e.toData.splice(e.toIndex, 0, e.itemData);
    this.processTask(index, e.itemData);
  }

  processTask(index, task) {
    const statusId = this.statuses[index].id;
    console.log(statusId);
    if (statusId != task.TaskStatusID) {
      task.TaskStatusID = statusId;
      this.update(taskUrl.task.update, task);
    }
  }
}

@Component({
  selector: 'app-dialog-overview',
  templateUrl: 'view-task.dialog.html',
})
// tslint:disable-next-line:component-class-suffix
export class DialogOverviewExampleDialog {

  obj = {
    Task: null,
    PriorityID: null,
    TaskStatusID: null,
    AssignTo: null,
    TaskNoteID: null,
    ProjectID: null,
    CustomerID: null,
    DueDate: null,
    FullName: null,
    TaskNote: null,
    TaskPriority: null,
    TaskStatus: null,
    Priority: null,
    description: null, ProjectDescription: null,
    Evaluator: null,
    OwnerId: null,
    operation: null
  };

  constructor(
    public dialogRef: MatDialogRef<DialogOverviewExampleDialog>,
    @Inject(MAT_DIALOG_DATA) public data: {
      obj: {
        Task: null,
        PriorityID: null,
        TaskStatusID: null,
        AssignTo: null,
        TaskNoteID: null,
        ProjectID: null,
        CustomerID: null,
        DueDate: null,
        FullName: null,
        TaskNote: null,
        TaskPriority: null,
        TaskStatus: null, Evaluator: null,
        OwnerId: null, ProjectDescription: null,
        Priority: null, description: null, operation: null
      }, project: [], taskpriority: [], taskstatus: [], employee: [], supervisor: []
    }) {
    this.obj = data.obj;
    // console.log(data);
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}


@Component({
  selector: 'app-task-note-dialog',
  templateUrl: 'add-note.dialog.html',
})
// tslint:disable-next-line:component-class-suffix
export class TaskNoteDialog {

  obj = {
    TaskNote: null,
    TaskID: null,
    Task: null,
    TaskStatusID: null,
    TaskStatus: null,
    operation: null
  };

  constructor(
    public dialogRef: MatDialogRef<TaskNoteDialog>,
    @Inject(MAT_DIALOG_DATA) public data: {
      obj: {
        TaskNote: null,
        TaskID: null,
        Task: null,
        TaskStatusID: null,
        TaskStatus: null, operation: null
      }, task: {}, taskstatus: []
    }) {
    this.obj = data.obj;
    // console.log(data);
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}



