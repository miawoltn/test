import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { chartsUrl } from '../charts-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.scss']
})
export class ChartsComponent implements OnInit {

  data = [];
  obj = { chart_title: null, chart_type_id: null, chart_category_id: null, sql_query: null, isActive: null, module_id: null };
  displayForm = false;
  operation = 'Add';
  title = 'Charts';

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(chartsUrl.charts.list)
      .subscribe(success => {
        this.data = success.data;
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
    let url = chartsUrl.charts.add;
    if (this.operation === 'Update') {
      url = chartsUrl.charts.update;
      this.save(url);
    } else {
      this.add(url);
    }
    // e.preventDefault();
  }

  save(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire('Process Complete', success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }
  add(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.data = success.data;
        swal.fire('Process Complete', success.message, 'success');
        this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = { chart_title: null, chart_type_id: null, chart_category_id: null, sql_query: null, isActive: null, module_id: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
