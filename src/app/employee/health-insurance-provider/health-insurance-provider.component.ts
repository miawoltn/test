import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { employeeUrl } from "../employee-url";
import swal from "sweetalert2";
@Component({
  selector: "app-health-insurance-provider",
  templateUrl: "./health-insurance-provider.component.html",
  styleUrls: ["./health-insurance-provider.component.scss"],
})
export class HealthInsuranceProviderComponent implements OnInit {
  displayedColumns: string[] = ["HealthInsuranceProvider"];
  data = [];
  obj = { HealthInsuranceProvider: null };
  displayForm = false;
  operation = "Add";
  title = "Health Insurance Provider";
  parent = "Employee - Settings";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(employeeUrl.healthinsuranceprovider.list).subscribe(
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
    let url = employeeUrl.healthinsuranceprovider.add;
    if (this.operation == "Update") url = employeeUrl.healthinsuranceprovider.update;
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
    this.obj = { HealthInsuranceProvider: null };
    this.hideForm();
    this.operation = "Add";
  }
}
