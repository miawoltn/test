
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-propertyowner',
  templateUrl: './propertyowner.component.html',
  styleUrls: ['./propertyowner.component.scss']
})
export class PropertyownerComponent implements OnInit {

  displayedColumns: string[] = ['PropertyOwner', 'Address', 'TIN'];
  data = [];
  obj = { PropertyOwner: null, Address: null, TIN: null, OwnershipTypeID: null };
  displayForm = false;
  operation = "Add";
  title = "Property Owner";
  parent = "Property";
  ownershiptype = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(propertyUrl.propertyowner.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    // this.http.get(Url.ownershiptype.list)
    //   .subscribe(success => {
    //     this.ownershiptype = success.data;
    //   }, error => { console.log(error) });

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
    let url = propertyUrl.propertyowner.add;
    if (this.operation == "Update")
      url = propertyUrl.propertyowner.update;
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
    this.obj = { PropertyOwner: null, Address: null, TIN: null, OwnershipTypeID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
