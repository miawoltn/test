import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
@Component({
  selector: "app-jobinterviewdetail",
  templateUrl: "./jobinterviewdetail.component.html",
  styleUrls: ["./jobinterviewdetail.component.scss"],
})
export class JobinterviewdetailComponent implements OnInit {
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
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(recruitmentUrl.jobinterviewdetail.list).subscribe(
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

  loadItem(id) {
    this.obj = this.data.find((item) => item.id == id.row.data.id);
    this.operation = "Update";
    this.showForm();
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
}
