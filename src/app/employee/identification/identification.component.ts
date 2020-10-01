import { settingsUrl } from './../../settings/settings-url';
import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { employeeUrl } from "../employee-url";
import swal from "sweetalert2";
@Component({
  selector: "app-identification",
  templateUrl: "./identification.component.html",
  styleUrls: ["./identification.component.scss"],
})
export class IdentificationComponent implements OnInit {
  displayedColumns: string[] = ["EmployeeType"];
  data = [];
  obj = { ResidencyID: null, Identification: null };
  displayForm = false;
  operation = "Add";
  title = "Means of Identification";
  parent = "Employee";
  residency = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(employeeUrl.identification.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(settingsUrl.residency.list).subscribe(
      (res) => {
        this.residency = res.data;
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
    let url = employeeUrl.identification.add;
    if (this.operation == "Update") url = employeeUrl.identification.update;
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
    this.obj = { ResidencyID: null, Identification: null };
    this.hideForm();
    this.operation = "Add";
  }
}
