import { Component, OnInit, Inject, ViewChild } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { TaskNoteDialog } from 'src/app/task/view-tasks/view-tasks.component';
import { DxDataGridComponent } from 'devextreme-angular';

@Component({
  selector: 'app-employee-modal',
  templateUrl: './employee-modal.component.html',
  styleUrls: ['./employee-modal.component.css']
})
export class EmployeeModalComponent implements OnInit {

  @ViewChild(DxDataGridComponent, { static: false }) dataGrid: DxDataGridComponent;
  data = [];
  constructor(
    public dialogRef: MatDialogRef<TaskNoteDialog>,
    @Inject(MAT_DIALOG_DATA) public obj: { data: [], filter: '', value: '', title: 'null' }) {
    this.data = obj.data;
    console.log(obj);
    // this.dataGrid.instance.filter([obj.filter, '=', obj.value]);
    // console.log(data);
  }

  ngOnInit() {
  }

  printMe(){
    // document.getElementById('resetPage').style.width = '1000px';
    // document.getElementById('resetPage').style.height = '1000px';

    // document.getElementById('resetPage').style.width = "1000px";
    // document.getElementById('resetPage').style.height = "1000px";
    window.print();
  }

  contentReady() {
    // if(this.obj.filter.)
    if (this.obj.filter.indexOf(',') >= 0) {
      const ex = this.obj.filter.split(',');
      const ex1 = this.obj.value.split(';');
      this.dataGrid.instance.filter([[ex[0], '=', ex1[0]], 'and', [ex[1], '=', ex1[1]]]);
    } else {
      this.dataGrid.instance.filter([this.obj.filter, '=', this.obj.value]);
    }
  }
}
