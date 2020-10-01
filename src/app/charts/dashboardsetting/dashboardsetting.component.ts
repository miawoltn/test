import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { chartsUrl } from '../charts-url';
import swal from 'sweetalert2';
import { GenericService } from 'src/app/services/generic.service';
@Component({
  selector: 'app-dashboardsetting',
  templateUrl: './dashboardsetting.component.html',
  styleUrls: ['./dashboardsetting.component.scss']
})
export class DashboardsettingComponent implements OnInit {

  data = [];
  obj = {
    chart_title: null, chart_id: null, isActive: null, module_id: null, orderby: null,
    chart_type_id: null, chart_category_id: null, isGroup: null, subModuleId: null
  };
  displayForm = false;
  operation = 'Add';
  chart_category = [];
  chart_types = [];
  charts = [];
  modules = [];
  statuses = [];
  yesNo = [];
  submodules =[];
  constructor(protected http: HttpService, public generic: GenericService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.generic.getStatus().subscribe(success => {
      this.statuses = success;
    }, error => { console.log(error); });

    this.generic.getYesNo().subscribe(success => {
      this.yesNo = success;
    }, error => { console.log(error); });


    this.modules = JSON.parse(localStorage.getItem('modules'));

    this.http.get(chartsUrl.submodules.list)
      .subscribe(success => {
        this.submodules = success.data;
      }, error => { console.log(error); });

    this.http.get(chartsUrl.dashboardsetting.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(chartsUrl.chart_category.list)
      .subscribe(success => {
        this.chart_category = success.data;
      }, error => { console.log(error); });
    this.http.get(chartsUrl.chart_types.list)
      .subscribe(success => {
        this.chart_types = success.data;
      }, error => { console.log(error); });
    this.http.get(chartsUrl.charts.list)
      .subscribe(success => {
        this.charts = success.data;
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
    let url = chartsUrl.dashboardsetting.add;
    if (this.operation === 'Update') {
      url = chartsUrl.dashboardsetting.update;
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
    this.obj = {
      chart_title: null, chart_id: null, isActive: null, module_id: null,
      orderby: null, chart_type_id: null, chart_category_id: null, isGroup: null , subModuleId: null
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
