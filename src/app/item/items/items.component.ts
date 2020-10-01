
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { itemUrl } from '../item-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-items',
  templateUrl: './items.component.html',
  styleUrls: ['./items.component.scss']
})
export class ItemsComponent implements OnInit {

  displayedColumns: string[] = ['ItemCategory', 'ItemType', 'ItemName', 'CostPrice', 'ReorderLevel', 'SellingPrice', 'OpenStock'];
  data = [];
  obj = { ItemCategoryID: null, ItemTypeID: null, MeasureUnitID: null, ItemName: null, CostPrice: null, ReorderLevel: null, SellingPrice: null, OpenStock: null };
  displayForm = false;
  operation = "Add";
  title = "Items";
  parent = "item";
  itemcategory = []; itemtype = []; measureunit = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(itemUrl.items.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(itemUrl.itemcategory.list)
      .subscribe(res => {
        this.itemcategory = res.data;
      }, error => { console.log(error) });
    this.http.get(itemUrl.itemtype.list)
      .subscribe(res => {
        this.itemtype = res.data;
      }, error => { console.log(error) });
    // this.http.get(Url.measureunit.list)
    //   .subscribe(res => {
    //     this.measureunit = res.data;
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
    let url = itemUrl.items.add;
    if (this.operation == "Update")
      url = itemUrl.items.update;
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
    this.obj = { ItemCategoryID: null, ItemTypeID: null, MeasureUnitID: null, ItemName: null, CostPrice: null, ReorderLevel: null, SellingPrice: null, OpenStock: null };
    this.hideForm();
    this.operation = "Add";
  }
}
