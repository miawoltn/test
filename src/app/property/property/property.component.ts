
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
import { settingsUrl } from 'src/app/settings/settings-url';
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: 'app-property',
  templateUrl: './property.component.html',
  styleUrls: ['./property.component.scss']
})
export class PropertyComponent implements OnInit {

  displayedColumns: string[] = ['PropertyName', 'PropertyTypeID', 'PropertySubTypeID', 'Plot', 'StateID', 'LgaID', 'CityID', 'PhysicalAddress', 'PropertyOwnerID', 'PropertyDescription'];
  data = [];
  obj = { PropertyName: null, PropertyTypeID: null, PropertySubTypeID: null, Plot: null, StateID: null, LgaID: null, CityID: null, Address: null, PropertyOwnerID: null, PropertyDescription: null };
  displayForm = false;
  operation = "Add";
  title = "Property";
  parent = "Property";
  PropertyType: any;
  State: any;
  LocalGovt: any;
  Company: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.property.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(propertyUrl.propertytype.list)
      .subscribe(res => {
        this.PropertyType = res.data;
      }, err => { console.log(err) });
    this.http.get(settingsUrl.state.list)
      .subscribe(res => {
        this.State = res.data;
      }, err => { console.log(err) });
    this.http.get(settingsUrl.local_govt.list)
      .subscribe(res => {
        this.LocalGovt = res.data;
      }, err => { console.log(err) });
    this.http.get(companyUrl.company.list)
      .subscribe(res => {
        this.Company = res.data;
      }, err => { console.log(err) });
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
    let url = propertyUrl.property.add;
    if (this.operation == "Update")
      url = propertyUrl.property.update;
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
    this.obj = { PropertyName: null, PropertyTypeID: null, PropertySubTypeID: null, Plot: null, StateID: null, LgaID: null, CityID: null, Address: null, PropertyOwnerID: null, PropertyDescription: null };
    this.hideForm();
    this.operation = "Add";
  }
}
