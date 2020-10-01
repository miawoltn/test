import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { benchmacksUrl } from '../benchmacks-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-benchmark-actions',
  templateUrl: './benchmark_actions.component.html',
  styleUrls: ['./benchmark_actions.component.scss']
})
export class BenchmarkActionsComponent implements OnInit {

  data = [];
  actions = [];
  employeetype = [];
  confirmtype = [];
  obj = { benchmark_id: null, action_id: null, employee_type_id: null, confirmtypeID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Benchmark Actions';
  benchmark = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(benchmacksUrl.benchmark_actions.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(benchmacksUrl.benchmark.list)
      .subscribe(success => {
        this.benchmark = success.data;
      }, error => { console.log(error); });

    this.http.get(benchmacksUrl.employeetype.list)
      .subscribe(success => {
        this.employeetype = success.data;
      }, error => { console.log(error); });

    this.http.get(benchmacksUrl.actions.list)
      .subscribe(success => {
        this.actions = success.data;
      }, error => { console.log(error); });

    this.http.get(benchmacksUrl.confirmtype.list)
      .subscribe(success => {
        this.confirmtype = success.data;
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
    let url = benchmacksUrl.benchmark_actions.add;
    if (this.operation === 'Update') {
      url = benchmacksUrl.benchmark_actions.update;
      this.save(url);
    }
    else {
      this.add(url);
    }
    // e.preventDefault();
  }

  save(url) {
    this.http.put(url, this.obj)
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
    this.obj = { benchmark_id: null, action_id: null, employee_type_id: null, confirmtypeID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
