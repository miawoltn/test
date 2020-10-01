import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { benchmacksUrl } from '../benchmacks-url';
import swal from 'sweetalert2';
import { GenericService } from 'src/app/services/generic.service';
@Component({
  selector: 'app-benchmark',
  templateUrl: './benchmark.component.html',
  styleUrls: ['./benchmark.component.scss']
})
export class BenchmarkComponent implements OnInit {

  data = [];
  statuses = [];
  obj = { benchmark: null, Scale_from: null, scale_to: null, activeID: null, benchmark_desc: null };
  displayForm = false;
  operation = 'Add';
  title = 'Benchmarks';

  constructor(protected http: HttpService, protected generics: GenericService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(benchmacksUrl.benchmark.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.generics.getStatus()
      .subscribe(success => {
        this.statuses = success;
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
    let url = benchmacksUrl.benchmark.add;
    if (this.operation === 'Update') {
      url = benchmacksUrl.benchmark.update;
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
    this.obj = { benchmark: null, Scale_from: null, scale_to: null, activeID: null, benchmark_desc: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
