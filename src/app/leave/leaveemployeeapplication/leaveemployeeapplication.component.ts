import { settingsUrl } from 'src/app/settings/settings-url';
import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { leaveUrl } from "../leave-url";
import swal from "sweetalert2";
import { employeeUrl } from "src/app/employee/employee-url";
@Component({
  selector: "app-leaveemployeeapplication",
  templateUrl: "./leaveemployeeapplication.component.html",
  styleUrls: ["./leaveemployeeapplication.component.scss"],
})
export class LeaveemployeeapplicationComponent implements OnInit {
  displayedColumns: string[] = [
    "YearID",
    "EmployeeID",
    "NoDayEntitled",
    "LeaveTypeID",
  ];
  data = [];
  obj = {
    YearID: null,
    EmployeeID: null,
    NoDayEntitled: null,
    LeaveTypeID: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Employee Leave Application";
  parent = "Leave";
  year = [];
  leavetype = [];
  employees = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.leaveemployeeapplication.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
    this.http.get(leaveUrl.leavetype.list).subscribe(
      (res) => {
        this.leavetype = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(employeeUrl.employee.list).subscribe(
      (res) => {
        this.employees = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(settingsUrl.year.list).subscribe(
      (res) => {
        this.year = res.data;
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
    let url = leaveUrl.leaveemployeeapplication.add;
    if (this.operation === "Update") {
      url = leaveUrl.leaveemployeeapplication.update;
    }
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
      YearID: null,
      EmployeeID: null,
      NoDayEntitled: null,
      LeaveTypeID: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
