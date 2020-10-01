
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { salaryUrl } from '../salary-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-salarycomponents',
  templateUrl: './salarycomponents.component.html',
  styleUrls: ['./salarycomponents.component.scss']
})
export class SalarycomponentsComponent implements OnInit {

  displayedColumns: string[] = ['SalaryComponent', 'SalaryTypeID', 'TaxStatusID'];
  data = [];
  SalaryType = [];
  TaxStatus = [];
  TaxStatuses = [];
  obj = { SalaryComponent: null, SalaryTypeID: null, TaxStatusID: null, SalaryTaxStatusID: null };
  displayForm = false;
  operation = "Add";
  title = "Salary Components";
  parent = "Salary";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(salaryUrl.salarycomponents.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    this.http.get(salaryUrl.salarytaxstatus.list)
      .subscribe(res => {
        this.TaxStatuses = res.data;
      }, err => { console.log(err); });
    this.http.get(salaryUrl.salarytype.list)
      .subscribe(res => {
        this.SalaryType = res.data;
      }, err => { console.log(err); });


  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
  }

  hideForm() { this.displayForm = false; }

  loadStatuses(data) {
    this.TaxStatus = this.TaxStatuses.filter(item => item.SalaryTypeID === data.SalaryTypeID);
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = salaryUrl.salarycomponents.add;
    if (this.operation == "Update")
      url = salaryUrl.salarycomponents.update;
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
    this.loadStatuses({SalaryTypeID: this.obj.SalaryTypeID});
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { SalaryComponent: null, SalaryTypeID: null, TaxStatusID: null, SalaryTaxStatusID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
