import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { purchaseUrl } from '../purchase-url';
import { procurementUrl } from 'src/app/procurement/procurement-url';
import { storeUrl } from 'src/app/store/store-url';
import swal from 'sweetalert2';
import { approvalUrl } from 'src/app/approval/approval-url';
import { MatStepper } from '@angular/material/stepper';
@Component({
    selector: 'app-purchase',
    templateUrl: './purchase.component.html',
    styleUrls: ['./purchase.component.scss'],
})
export class PurchaseComponent implements OnInit {
    @ViewChild('stepper' ,{ static: true }) private myStepper: MatStepper;

    isEditable = true;
    isLinear = true;

    displayedColumns: string[] = [
        'ProcurementDate',
        'PurchaseType',
        'StoreName',
        'PurchaseDate',
        'RequestBy',
        'ApprovalStages',
        'ApprovalOfficerID',
    ];
    data = [];
    obj = {
        ProcurementID: null,
        PurchaseTypeID: null,
        StoreID: null,
        PurchaseDate: null,
        RequestBy: null,
        ApprovalStagesID: null,
        ApprovalOfficerID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Purchase';
    parent = 'purchase';
    approvalstages = [];
    procurement = [];
    purchasetype = [];
    stores = [];
    procurementDetails: any;
    procurementDetails2: { ProcurementID: unknown; ProcurementTitle: any, VendorID: null, VendorName: null }[];
    filteredDetails: void;
    vendorDetails = []
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(procurementUrl.procurementdetails.procurementDetails).subscribe(
            (res) => {
                this.procurementDetails = res.data;
                console.log(this.procurementDetails);

                let procurementDetails = Array.from(new Set(this.procurementDetails.map(i => i.ProcurementID))).map(ProcurementID => {
                    return {
                        ProcurementID: ProcurementID,
                        ProcurementTitle: this.procurementDetails.find(i => i.ProcurementID == ProcurementID).ProcurementTitle,
                        VendorID: this.procurementDetails.find(i => i.ProcurementID == ProcurementID).VendorID,
                        VendorName: this.procurementDetails.find(i => i.ProcurementID == ProcurementID).VendorName,
                    }
                })
                this.procurementDetails2 = procurementDetails;

                // console.log(this.procurementDetails2);

                // for (let i = 0; i < this.procurementDetails2.length; i++) {
                //     let data = {vendor: {}, details: []};
                //     data.vendor = this.procurementDetails2[i];
                //     console.log(data);
                //     this.vendorDetails.push(data);
                //     console.log(this.vendorDetails);

                //     // for (let i = 0; i < this.vendorDetails.length; i++) {
                //     //     console.log(this.vendorDetails[i].vendor.VendorID);

                //     //     let data = this.procurementDetails.filter(i => i.VendorID == this.vendorDetails[i].vendor.VendorID)
                //     //     console.log(data);
                //     // }
                //     // console.log(this.vendorDetails);
                // }
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(purchaseUrl.purchase.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(procurementUrl.procurement.list).subscribe(
            (res) => {
                this.procurement = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(purchaseUrl.purchasetype.list).subscribe(
            (res) => {
                this.purchasetype = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(storeUrl.stores.list).subscribe(
            (res) => {
                this.stores = res.data;
            },
            (error) => {
                console.log(error);
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
    }

    getProcurementDetails(e) {
        console.log(e);
        swal.showLoading();
        this.filteredDetails = this.procurementDetails.filter(i => i.ProcurementID == e.ProcurementID);
        console.log(this.filteredDetails);
        swal.hideLoading()
    }

    info: any;
    vendors = [];
    details = [];
    showProcurementInfo = false;
    showProcurementDetail = false;
    showProcurementInfo2 = false;
    loadData(data) {
        console.log(data);
        swal.showLoading();
        this.http.get(procurementUrl.procurementdetails.procurementdetailsByProcurementIDAndSeleted + data.ProcurementID).subscribe(
            (res) => {
                this.showProcurementInfo = true;
                this.showProcurementDetail = true;
                this.showProcurementInfo2 = false;
                this.info = res.data.info[0];
                console.log(this.info);
                this.vendors = res.data.vendor;
                this.details = res.data.detail;
                swal.close();

            },
            (error) => {
                console.log(error);
            }
        );
    }

    filterData(data) {
        return this.details.filter(i => i.VendorID == data);
    }

    onConfirm() {
        alert("submitted");
        this.showProcurementInfo = false;
        this.showProcurementDetail = false;
        this.showProcurementInfo2 = true;
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
        //console.log(e);
        // let url = purchaseUrl.purchase.add;
        // if (this.operation == 'Update') url = purchaseUrl.purchase.update;
        // this.save(url);
    }

    save(url) {
        this.http.post(url, this.obj).subscribe(
            (res) => {
                this.data = res.data;
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
            ProcurementID: null,
            PurchaseTypeID: null,
            StoreID: null,
            PurchaseDate: null,
            RequestBy: null,
            ApprovalStagesID: null,
            ApprovalOfficerID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
