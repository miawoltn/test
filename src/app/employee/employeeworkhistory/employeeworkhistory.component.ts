import { Component, OnInit, ViewChild, Input } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { employeeUrl } from "../employee-url";
import swal from "sweetalert2";
@Component({
  selector: "app-employeeworkhistory",
  templateUrl: "./employeeworkhistory.component.html",
  styleUrls: ["./employeeworkhistory.component.scss"],
})
export class EmployeeworkhistoryComponent implements OnInit {
  @Input() id: any;
  data = [];
  obj = {
    EmployeeID: null,
    EmployeeName: null,
    Address: null,
    PhoneNumber: null,
    EmailAddress: null,
    JobTitle: null,
    JobDescription: null,
    StartDate: null,
    EndDate: null,
    IsPresent: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Employeeworkhistory";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http
      .get(employeeUrl.employeeworkhistory.getbyempid + this.id)
      .subscribe(
        (success) => {
          this.data = success.data;
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
    this.obj.EmployeeID = this.id;
    // let url = employeeUrl.employeeworkhistory.add;
    let url = employeeUrl.employeeworkhistory.update;
    this.save(url);
    // if (this.operation === "Update") {
    //   url = employeeUrl.employeeworkhistory.update;
    //   this.save(url);
    // } else {
    //   this.add(url);
    // }
    // e.preventDefault();
  }

  save(url) {
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
    if (this.obj.IsPresent == null ) {
      this.obj.IsPresent = 0;
    } else if (this.obj.IsPresent == "0") {
      this.obj.IsPresent = 0;
    } else if (this.obj.IsPresent == '1') {
      this.obj.IsPresent = 1;
    }
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = {
      EmployeeID: null,
      EmployeeName: null,
      Address: null,
      PhoneNumber: null,
      EmailAddress: null,
      JobTitle: null,
      JobDescription: null,
      StartDate: null,
      EndDate: null,
      IsPresent: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
