import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
import { companyUrl } from "src/app/company/company-url";
import { API_URL } from 'src/app/services/app-config';
@Component({
  selector: "app-joboffer",
  templateUrl: "./joboffer.component.html",
  styleUrls: ["./joboffer.component.scss"],
})
export class JobofferComponent implements OnInit {
  API_URL2 = API_URL;

  displayedColumns: string[] = [
    "FirsName",
    "AnnualSalary",
    "OtherVariables",
    "OfferDate",
    "OfferResponseID",
    "ResponseDate",
    "DesignationID",
    "ApplicantID",
  ];
  data = [];
  obj = {
    ApplicantID: null,
    Applicant: null,
    ApplicantCV: null,
    Attachment: null,
    AnnualSalary: null,
    OtherVariables: null,
    OfferDate: null,
    OfferResponseID: null,
    ResponseDate: null,
    DesignationID: null,
    JobApplicationID: null,
    DesignationName: null,
    HousingAllowance: null,
    TransportAllowance: null,
    UtilityAllowance: null,
    MealSubsidy: null,
    FixedOverTime: null,
    refNumber: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Joboffer";
  parent = "recruitment";
  applicants = [];
  jobapplication = [];
  Designation: any;
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.jobOfferBin();

    // this.http.get(recruitmentUrl.joboffer.list).subscribe(
    //     (res) => {
    //         this.data = res.data;
    //     },
    //     (err) => {
    //         console.log(err);
    //     }
    // );

    this.http.get(recruitmentUrl.applicants.list).subscribe(
      (res) => {
        this.applicants = res.data;
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
    this.http.get(recruitmentUrl.jobinterviewdetail.jobOfferBin2).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
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
    let url = recruitmentUrl.joboffer.add;
    // if (this.operation == 'Update') url = recruitmentUrl.joboffer.update;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj).subscribe(
      (res) => {
        this.jobOfferBin();
        // this.data = res.data;
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
    console.log(this.obj);
    this.operation = "Create Job Offer";
    this.showForm();
  }

  resetForm() {
    this.obj = {
      ApplicantID: null,
      Applicant: null,
      ApplicantCV: null,
      Attachment: null,
      AnnualSalary: null,
      OtherVariables: null,
      OfferDate: null,
      OfferResponseID: null,
      ResponseDate: null,
      DesignationID: null,
      JobApplicationID: null,
      DesignationName: null,
      HousingAllowance: null,
      TransportAllowance: null,
      UtilityAllowance: null,
      MealSubsidy: null,
      FixedOverTime: null,
      refNumber: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
