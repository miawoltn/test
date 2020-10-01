import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { procurementUrl } from '../procurement-url';
import swal from 'sweetalert2';
import { approvalUrl } from 'src/app/approval/approval-url';
import { vendorUrl } from 'src/app/vendor/vendor-url';
import { settingsUrl } from 'src/app/settings/settings-url';
@Component({
  selector: 'app-procurement',
  templateUrl: './procurement.component.html',
  styleUrls: ['./procurement.component.scss'],
})
export class ProcurementComponent implements OnInit {
  displayedColumns: string[] = [
    'ProcurementTitle',
    'ProcurementDate',
    'RequestBy',
    'ApprovalStages',
    'ApprovalOfficerID',
  ];
  data = [];
  ProcurementVendors = []
  obj = {
    ProcurementTitle: null,
    RequestBy: null,
    ApprovalStagesID: null,
    ApprovalOfficerID: null,
  };

  procurementVendors = [{ VendorID: null }]

  procurementDetail = [{
    VendorID: null,
    EquipmentID: null,
    Price: null,
    Quantity: null,
    Total: null
  }]

  displayForm = false;
  operation = 'Add';
  title = 'Procurement';
  parent = 'procurement';
  approvalstages = [];
  vendors: any = [];
  Equipments: any;
  ProcurementVendorsList: any;
  ProcurementID: any;
  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(procurementUrl.procurement.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
    this.http.get(approvalUrl.approvalstages.list).subscribe(
      (res) => {
        this.approvalstages = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(vendorUrl.vendors.list).subscribe(
      (res) => {
        this.vendors = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.equipment.list).subscribe(
      (res) => {
        this.Equipments = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() {
    this.displayForm = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = procurementUrl.procurement.add;
    if (this.operation == 'Update') url = procurementUrl.procurement.update;
    this.save(url);
  }

  save(url) {
    const data = {
      procurement: this.obj,
      procurementVendors: this.procurementVendors
    }
    console.log(data);
    this.http.post(url, data).subscribe(
      (res) => {
        this.ProcurementVendors = res.data;
        this.ProcurementID = res.ProcurementID;
        swal.fire('Process Complete', res.message, 'success');
      },
      (err) => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      }
    );
  }

  processProcurementDetails() {
    // calculate total price
    for (let i = 0; i < this.procurementDetail.length; i++) {
      this.procurementDetail[i].Total = Number(this.procurementDetail[i].Quantity * this.procurementDetail[i].Price);
    }

    let url = procurementUrl.procurementdetails.add;
    // if (this.operation == 'Update') url = procurementUrl.procurementdetails.update;
    this.saveProcurementDetails(url);
  }

  saveProcurementDetails(url) {
    const data = {
      ProcurementID: this.ProcurementID,
      procurementDetails: this.procurementDetail
    }
    console.log(data);
    this.http.post(url, data).subscribe(
      (res) => {
        // this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        this.resetForm();
      },
      (err) => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      }
    );
  }

  loadItem(id) {
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      ProcurementTitle: null,
      RequestBy: null,
      ApprovalStagesID: null,
      ApprovalOfficerID: null,
    };
    this.hideForm();
    this.resetProcurementDetail();
    this.ProcurementVendors = [];
    this.operation = 'Add';
  }

  addProcurementDetail() {
    this.procurementDetail.push({
      VendorID: null,
      EquipmentID: null,
      Price: null,
      Quantity: null,
      Total: null
    });
  }

  removeProcurementDetail(i) {
    this.procurementDetail.splice(i, 1);
  }

  resetProcurementDetail() {
    this.procurementDetail = [
      {
        VendorID: null,
        EquipmentID: null,
        Price: null,
        Quantity: null,
        Total: null
      },
    ];
  }

  addProcurementVendors() {
    this.procurementVendors.push({
      VendorID: null
    });
  }

  removeProcurementVendors(i) {
    this.procurementVendors.splice(i, 1);
  }

  resetProcurementVendors() {
    this.procurementVendors = [
      {
        VendorID: null
      }
    ];
  }
}
