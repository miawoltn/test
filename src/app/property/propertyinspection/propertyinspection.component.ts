
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-propertyinspection',
  templateUrl: './propertyinspection.component.html',
  styleUrls: ['./propertyinspection.component.scss']
})
export class PropertyinspectionComponent implements OnInit {

  displayedColumns: string[] = ['PropertyName', 'EstateManagerID', 'InspectorName', 'DateofInspection', 'InspectionPurpose', 'InspectionOutcome', 'InspectionStatusID'];
  data = [];
  obj = { PropertyID: null, EstateManagerID: null, InspectorName: null, DateofInspection: null, InspectionPurpose: null, InspectionOutcome: null, InspectionStatusID: null };
  displayForm = false;
  operation = "Add";
  title = "Property Inspection";
  parent = "Property";
  property = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.propertyinspection.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(propertyUrl.property.list)
      .subscribe(success => {
        this.property = success.data;
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
    let url = propertyUrl.propertyinspection.add;
    if (this.operation == "Update")
      url = propertyUrl.propertyinspection.update;
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
    this.obj = { PropertyID: null, EstateManagerID: null, InspectorName: null, DateofInspection: null, InspectionPurpose: null, InspectionOutcome: null, InspectionStatusID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
