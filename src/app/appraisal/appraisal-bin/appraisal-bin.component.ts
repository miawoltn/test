import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { kpiUrl } from 'src/app/kpi/kpi-url';
import { Router } from '@angular/router';
import { appraisalUrl } from '../appraisal-url';
@Component({
  selector: 'app-appraisal-bin',
  templateUrl: './appraisal-bin.component.html',
  styleUrls: ['./appraisal-bin.component.scss']
})
export class AppraisalBinComponent implements OnInit {

  data = [];
  obj = {
    kpi_id: null, approve_id: null, date_approve: null, time_approve: null, approve_by: null, comments: null,
    transID: null, config_id: null, nextapprovingofficer: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'Apraisal Approval Bin';
  kpiconfig = [];
  constructor(protected http: HttpService, protected router: Router) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(appraisalUrl.appraisalheader.mylist)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
  }

  loadItem(id) {
    // this.obj = this.data.find(item => item.id === id.row.data.id);
    this.router.navigate(['/appraisal/appraisal-approval', id.row.data.id]);
  }
}
