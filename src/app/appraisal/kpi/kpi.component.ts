import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { appraisalUrl } from '../appraisal-url';
import { kpiUrl } from 'src/app/kpi/kpi-url';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-kpi',
  templateUrl: './kpi.component.html',
  styleUrls: ['./kpi.component.scss']
})
export class KpiComponent implements OnInit {

  data = [];
  obj = { kpitype_id: null, kpiclass_id: null, kpi_name: null, Kpi_desc: null, maxWeight: null, config_id: null, transID: null, kpi_general_id: null, kpi_criteria: null, systemsID: null, systemDetailsID: null, storycategory_id: null, targetvalue: null, EdStoryCategory_groupID: null };
  displayForm = false;
  operation = 'Add';
  title = 'My KPIs';
  kpi_types = [];
  kpi_type = []; kpiclass = [];
  constructor(protected http: HttpService, protected route: Router) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(appraisalUrl.kpi.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpi_type.list)
      .subscribe(success => {
        this.kpi_types = success.data;
      }, error => { console.log(error); });
    this.http.get(kpiUrl.kpiclass.list)
      .subscribe(success => {
        this.kpiclass = success.data;
      }, error => { console.log(error); });

  }

  loadType(id) {
    console.log(id);
    this.kpi_type = this.kpi_types.filter(item => item.kpiclass_id === id.row.data.id);
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }
  forwardForApproval()
  {
    this.route.navigate(['/appraisal/kpi-approval']);
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = kpiUrl.kpi.add;
    if (this.operation === 'Update') {
      url = kpiUrl.kpi.update;
      this.save(url);
    }
    else {
      this.add(url);
    }
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
    this.loadType(this.obj.kpiclass_id);
    this.showForm();
  }

  resetForm() {
    this.obj = { kpitype_id: null, kpiclass_id: null, kpi_name: null, Kpi_desc: null, maxWeight: null, config_id: null, transID: null, kpi_general_id: null, kpi_criteria: null, systemsID: null, systemDetailsID: null, storycategory_id: null, targetvalue: null, EdStoryCategory_groupID: null };
    this.hideForm();
    this.operation = 'Add';
  }
}
