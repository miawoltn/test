
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
import { settingsUrl } from 'src/app/settings/settings-url';
@Component({
  selector: 'app-propertyapplicant',
  templateUrl: './propertyapplicant.component.html',
  styleUrls: ['./propertyapplicant.component.scss']
})
export class PropertyapplicantComponent implements OnInit {

  displayedColumns: string[] = ['ApplicantSurname', 'ApplicantFirstName', 'ApplicantMiddleName', 'Gender', 'DateofBirth', 'Email', 'PhoneNumber', 'CurrentEmployer', 'EmployerName', 'EmployerAddress', 'NationalityID', 'SateofOriginID', 'ApplicantPic'];
  data = [];
  obj = { ApplicantSurname: null, ApplicantFirstName: null, ApplicantMiddleName: null, GenderID: null, DateofBirth: null, Email: null, PhoneNumber: null, CurrentEmployer: null, EmployerName: null, EmployerAddress: null, NationalityID: null, SateofOriginID: null, LgaID: null, CityID: null, ApplicantPic: null };
  displayForm = false;
  operation = "Add";
  title = "Property Applicant";
  parent = "Property";
  city = []; gender = []; lga = [];
  state: any;
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.propertyapplicant.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(settingsUrl.state.list)
      .subscribe(success => {
        this.state = success.data;
      }, error => { console.log(error) });
    this.http.get(settingsUrl.gender.list)
      .subscribe(success => {
        this.gender = success.data;
      }, error => { console.log(error) });
    this.http.get(settingsUrl.local_govt.list)
      .subscribe(success => {
        this.lga = success.data;
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
    let url = propertyUrl.propertyapplicant.add;
    if (this.operation == "Update")
      url = propertyUrl.propertyapplicant.update;
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
    this.obj = this.data.find(item => item.id == id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { ApplicantSurname: null, ApplicantFirstName: null, ApplicantMiddleName: null, GenderID: null, DateofBirth: null, Email: null, PhoneNumber: null, CurrentEmployer: null, EmployerName: null, EmployerAddress: null, NationalityID: null, SateofOriginID: null, LgaID: null, CityID: null, ApplicantPic: null };
    this.hideForm();
    this.operation = "Add";
  }
}
