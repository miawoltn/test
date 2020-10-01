import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute, Router } from '@angular/router';
import { approvalUrl } from 'src/app/approval/approval-url';
import { AuthService } from 'src/app/services/auth.service';
import { kpiUrl } from 'src/app/kpi/kpi-url';
import { appraisalUrl } from '../appraisal-url';

@Component({
  selector: 'app-appraisal-approval',
  templateUrl: './appraisal_approval.component.html',
  styleUrls: ['./appraisal_approval.component.scss']
})
export class AppraisalApprovalComponent implements OnInit {

  isEditable = true;
  isLinear = true;
  data = [];
  detail = [];
  options = [];
  scores = { scores: { score_final: null, selfscore_final: null }, type_scores: [], class_scores: [] };
  obj = {
    AppraisalID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null, Comment: null,
    ProcessModuleID: null, ApprovalInstancesID: null
  };
  displayForm = false;
  operation = 'Add';
  title = 'Appraisal Approval';
  parent = 'Appraisal';
  leaveId: any;
  leaveInfo = { period_name: null, FullName: null, DesignationName: null, WorkLocation: null, DepartmentName: null };
  Employee: any;
  ApprovalInstances: any;
  user_name = '';
  info = {
    DesignationName: null, DepartmentName: null, appraisal_date: +Date(), FullName: null,
    appraisee_id: null, appraiser_id: null, HOD_comment: null, appraisee_comment: null, committee_comment: null,
    TransID: null, department_id: null, durationmonths: null, noDirectlySupervised: null, noindirectlySupervised: null,
    brief_description: null, sup_designation_id: null, date_lastPromotion: null, support_recieved: null, comment_peers: null,
    comment_peers_alt: null, comment_sup: null, comment_sup_alt: null, comment_hod: null, comment_hod_alt: null,
    comment_subordinate: null, comment_subordinate_alt: null, lession: null, appraiser_comment_strength: null,
    appraiser_comment_improve: null, appraiser_comment_dev: null, external_training: null, approvalstage_id: null,
    exceptflagID: null, supervisortypeID: null, employee_type_id: null, confirmtypeID: null, work_id: null, level_id: null,
    lastpromotiondate: null, lenthofstay: null, period_name: null, WorkLocation: null,
  };
  show = false;
  isRequired = true;

  constructor(
    protected http: HttpService,
    private route: ActivatedRoute,
    private router: Router, public auth: AuthService
  ) {
    this.leaveId = this.route.snapshot.params.id;
    // this.loadItem = this.loadItem.bind(this);
    this.obj.AppraisalID = this.leaveId;
  }


  ngOnInit() {
    this.user_name = this.auth.getUserInfo();
    this.http.get(kpiUrl.kpiconfig.get + '/' + this.leaveId)
      .subscribe(res => {
        console.log(res.data);
        this.leaveInfo = res.data;
      }, err => { console.log(err); });

    this.http.get(appraisalUrl.appraisal_rating.list)
      .subscribe(success => {
        this.options = success.data;
      }, error => { console.log(error); });


    this.http.get(appraisalUrl.appraisal_approval.history + '/' + this.leaveId)
      .subscribe(res => {
        this.data = res.data;
      }, err => { console.log(err); });

    // this.http.get(kpiUrl.kpiconfig.detail + '/' + this.leaveId)
    //   .subscribe(res => {
    //     this.detail = res.data;
    //   }, err => { console.log(err); });


    this.http.get(kpiUrl.employees.supervisors)
      .subscribe(res => {
        console.log(res.data);
        this.Employee = res.data;
      }, err => { console.log(err); });

    this.http.get(approvalUrl.approvalinstances.getApprovalInstances)
      .subscribe(res => {
        console.log(res.data);
        this.ApprovalInstances = res.data;
      }, err => { console.log(err); });

    this.http.get(appraisalUrl.appraisalheader.get + '/' + this.leaveId)
      .subscribe(success => {
        this.info = success.data;
      }, error => { console.log(error); });


    this.http.get(appraisalUrl.appraisaldetails.getOne + '/' + this.leaveId)
      .subscribe(success => {
        this.detail = success.data;
        this.detail.forEach(item => {
          item.option_nameself = this.options.find(i => i.id == item.selfscoreId).ratingName;
        });
        console.log(this.obj);
      }, error => { console.log(error); });
  }

  onConfirm() {
    // this.obj2 = this.obj;
    //  this.info.approving_officer = this.supervisors.find(item => item.id == this.obj.order.appraiser_id).FullName;
    this.detail.forEach(item => {
      item.option_name = this.options.find(i => item.scoreId == i.id).ratingName;
    });
    // this.info.approving_officer = this.supervisors.find(item => item.id == this.obj.order.appraiser_id).FullName;
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  processForm() {
    const url = appraisalUrl.appraisal_approval.add;
    this.save(url);
  }

  loadEvent(data) {
    if (data.ApprovalTypeID == 1) {
      this.show = true;
      this.isRequired = true;
    } else {
      this.show = false;
      this.isRequired = false;
    }

  }

  save(url) {
    console.log(this.obj);
    swal.fire({title: 'Processing Appraisal ...'});
    swal.showLoading();
    this.http.post(url, { approval: this.obj, order: this.info, detail: this.detail })
      .subscribe(res => {
        this.scores = res.data;
        swal.fire('Process Complete', res.message, 'success');
        // this.resetForm();
      }, err => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      });

  }

  loadItem(id) {
    this.obj = this.data.find(item => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      AppraisalID: null, ApprovalInstanceID: null, ApprovedBy: null, NextApprovalOfficerID: null, Comment: null,
      ProcessModuleID: null, ApprovalInstancesID: null
    };
    // this.hideForm();
    // this.operation = "Add";
  }
}

