
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-propertysubtype',
  templateUrl: './propertysubtype.component.html',
  styleUrls: ['./propertysubtype.component.scss']
})
export class PropertysubtypeComponent implements OnInit {

  displayedColumns: string[] = ['PropertySubType', 'PropertyType'];
  data = [];
  obj = { PropertySubType: null, PropertyTypeID: null };
  displayForm = false;
  operation = "Add";
  title = "Property Sub-Type";
  parent = "Property";
  propertytype = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.propertysubtype.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(propertyUrl.propertytype.list)
      .subscribe(success => {
        this.propertytype = success.data;
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
    let url = propertyUrl.propertysubtype.add;
    if (this.operation == "Update")
      url = propertyUrl.propertysubtype.update;
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
    this.obj = { PropertySubType: null, PropertyTypeID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
