import { Component, OnInit, ViewChild, Inject } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import swal from "sweetalert2";
import { ActivatedRoute } from "@angular/router";
import { recruitmentUrl } from "../recruitment-url";
import { MatStepper } from "@angular/material/stepper/stepper";
import {
  MatDialog,
  MatDialogRef,
  MAT_DIALOG_DATA,
} from "@angular/material/dialog";
import { educationUrl } from "src/app/education/education-url";
import { settingsUrl } from "src/app/settings/settings-url";
import { API_URL } from 'src/app/services/app-config';

@Component({
  selector: "app-jobshortlist",
  templateUrl: "./jobshortlist.component.html",
  styleUrls: ["./jobshortlist.component.scss"],
})
export class JobshortlistComponent implements OnInit {
  @ViewChild("stepper", { static: false }) private myStepper: MatStepper;

  title = "Job Shortlist";
  isEditable = true;
  isLinear = true;
  subtotal = 0;
  allSelected = false;

  obj = {
    Description: null,
    DateofShortlist: null,
    VacancyID: null,
    Vacancy: null,
    DeadLine: null,
    ApplicantID: null,
    Applicant: null,
    JobApplicationID: null,
    JobApplication: null,
    ProgrammeType: null,
    ExperienceLevel: null,
    YearsOfExperience: null,
  };
  filter = {
    QualificationID: null,
    ExperienceLevelID: null,
    YearsOfExperienceID: null,
    ProfessionID: null,
  };
  operation = "Add";
  JobApplicationID = null;
  jobapplications = [];
  jobshortlist = [];
  vacancy = [];
  applicants = [];
  vacancies = [];
  showList = false;
  details = [];
  jobapplicationList: any[];
  datasource: any[];
  qualifications = [];
  YearsOfExperience = [];
  experiencelevel = [];
  experiencelevellist = [];
  YearsOfExperienceList = [];
  ProfessionList = [];

  constructor(
    protected http: HttpService,
    protected route: ActivatedRoute,
    public dialog: MatDialog
  ) {}

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
    this.http.get(recruitmentUrl.vacancy.list).subscribe(
      (res) => {
        this.vacancy = res.data;
      },
      (error) => {
        console.log(error);
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

    this.http.get(recruitmentUrl.vacancy.list).subscribe(
      (res) => {
        this.vacancies = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(educationUrl.qualifications.list).subscribe(
      (res) => {
          this.qualifications = res.data;
      },
      (error) => {
          console.log(error);
      }
  );

    this.http.get(settingsUrl.yearsofexperience.list).subscribe(
      (res) => {
        this.YearsOfExperienceList = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(recruitmentUrl.experiencelevel.list).subscribe(
      (res) => {
        this.experiencelevellist = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(recruitmentUrl.professions.list).subscribe(
      (res) => {
        this.ProfessionList = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  newDate(e) {
    console.log(e.target.value);
  }

  SelectAll() {
    this.jobapplicationList.forEach(
      (item) => (item.Selected = this.allSelected)
    );
    this.details = [];
    if (this.allSelected) {
      this.details = this.jobapplicationList;
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

  onFilterVacancy(e) {
    this.showList = true;
    // console.log(e);
    this.jobapplicationList = this.jobapplications.filter(
      (i) => i.VacancyID === e.VacancyID
    );
    this.datasource = this.jobapplicationList;
    this.JobApplicationID = console.log(this.jobapplications);
    console.log(this.datasource);
  }

  all() {
    this.datasource = this.jobapplicationList;
  }

  FilterByDegree() {
    let item = this.filter;
    // console.log(item);
    let data = this.jobapplicationList;
    console.log(data);
    if (item.QualificationID != undefined && item.QualificationID != null) {
      data = data.filter(
        (i) => i.ApplicantQualificationID == item.QualificationID
      );
    }
    console.log(data);
    //   console.log(this.jobapplicationList);
    if (item.ExperienceLevelID != undefined && item.ExperienceLevelID != null) {
      data = data.filter(
        (i) => i.ApplicantExperienceLevelID == item.ExperienceLevelID
      );
    }

    if (
      item.YearsOfExperienceID != undefined &&
      item.YearsOfExperienceID != null
    ) {
      data = data.filter(
        (i) => i.ApplicantYearsofExperienceID == item.YearsOfExperienceID
      );
    }

    if (item.ProfessionID != undefined && item.ProfessionID != null) {
      data = data.filter((i) => i.ApplicantProfessionID == item.ProfessionID);
    }
    this.datasource = data;
  }

  Reset() {
    this.datasource = this.jobapplicationList;
  }

  applyDate() {
    for (let i = 0; i < this.jobapplicationList.length; i++) {
      this.jobapplicationList[i].ShortlistDate = this.obj.DateofShortlist;
    }
  }

  onConfirm() {
    this.obj.Vacancy = this.vacancies.find(
      (item) => this.obj.VacancyID === item.id
    ).Title;
  }

  processForm() {
    let url = recruitmentUrl.jobshortlist.add;
    if (this.operation === "Update") {
      url = recruitmentUrl.jobshortlist.update;
    }
    this.save(url);
  }

  save(url) {
    const data = {
      shortlist: this.obj,
      details: this.details,
    };
    console.log(data);
    this.http.post(url, data).subscribe(
      (res) => {
        swal.fire("Success", res.message, "success");
        this.isEditable = false;
        this.showList = false;
        this.jobapplicationList = [];
      },
      (error) => {
        console.log(error);
        this.myStepper.previous();
        swal.fire("Error", error.message || "Some Error Occured", "error");
      }
    );
  }

  newApplication() {
    this.myStepper.reset();
    this.showList = false;
    this.jobapplicationList = [];
  }

  resetForm() {
    this.obj = {
      Description: null,
      DateofShortlist: null,
      VacancyID: null,
      Vacancy: null,
      DeadLine: null,
      ApplicantID: null,
      Applicant: null,
      JobApplicationID: null,
      JobApplication: null,
      ProgrammeType: null,
      ExperienceLevel: null,
      YearsOfExperience: null,
    };

    this.operation = "Add";
    this.isEditable = true;
  }

  loadItem(id) {
    this.http.get(recruitmentUrl.jobshortlist.get + "/" + id).subscribe(
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
        obj: e.ApplicantID,
      },
    });

    dialogRef.afterClosed().subscribe((result) => {
      console.log(`Dialog result: ${result}`);
    });
  }
}

@Component({
  selector: "applicant-modal",
  templateUrl: "../applicant-modal.html",
})
export class DialogContentExampleDialog {
  API_URL2 = API_URL;
  
  obj = {
    applicant: {
      ApplicantID: null,
      ApplicantCV: null,
      Applicant: null,
      FirsName: null,
      LastName: null,
      Othername: null,
      Email: null,
      Phone: null,
      Address: null,
      DOB: null,
      Age: null,
      About: null,
      Photo: null,
      ExperienceLevelID: null,
      Password: null,
      GenderID: null,
      NationalityID: null,
      createdBy: null,
      dateCreated: null,
      modifiedBy: null,
      dateModified: null,
      QualificationID: null,
      QualificationName: null,
      YearsofExperienceID: null,
      JobType: null,
      JobLevel: null,
      SalaryFrom: null,
      Profession: null,
      Name: null,
      EmploymentType: null,
      ExperienceLevel: null,
      YearsofExperience: null,
      ProfessionID: null,
    },
    appexp: [
      {
        ApplicantExperienceID: null,
        ExpTitle: null,
        CompanyName: null,
        DateFrom: null,
        DateTo: null,
        Description: null,
      },
    ],
    appedu: [
      {
        ApplicantEducactionID: null,
        EduTitle: null,
        SchoolName: null,
        DateFrom: null,
        DateTo: null,
        EduDescription: null,
      },
    ],
    appskills: [
      {
        ApplicantSkillD: null,
        Skill: null,
        Percent: null,
      },
    ],
    appawards: [
      {
        ApplicantAwardlD: null,
        Title: null,
        Year: null,
        Description: null,
      },
    ],
    appcv: {
      ApplicantCVID: null,
      CV: null,
    },
  };
  constructor(
    protected http: HttpService,
    public dialogRef: MatDialogRef<DialogContentExampleDialog>,
    @Inject(MAT_DIALOG_DATA)
    public data: {
      obj: null;
    }
  ) {
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
    // this.obj = data.obj;
    this.http.get(recruitmentUrl.applicants.get + data.obj).subscribe(
      (res) => {
        this.obj = res.data;
        console.log(this.obj, "1");
      },
      (error) => {
        console.log(error);
      }
    );
    console.log(this.obj, "2");
  }

  onNoClick(): void {
    this.dialogRef.close();
  }
}
