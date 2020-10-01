
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: 'app-employeedesignation',
  templateUrl: './employeedesignation.component.html',
  styleUrls: ['./employeedesignation.component.scss']
})
export class EmployeedesignationComponent implements OnInit {

  displayedColumns: string[] = ['EmployeeDesignation', 'ReportToID'];
  data = [];
  obj = { EmployeeDesignation: null, ReportToID: null, DesignationCategoryID: null };
  displayForm = false;
  operation = "Add";
  title = "Employeedesignation";
  parent = "employee";
  designationcategory = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(employeeUrl.employeedesignation.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(companyUrl.designationcategory.list)
      .subscribe(res => {
        this.designationcategory = res.data;
      }, error => { console.log(error) });

  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = employeeUrl.employeedesignation.add;
    if (this.operation == "Update")
      url = employeeUrl.employeedesignation.update;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(res => {
        this.data = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetForm();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { EmployeeDesignation: null, ReportToID: null, DesignationCategoryID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
