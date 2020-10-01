
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { storeUrl } from '../store-url';
import { itemUrl } from 'src/app/item/item-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-storeitems',
  templateUrl: './storeitems.component.html',
  styleUrls: ['./storeitems.component.scss']
})
export class StoreitemsComponent implements OnInit {

  displayedColumns: string[] = ['ItemCategoryID', 'ItemStatus', 'StoreName', 'CostPrice', 'ReorderLevel', 'SellingPrice', 'OpenStock'];
  data = [];
  obj = { ItemID: null, ItemStatusID: null, MeasureUnitID: null, StoreID: null, CostPrice: null, ReorderLevel: null, SellingPrice: null, OpenStock: null };
  displayForm = false;
  operation = "Add";
  title = "Store Items";
  parent = "Store";
  items = []; itemstatus = []; measureunit = []; stores = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(storeUrl.storeitems.list)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err) });
    this.http.get(itemUrl.items.list)
      .subscribe(res => {
        this.items = res.data;
      }, error => { console.log(error) });
    this.http.get(itemUrl.itemstatus.list)
      .subscribe(res => {
        this.itemstatus = res.data;
      }, error => { console.log(error) });
    this.http.get(storeUrl.stores.list)
      .subscribe(res => {
        this.stores = res.data;
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
    let url = storeUrl.storeitems.add;
    if (this.operation == "Update")
      url = storeUrl.storeitems.update;
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
    this.obj = { ItemID: null, ItemStatusID: null, MeasureUnitID: null, StoreID: null, CostPrice: null, ReorderLevel: null, SellingPrice: null, OpenStock: null };
    this.hideForm();
    this.operation = "Add";
  }
}
