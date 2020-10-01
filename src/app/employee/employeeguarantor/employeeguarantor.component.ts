import { Component, OnInit, ViewChild, Input } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { employeeUrl } from "../employee-url";
import swal from "sweetalert2";
@Component({
  selector: "app-employeeguarantor",
  templateUrl: "./employeeguarantor.component.html",
  styleUrls: ["./employeeguarantor.component.scss"],
})
export class EmployeeguarantorComponent implements OnInit {
  @Input() id: any;
  data = [];
  obj = {
    GuarantorName: null,
    Address: null,
    PhoneNumber: null,
    JobTitle: null,
    Email: null,
    EmployeeID: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Employeeguarantor";
  parent = "employee";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(employeeUrl.employeeguarantor.getbyempid + this.id).subscribe(
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
    this.obj.EmployeeID = this.id;
    let url = employeeUrl.employeeguarantor.add;
    if (this.operation === "Update") {
      url = employeeUrl.employeeguarantor.update;
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
      GuarantorName: null,
      Address: null,
      PhoneNumber: null,
      JobTitle: null,
      Email: null,
      EmployeeID: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
