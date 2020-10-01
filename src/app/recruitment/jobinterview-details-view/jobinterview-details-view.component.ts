import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
import { companyUrl } from "src/app/company/company-url";
import { UploadService } from 'src/app/services/upload.service';
import { API_URL } from 'src/app/services/app-config';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { DialogContentExampleDialog } from '../jobshortlist/jobshortlist.component';

@Component({
  selector: "app-jobinterview-details-view",
  templateUrl: "./jobinterview-details-view.component.html",
  styleUrls: ["./jobinterview-details-view.component.scss"],
})
export class JobinterviewDetailsViewComponent implements OnInit {
  displayedColumns: string[] = [];
  data = [];
  obj = {
    ApplicantID: null,
    AnnualSalary: null,
    OtherVariables: null,
    OfferDate: null,
    OfferResponseID: null,
    ResponseDate: null,
    DesignationID: null,
    JobApplicationID: null,
  };
  displayForm1 = false;
  displayForm2 = false;
  operation = "Process";
  title = "Jobapplication";
  parent = "recruitment";
  applicantcv = [];
  applicants = [];
  recruitmentstage: any;
  recruitmentstatus: any;
  Vacancy: any;
  Designation: any;
  applicant = {
    Applicant: null,
    ApplicantID: null,
    Attachment: null,
    InterviewDate: null,
    InterviewNote: null,
    InterviewTime: null,
    InterviewedBy: null,
    JobApplicationID: null,
    JobInterviewDetailID: null,
    JobInterviewID: null,
    Recommend: null,
    RecruitmentStageID: null,
    Remark: null,
    RequirementStage: null,
    Title: null,
    Venue: null,
    id: null,
    isPresent: null
  };
  ApplicantID: any;
  constructor(protected http: HttpService, private uploadService: UploadService, public dialog: MatDialog) {
    this.loadItem = this.loadItem.bind(this);
    this.process = this.process.bind(this);
  }

  ngOnInit() {
    this.jobOfferBin();

    this.http.get(companyUrl.designations.list).subscribe(
      (res) => {
        this.Designation = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  jobOfferBin() {
    this.http.get(recruitmentUrl.jobinterviewdetail.jobOfferBin).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  handleFileInputIdentification(e) {
    // console.log(e);
    let file = e.target.files[0];
    console.log(file);

    const formData: FormData = new FormData();
    formData.append("file", file, file.name);

    this.uploadService
      .upload(formData,  `${API_URL}photo`)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.applicant.Attachment = res.data;
          // this.insertRecord(res.data)
        },
        (error) => console.log(error)
      );
  }

  showForm() {
    this.displayForm1 = true;
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }

  showForm2() {
    this.displayForm2 = true;
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }

  hideForm() {
    this.displayForm1 = false;
  }
  hideForm2() {
    this.displayForm2 = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    const url = recruitmentUrl.jobinterviewdetail.update;
    this.save(url);
  }

  save(url) {
    console.log(this.applicant);
    this.http.post(url, this.applicant).subscribe(
      (res) => {
        this.jobOfferBin();
        swal.fire("Interview Updated", res.message, "success");
        this.hideForm2();
      },
      (err) => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, "error");
      }
    );
  }

  process(id) {
    this.applicant = this.data.find(
      (i) => i.JobApplicationID == id.row.data.JobApplicationID
    );
    this.applicant.isPresent = Number(this.applicant.isPresent);
    this.applicant.Recommend = Number(this.applicant.Recommend);
    console.log(this.applicant);
    this.ApplicantID = id.row.data.ApplicantID;
    this.showForm2();
  }

  loadItem(id) {
    this.obj.JobApplicationID = id.row.data.JobApplicationID;
    this.ApplicantID = id.row.data.ApplicantID;
    this.showForm();
  }

  resetForm() {
    this.obj = {
      ApplicantID: null,
      AnnualSalary: null,
      OtherVariables: null,
      OfferDate: null,
      OfferResponseID: null,
      ResponseDate: null,
      DesignationID: null,
      JobApplicationID: null,
    };
    this.hideForm2();
    this.operation = "Process";
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
}
