import { ActivatedRoute } from '@angular/router';
import { Component, OnInit, Input, AfterViewInit } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { employeeUrl } from "../employee-url";
import swal from "sweetalert2";
import { educationUrl } from "src/app/education/education-url";
@Component({
  selector: "app-employeeeducation",
  templateUrl: "./employeeeducation.component.html",
  styleUrls: ["./employeeeducation.component.scss"],
})
export class EmployeeeducationComponent implements OnInit, AfterViewInit {
  @Input() id: any;
  data = [];
  obj = {
    Description: null,
    SchoolName: null,
    StartDate: null,
    EndDate: null,
    SchoolTypeID: null,
    ProgrammeTypeID: null,
    QualificationID: null,
    QualificationGradeID: null,
    EmployeeID: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Employee Education";
  employee = [];
  programmetypes = [];
  qualificationgrade = [];
  qualifications = [];
  schooltypes = [];
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }
  ngAfterViewInit(): void {
    setTimeout(() => this.loadData(), 1500);
  }
  loadData() {
    this.http.get(employeeUrl.employeeeducation.getbyempid + this.id).subscribe(
      (success) => {
        this.data = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }
  ngOnInit() {
    this.http.get(educationUrl.programmetypes.list).subscribe(
      (success) => {
        this.programmetypes = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(educationUrl.qualificationgrade.list).subscribe(
      (success) => {
        this.qualificationgrade = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(educationUrl.qualifications.list).subscribe(
      (success) => {
        this.qualifications = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(educationUrl.schooltypes.list).subscribe(
      (success) => {
        this.schooltypes = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
    console.log(this.id);
  }

  hideForm() {
    this.displayForm = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    this.obj.EmployeeID = this.id;
    let url = employeeUrl.employeeeducation.add;
    if (this.operation === "Update") {
      url = employeeUrl.employeeeducation.update;
      this.save(url);
    } else {
      this.add(url);
    }
    // e.preventDefault();
  }

  save(url) {
    console.log(this.obj);
    this.http.post(url, this.obj).subscribe(
      (success) => {
        this.data = success.data;
        swal.fire("Process Complete", success.message, "success");
        this.resetForm();
      },
      (error) => {
        console.log(error);
        swal.fire("Process Unsuccessful", error.error.message, "error");
      }
    );
  }
  add(url) {
    this.http.post(url, this.obj).subscribe(
      (success) => {
        this.data = success.data;
        swal.fire("Process Complete", success.message, "success");
        this.resetForm();
      },
      (error) => {
        console.log(error);
        swal.fire("Process Unsuccessful", error.error.message, "error");
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
      Description: null,
      SchoolName: null,
      StartDate: null,
      EndDate: null,
      SchoolTypeID: null,
      ProgrammeTypeID: null,
      QualificationID: null,
      QualificationGradeID: null,
      EmployeeID: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
