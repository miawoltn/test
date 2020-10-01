import { companyUrl } from 'src/app/company/company-url';
import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { educationUrl } from "../education-url";
import swal from "sweetalert2";
@Component({
  selector: "app-gradelevels",
  templateUrl: "./gradelevels.component.html",
  styleUrls: ["./gradelevels.component.scss"],
})
export class GradelevelsComponent implements OnInit {
  displayedColumns: string[] = [
    "GradeLevelName",
    "GradeLevelCode",
    "AnnualSalary",
    "CompanyID",
    "GradeID",
  ];
  data = [];
  obj = {
    GradeLevelName: null,
    GradeLevelCode: null,
    AnnualSalary: null,
    CompanyID: null,
    GradeID: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Grade Levels";
  parent = "Education";
  grades: any;
  company: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(educationUrl.gradelevels.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(educationUrl.grades.list).subscribe(
      (res) => {
        this.grades = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(companyUrl.company.list).subscribe(
      (res) => {
        this.company = res.data;
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
    let url = educationUrl.gradelevels.add;
    if (this.operation == "Update") url = educationUrl.gradelevels.update;
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
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = {
      GradeLevelName: null,
      GradeLevelCode: null,
      AnnualSalary: null,
      CompanyID: null,
      GradeID: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
