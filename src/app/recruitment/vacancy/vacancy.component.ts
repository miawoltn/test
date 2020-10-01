import { educationUrl } from "./../../education/education-url";
import { settingsUrl } from "./../../settings/settings-url";
import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
import { companyUrl } from "src/app/company/company-url";
import { UploadService } from 'src/app/services/upload.service';
@Component({
  selector: "app-vacancy",
  templateUrl: "./vacancy.component.html",
  styleUrls: ["./vacancy.component.scss"],
})
export class VacancyComponent implements OnInit {
  displayedColumns: string[] = [
    "DeadLine",
    "DesignationID",
    "Requirement",
    "ExperienceLevel",
    "ContractType",
    "EmploymentType",
    "JobDescription",
    "ApplicantID",
  ];
  data = []; 
  obj = {
    Title: null,
    DeadLine: null,
    DesignationID: null,
    Requirement: null,
    ExperienceLevelID: null,
    ContractTypeID: null,
    EmploymentTypeID: null,
    JobDescription: null,
    JobRequirements: null,
    JobApplicationID: null,
    LocationID: null,
    Slots: null,
    AmountFrom: null,
    AmountTo: null,
    isConfidential: 0,
    isPublished: 0,
    Introduction: null,
    ProgrammeTypeID: null,
    QualificationID: null,
    YearsofExperienceID: null,
    StateID: null,
    LGAID: null,
    local_govt: null,
    ProfessionID: null,
    GenderID: null,
    Photo: null,
    PhotoString: null,
  };

  displayForm = false;
  operation = "Add";
  title = "Vacancy";
  parent = "Recruitment";
  contracttype = [];
  employmenttype = [];
  experiencelevel = [];
  jobapplication = [];
  States = []; 
  lgas = [];
  filteredLgas = [];
  Designation: any;
  branches: any;
  YearsOfExperience: any;
  programmetypes: any;
  professions: any;
  gender: any;
  FilteredLgaList: any[];
  qualifications: any;
  constructor(protected http: HttpService, private uploadService: UploadService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(recruitmentUrl.vacancy.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
    this.http.get(companyUrl.designations.list).subscribe(
      (res) => {
        this.Designation = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
    this.http.get(recruitmentUrl.contracttype.list).subscribe(
      (res) => {
        this.contracttype = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(recruitmentUrl.employmenttype.list).subscribe(
      (res) => {
        this.employmenttype = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(recruitmentUrl.experiencelevel.list).subscribe(
      (res) => {
        this.experiencelevel = res.data;
      },
      (error) => {
        console.log(error);
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

    this.http.get(educationUrl.programmetypes.list).subscribe(
      (res) => {
        this.programmetypes = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.yearsofexperience.list).subscribe(
      (res) => {
        this.YearsOfExperience = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(companyUrl.branches.list).subscribe(
      (res) => {
        this.branches = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.state.list).subscribe(
      (res) => {
        this.States = res.data.filter((i) => i.country_id === "151");
        console.log(this.States);
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.local_govt.list).subscribe(
      (res) => {
        this.lgas = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.gender.list).subscribe(
      (res) => {
        this.gender = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(recruitmentUrl.professions.list).subscribe(
      (res) => {
        this.professions = res.data;
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
  }

  handleFileInputIdentification(e) {
    console.log(e);
    let file = e.target.files[0];
    console.log(file);

    const formData: FormData = new FormData();
    formData.append("file", file, file.name);

    this.uploadService
      .upload(formData, `http://localhost/api.teamerp/photo`)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.obj.PhotoString = res.data;
          // this.insertRecord(res.data)
        },
        (error) => console.log(error)
      );
  }

  onStateChange(e) {
    this.filteredLgas = this.lgas.filter((i) => i.state_id === e.state_id);
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
    let url = recruitmentUrl.vacancy.add;
    if (this.operation === "Update") {
      url = recruitmentUrl.vacancy.update;
    }
    this.save(url);
  }

  save(url) {
    console.log(this.obj);
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
    console.log(id);
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.obj.isConfidential = Number(this.obj.isConfidential);
    this.obj.isPublished = Number(this.obj.isPublished);
    this.FilteredLgaList = this.lgas.filter(i => i.state_id == id.row.data.StateID)
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = {
      Title: null,
      DeadLine: null,
      DesignationID: null,
      Requirement: null,
      ExperienceLevelID: null,
      ContractTypeID: null,
      EmploymentTypeID: null,
      JobDescription: null,
      JobRequirements: null,
      JobApplicationID: null,
      LocationID: null,
      Slots: null,
      AmountFrom: null,
      AmountTo: null,
      isConfidential: null,
      isPublished: null,
      Introduction: null,
      ProgrammeTypeID: null,
      QualificationID: null,
      YearsofExperienceID: null,
      StateID: null,
      LGAID: null,
      local_govt: null,
      ProfessionID: null,
      GenderID: null,
      Photo: null,
      PhotoString: null
    };
    this.hideForm();
    this.operation = "Add";
  }
}