import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalUrl } from '../appraisal-url';
import swal from 'sweetalert2';
import { kpiUrl } from 'src/app/kpi/kpi-url';
@Component({
  selector: 'app-appraisalheader',
  templateUrl: './appraisalheader.component.html',
  styleUrls: ['./appraisalheader.component.scss']
})
export class AppraisalheaderComponent implements OnInit {

  isEditable = true;
  isLinear = true;
  data = [];
  options = [];
  scores = { scores: { score_final: null, selfscore_final: null }, type_scores: [], class_scores: [] };
  // tslint:disable-next-line:max-line-length
  obj = {
    order: {
      period_id: null, appraisal_date: null, depunit_id: null, designation_id: null, appraisee_id: null, appraiser_id: null,
      HOD_comment: null, appraisee_comment: null, committee_comment: null, TransID: null, department_id: null, durationmonths: null,
      noDirectlySupervised: null, noindirectlySupervised: null, brief_description: null, sup_designation_id: null,
      date_lastPromotion: null, support_recieved: null, comment_peers: null, comment_peers_alt: null, comment_sup: null,
      comment_sup_alt: null, comment_hod: null, comment_hod_alt: null, comment_subordinate: null, comment_subordinate_alt: null,
      lession: null, appraiser_comment_strength: null, appraiser_comment_improve: null, appraiser_comment_dev: null,
      external_training: null, approvalstage_id: null, exceptflagID: null, supervisortypeID: null, employee_type_id: null,
      confirmtypeID: null, work_id: null, level_id: null, lastpromotiondate: null, lenthofstay: null, posted_by: null
    }, detail: []
  };
  obj2 = {
    order: {
      period_id: null, appraisal_date: null, depunit_id: null, designation_id: null, appraisee_id: null, appraiser_id: null,
      HOD_comment: null, appraisee_comment: null, committee_comment: null, TransID: null, department_id: null, durationmonths: null,
      noDirectlySupervised: null, noindirectlySupervised: null, brief_description: null, sup_designation_id: null,
      date_lastPromotion: null, support_recieved: null, comment_peers: null, comment_peers_alt: null, comment_sup: null,
      comment_sup_alt: null, comment_hod: null, comment_hod_alt: null, comment_subordinate: null, comment_subordinate_alt: null,
      lession: null, appraiser_comment_strength: null, appraiser_comment_improve: null, appraiser_comment_dev: null,
      external_training: null, approvalstage_id: null, exceptflagID: null, supervisortypeID: null, employee_type_id: null,
      confirmtypeID: null, work_id: null, level_id: null, lastpromotiondate: null, lenthofstay: null, posted_by: null
    }, detail: []
  };
  info = {
    DesignationName: null, DepartmentName: null, appraisal_date: +Date(), FullName: null,
    appraisee_id: null, appraiser_id: null, HOD_comment: null, appraisee_comment: null, committee_comment: null,
    TransID: null, department_id: null, durationmonths: null, noDirectlySupervised: null, noindirectlySupervised: null,
    brief_description: null, sup_designation_id: null, date_lastPromotion: null, support_recieved: null, comment_peers: null,
    comment_peers_alt: null, comment_sup: null, comment_sup_alt: null, comment_hod: null, comment_hod_alt: null,
    comment_subordinate: null, comment_subordinate_alt: null, lession: null, appraiser_comment_strength: null,
    appraiser_comment_improve: null, appraiser_comment_dev: null, external_training: null, approvalstage_id: null,
    exceptflagID: null, supervisortypeID: null, employee_type_id: null, confirmtypeID: null, work_id: null, level_id: null,
    lastpromotiondate: null, lenthofstay: null, period_name: null, approving_officer: null
  };
  displayForm = false;
  operation = 'Initiate Appraisal';
  title = 'Appraisal Application';
  supervisors = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
    this.Log = this.Log.bind(this);
  }

  ngOnInit() {
    this.http.get(appraisalUrl.appraisalheader.list)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });

    this.http.get(appraisalUrl.appraisal_rating.list)
      .subscribe(success => {
        this.options = success.data;
      }, error => { console.log(error); });

    this.http.get(appraisalUrl.appraisalheader.empInfo)
      .subscribe(success => {
        this.info = success.data;
      }, error => { console.log(error); });

    this.http.get(kpiUrl.employees.supervisors)
      .subscribe(success => {
        this.supervisors = success.data;
      }, error => { console.log(error); });

    this.http.get(kpiUrl.kpiconfig.detailEmp)
      .subscribe(success => {
        this.obj.detail = success.data;
        console.log(this.obj);
      }, error => { console.log(error); });
  }

  Log(data) {
    console.log(data);
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() { this.displayForm = false; }

  addItem() {
    // this.resetForm();
    this.showForm();
  }

  onConfirm() {
    this.obj2 = this.obj;
    this.info.approving_officer = this.supervisors.find(item => item.id == this.obj.order.appraiser_id).FullName;
    this.obj2.detail.forEach(item => {
      item.option_name = this.options.find(i => item.selfscoreId == i.id).ratingName;
    });
    this.info.approving_officer = this.supervisors.find(item => item.id == this.obj.order.appraiser_id).FullName;
  }

  processForm() {
    swal.showLoading();
    let url = appraisalUrl.appraisalheader.add;
    if (this.operation === 'Update Appraisal') {
      url = appraisalUrl.appraisalheader.update;
      this.save(url);
    } else {
      this.add(url);
    }
    // e.preventDefault();
  }

  save(url) {

    this.http.post(url, this.obj)
      .subscribe(success => {
        this.scores = success.data;
        swal.fire('Process Complete', success.message, 'success');
        // this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }

  add(url) {
    this.http.post(url, this.obj)
      .subscribe(success => {
        this.scores = success.data;
        swal.fire('Process Complete', success.message, 'success');
        // this.resetForm();
      }, error => {
        console.log(error);
        swal.fire('Process Unsuccessful', error.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update Appraisal';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      order: {
        period_id: null, appraisal_date: null, depunit_id: null, designation_id: null, appraisee_id: null, appraiser_id: null,
        HOD_comment: null, appraisee_comment: null, committee_comment: null, TransID: null, department_id: null, durationmonths: null,
        noDirectlySupervised: null, noindirectlySupervised: null, brief_description: null, sup_designation_id: null,
        date_lastPromotion: null, support_recieved: null, comment_peers: null, comment_peers_alt: null, comment_sup: null,
        comment_sup_alt: null, comment_hod: null, comment_hod_alt: null, comment_subordinate: null, comment_subordinate_alt: null,
        lession: null, appraiser_comment_strength: null, appraiser_comment_improve: null, appraiser_comment_dev: null,
        external_training: null, approvalstage_id: null, exceptflagID: null, supervisortypeID: null, employee_type_id: null,
        confirmtypeID: null, work_id: null, level_id: null, lastpromotiondate: null, lenthofstay: null, posted_by: null
      }, detail: []
    };
    this.hideForm();
    this.operation = 'Initiate Appraisal';
  }
}
