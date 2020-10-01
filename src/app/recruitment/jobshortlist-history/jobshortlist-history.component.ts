import { Component, OnInit, ViewChild, Inject } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
import { DialogContentExampleDialog } from '../jobshortlist/jobshortlist.component';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA, } from '@angular/material/dialog';
import { API_URL } from 'src/app/services/app-config';

@Component({
  selector: "app-jobshortlist-history",
  templateUrl: "./jobshortlist-history.component.html",
  styleUrls: ["./jobshortlist-history.component.scss"],
})
export class JobshortlistHistoryComponent implements OnInit {
  displayedColumns: string[] = ["Description", "ApplicantID", "ApplicantID"];
  data = [];
  obj = { JobShortlistID: null, ApplicantID: null, JobApplicationID: null };
  displayForm = false;
  operation = "Add";
  title = "Job Shortlist Detail";
  parent = "Recruitment";
  jobapplication = [];
  jobshortlist = [];
  constructor(protected http: HttpService, public dialog: MatDialog) {
    this.viewProfile = this.viewProfile.bind(this);
    this.viewVacancy = this.viewVacancy.bind(this);
  }

  ngOnInit() {
    this.http.get(recruitmentUrl.jobshortlistdetail.jobShortlistDetailHistory).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
    this.http.get(recruitmentUrl.jobapplication.list).subscribe(
      (res) => {
        this.jobapplication = res.data;
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
    let url = recruitmentUrl.jobshortlistdetail.add;
    if (this.operation == "Update")
      url = recruitmentUrl.jobshortlistdetail.update;
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
      JobShortlistID: null,
      ApplicantID: null,
      JobApplicationID: null,
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

@Component({
  selector: "vacancy-modal",
  templateUrl: "../vacancy-modal.html",
})
export class VacancyDialog {
  API_URL2 = API_URL;

  obj = {
    Title: null,
    DeadLine: null,
    DesignationID: null,
    Requirement: null,
    ExperienceLevelID: null,
    ContractTypeID: null,
    ContractType: null,
    EmploymentTypeID: null,
    JobDescription: null,
    JobApplicationID: null,
    LocationID: null,
    Slots: null,
    AmountFrom: null,
    AmountTo: null,
    BranchName: null,
    EmploymentType: null,
    ExperienceLevel: null,
    VacancyID: null,
    ApplicantID: null,
    isConfidential: null,
    Introduction: null,
    JobRequirements: null,
    QualificationName: null,
    state: null,
    local_govt: null,
    ProgrammeType: null,
    YearsofExperience: null,
    DesignationName: null,
    Name: null,
    Gender: null,
    dateCreated: null,
    Photo: null,
    ApplicantID2: null
  };

  constructor(
    protected http: HttpService,
    public dialogRef: MatDialogRef<VacancyDialog>,
    @Inject(MAT_DIALOG_DATA)
    public data: {
      obj: null;
    }
  ) {
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
    // this.obj = data.obj;
    this.http.get(recruitmentUrl.vacancy.get + data.obj).subscribe(
      (res) => {
        this.obj = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  onNoClick(): void {
    this.dialogRef.close();
  }
}