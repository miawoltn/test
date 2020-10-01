import { companyUrl } from './../../company/company-url';

import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-shift-schedules',
  templateUrl: './shift_schedules.component.html',
  styleUrls: ['./shift_schedules.component.scss']
})
export class Shift_schedulesComponent implements OnInit {

  displayedColumns: string[] = ['shift_template', 'date_from', 'date_to', 'DepartmentName'];
  data = [];
  obj = { shift_template_id: null, date_from: null, date_to: null, DepartmentID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Shift Schedules';
  parent = 'Shift';
  departments = []; shift_templates = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(shiftUrl.shift_schedules.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(shiftUrl.shift_templates.list)
      .subscribe(res => {
        this.shift_templates = res.data;
      }, error => { console.log(error); });
    this.http.get(companyUrl.departments.list)
      .subscribe(res => {
        this.departments = res.data;
      }, error => { console.log(error); });

  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = shiftUrl.shift_schedules.add;
    if (this.operation === 'Update') {
      url = shiftUrl.shift_schedules.update;
    }
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        this.resetForm();
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { shift_template_id: null, date_from: null, date_to: null, DepartmentID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
