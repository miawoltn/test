import { Component, OnInit, ViewChild, Inject } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import swal from "sweetalert2";
import { ActivatedRoute } from "@angular/router";
import { recruitmentUrl } from "../recruitment-url";
import { MatStepper } from '@angular/material/stepper/stepper';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { DialogContentExampleDialog } from '../jobshortlist/jobshortlist.component';

@Component({
  selector: "app-jobinterview",
  templateUrl: "./jobinterview.component.html",
  styleUrls: ["./jobinterview.component.scss"],
})
export class JobinterviewComponent implements OnInit {
  @ViewChild("stepper", { static: false }) private myStepper: MatStepper;
  
  title = "Job Interview";
  isEditable = true;
  isLinear = true;
  subtotal = 0;

  obj = {
    VacancyID: null,
    JobShortlistID: null,
    InterviewDate: null,
    RecruitmentStageID: null,
    Description: null,
    RequirementStage: null,
    Location: null,
    Remark: null,
  };
  operation = "Add";
  jobapplications = [];
  jobshortlist = [];
  recruitmentstage = [];
  vacancies: any;
  showList = false;
  jobshortlistdetail: any;
  jobshortlistdetailList: any;
  allSelected = false;
  details = [];

  constructor(protected http: HttpService, protected route: ActivatedRoute, public dialog: MatDialog) {}

  ngOnInit() {
    this.route.params.subscribe((params) => {
      console.log(params);
      if (params["id"]) this.loadItem(params["id"]);
    });
    this.http.get(recruitmentUrl.jobapplication.list).subscribe(
      (res) => {
        this.jobapplications = res.data;
      },
      (error) => {
        console.log(error);
      }
    ); 

    this.http.get(recruitmentUrl.jobshortlist.list).subscribe(
      (res) => {
        this.jobshortlist = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(recruitmentUrl.jobshortlistdetail.list).subscribe(
      (res) => {
        this.jobshortlistdetail = res.data;
        console.log(this.jobshortlistdetail);
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(recruitmentUrl.recruitmentstage.list).subscribe(
      (res) => {
        this.recruitmentstage = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  onJobShortList(e) {
    this.showList = true;
    console.log(e);
    this.jobshortlistdetailList = this.jobshortlistdetail.filter(
      (i) => i.JobShortlistID === e.JobShortlistID
    );
    console.log(this.jobshortlistdetailList);
  }

  SelectAll() {
    this.jobshortlistdetailList.forEach(
      (item) => (item.Selected = this.allSelected)
    );
    this.details = [];
    if (this.allSelected) {
      this.details = this.jobshortlistdetailList;
    }
    console.log(this.details);
  }

  addToDetails(item, event, i) {
    if (item.Selected === true) {
      this.details.push(item);
    } else {
      const index = this.details.findIndex(
        (i) => i.JobApplicationID === item.JobApplicationID
      );
      this.details.splice(index, 1);
    }
    console.log(this.details);
  }

  applyDate() {
    for (let i = 0; i < this.jobshortlistdetailList.length; i++) {
      this.jobshortlistdetailList[i].InterviewDate = this.obj.InterviewDate;
    }
  }

  onConfirm() {
    this.obj.Description = this.jobshortlist.find(
      (item) => this.obj.JobShortlistID == item.id
    ).Description;
    this.obj.RequirementStage = this.recruitmentstage.find(
      (item) => this.obj.RecruitmentStageID == item.id
    ).RequirementStage;
  }

  processForm() {
    let url = recruitmentUrl.jobinterview.add;
    if (this.operation == "Update") {
      url = recruitmentUrl.jobinterview.update;
    }
    this.save(url);
  }

  save(url) {
    const data = {
      jobinterview: this.obj,
      details: this.details
    };
    console.log(data);
    this.http.post(url, data).subscribe(
      (res) => {
        swal.fire("Success", res.message, "success");
        this.isEditable = false;
        this.jobshortlistdetailList = [];
      },
      (error) => {
        console.log(error);
        this.myStepper.previous();
        swal.fire("Error", error.message || "Some Error Occured", "error");
      }
    );
  }

  resetForm() {
    this.obj = {
      VacancyID: null,
      JobShortlistID: null,
      InterviewDate: null,
      RecruitmentStageID: null,
      Description: null,
      RequirementStage: null,
      Location: null,
      Remark: null,
    };

    this.operation = "Add";
    this.isEditable = true;
  }

  loadItem(id) {
    this.http.get(recruitmentUrl.jobinterview.get + "/" + id).subscribe(
      (res) => {
        this.obj = res.data;
        this.isEditable = true;
        this.operation = "Update";
      },
      (error) => {
        console.log(error);
        swal.fire("Error", error.message || "Some Error Occured", "error");
      }
    );
  }

  openDialog(e) {
    console.log(e);
    let applicant;
    
    const dialogRef = this.dialog.open(DialogContentExampleDialog, {
      width: "90%",
      height: "100%",
      data: {
        obj: e.ApplicantID
      },
    });

    dialogRef.afterClosed().subscribe((result) => {
      console.log(`Dialog result: ${result}`);
    });
  }
}
