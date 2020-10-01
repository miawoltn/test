import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { procurementUrl } from '../procurement-url';
import swal from 'sweetalert2';
import { ActivatedRoute, Router } from '@angular/router';

// import * as Survey from "survey-angular";
@Component({
  selector: 'app-procurement-approval',
  templateUrl: './procurement-approval.component.html',
  styleUrls: ['./procurement-approval.component.scss'],
})
export class ProcurementApprovalComponent implements OnInit {

  // survey: any;

  displayedColumns: string[] = [];
  data = [];
  obj = [{
    Action: null,
    ApprovalOfficerID: null,
    ApprovalStagesID: null,
    CreatedBy: null,
    DateCreated: null,
    DateModified: null,
    ModifiedBy: null,
    Price: null,
    ProcurementDetailsID: null,
    ProcurementID: null,
    ProcurementTitle: null,
    Quantity: null,
    RequestBy: null,
    VendorID: null,
    id: null,
    Equipment: null,
    EquipmentID: null,
    Vendor: null,
    selected: false
  }];

  displayForm = false;
  operation = 'Add';
  title = 'Procurement';
  parent = 'Procurement';
  ProcurementID: any;
  ProcurementTitle: any;
  Vendors: any[];
  rows = [];
  VendorList = [
    { vendorid: 1, price: 200, Action: null },
    { vendorid: 2, price: 250, Action: null }
  ]
  EquipmentVendorLis = [
    {
      equipment: { equipmentid: null, equipment: null, qty: null },
      vendors: [
        {
          Action: null,
          ApprovalOfficerID: null,
          ApprovalStagesID: null,
          CreatedBy: null,
          DateCreated: null,
          DateModified: null,
          ModifiedBy: null,
          Price: null,
          ProcurementDetailsID: null,
          ProcurementID: null,
          ProcurementTitle: null,
          Quantity: null,
          RequestBy: null,
          VendorID: null,
          id: null,
          Equipment: null,
          EquipmentID: null,
          Vendor: null,
          selected: false
        }
      ]
    }
  ];
  Equipment: any[];
  constructor(
    protected http: HttpService,
    protected route: ActivatedRoute,
    private router: Router
  ) {
    this.ProcurementID = this.route.snapshot.params.id;
    console.log("ProcurementApprovalComponent -> this.ProcurementID", this.ProcurementID)
  }

  ngOnInit() {
    this.http.get(procurementUrl.procurement.procurementApprovalDetail + this.ProcurementID).subscribe(
      (res) => {
        console.log(res.data)
        this.obj = res.data;
        this.ProcurementTitle = this.obj[0].ProcurementTitle;
        // filter distinct vendors
        this.Vendors = [...new Set(this.obj.map(i => i.Vendor))]
        // filter distinct equipment
        let Equipments = Array.from(new Set(this.obj.map(i => i.EquipmentID))).map(EquipmentID => {
          return {
            EquipmentID: EquipmentID,
            Equipment: this.obj.find(i => i.EquipmentID == EquipmentID).Equipment,
            Qty: this.obj.find(i => i.EquipmentID === EquipmentID).Quantity,
            Action: this.obj.find(i => i.EquipmentID === EquipmentID).Action
          }
        })

        // generate formated list
        this.EquipmentVendorLis.pop();
        for (let i = 0; i < Equipments.length; i++) {
          let item = {
            equipment: { equipmentid: null, equipment: null, qty: null },
            vendors: []
          }
          // push equipments
          item.equipment.equipmentid = Equipments[i].EquipmentID;
          item.equipment.equipment = Equipments[i].Equipment;
          item.equipment.qty = Equipments[i].Qty;
          this.EquipmentVendorLis.push(item)
        }
        // push vendors
        for (let i = 0; i < this.EquipmentVendorLis.length; i++) {
          let vendors = this.obj.filter(x => x.EquipmentID == this.EquipmentVendorLis[i].equipment.equipmentid)
          for (let x = 0; x < vendors.length; x++) {
            this.EquipmentVendorLis[i].vendors.push(vendors[x])
          }
          console.log(this.EquipmentVendorLis)
        }
      },
      (err) => {
        console.log(err);
      }
    );
  }

  changeAction(i, x) {
    this.EquipmentVendorLis[i].vendors.forEach(item => item.selected = false);
    this.EquipmentVendorLis[i].vendors[x].selected = true;
  }

  processForm() {
    let url = procurementUrl.procurementdetails.update;
    this.save(url);
  }

  save(url) {
    // console.log(this.obj);
    this.http.post(url, this.obj).subscribe(
      (res) => {
        swal.fire('Process Complete', res.message, 'success');
        this.router.navigate(['procurement/procurement-approval-bin']);
      },
      (err) => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      }
    );
  }

  resetForm() {

  }
}
