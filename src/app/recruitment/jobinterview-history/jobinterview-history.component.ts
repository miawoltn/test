import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
import { VacancyDialog } from '../jobshortlist-history/jobshortlist-history.component';
import { MatDialog } from '@angular/material/dialog';
import { DialogContentExampleDialog } from '../jobshortlist/jobshortlist.component';
import { API_URL } from 'src/app/services/app-config';
@Component({
  selector: "app-jobinterview-history",
  templateUrl: "./jobinterview-history.component.html",
  styleUrls: ["./jobinterview-history.component.scss"],
})
export class JobinterviewHistoryComponent implements OnInit {
  API_URL2 = API_URL;

  displayedColumns: string[] = [
    "JobInterviewID",
    "FirsName",
    "InterviewTime",
    "InterviewDate",
    "isPresent",
    "InterviewNote",
    "RequirementStage",
  ];
  data = [];
  obj = {
    JobInterviewID: null,
    ApplicantID: null,
    InterviewTime: null,
    InterviewDate: null,
    isPresent: null,
    InterviewNote: null,
    RecruitmentStageID: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Job Interview Detail";
  parent = "Recruitment";
  applicants = [];
  recruitmentstage = [];
  constructor(protected http: HttpService, public dialog: MatDialog) {
    this.interviewReport = this.interviewReport.bind(this);
    this.viewVacancy = this.viewVacancy.bind(this);
    this.viewVacancy = this.viewVacancy.bind(this);
  }

  ngOnInit() {
    this.http.get(recruitmentUrl.jobinterviewdetail.jobinterviewDetailHistory).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
    this.http.get(recruitmentUrl.applicants.list).subscribe(
      (res) => {
        this.applicants = res.data;
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

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }

  hideForm() {
    this.displayForm = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = recruitmentUrl.jobinterviewdetail.add;
    if (this.operation == "Update")
      url = recruitmentUrl.jobinterviewdetail.update;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj).subscribe(
      (res) => {
        this.data = res.data;
        swal.fire("Process Complete", res.message, "success");
        this.resetForm();
      },
      (err) => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, "error");
      }
    );
  }

  interviewReport(id) {
    const data = id.row.data.Attachment;
    console.log(data);
    window.open(this.API_URL2 + data, '_blank');
  }

  viewProfile(id) {
    const ApplicantID = id.row.data.ApplicantID;
    this.openDialog(ApplicantID);
  }

  viewVacancy(id) {
    const VacancyID = id.row.data.VacancyID;
    this.openVacancyDialog(VacancyID);
  }

  resetForm() {
    this.obj = {
      JobInterviewID: null,
      ApplicantID: null,
      InterviewTime: null,
      InterviewDate: null,
      isPresent: null,
      InterviewNote: null,
      RecruitmentStageID: null,
    };
    this.hideForm();
    this.operation = "Add";
  }

  openDialog(e) {
    console.log(e);
    let applicant;
    
    const dialogRef = this.dialog.open(DialogContentExampleDialog, {
      width: "90%",
      height: "100%",
      data: {
        obj: e
      },
    });

    dialogRef.afterClosed().subscribe((result) => {
      console.log(`Dialog result: ${result}`);
    });
  }

  openVacancyDialog(e) {
    console.log(e);
    const dialogRef = this.dialog.open(VacancyDialog, {
      width: "90%",
      height: "100%",
      data: {
        obj: e
      },
    });

    dialogRef.afterClosed().subscribe((result) => {
      console.log(`Dialog result: ${result}`);
    });
  }
}
