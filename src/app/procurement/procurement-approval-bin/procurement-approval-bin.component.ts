import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { procurementUrl } from '../procurement-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';

@Component({
  selector: 'app-procurement-approval-bin',
  templateUrl: './procurement-approval-bin.component.html',
  styleUrls: ['./procurement-approval-bin.component.scss'],
})
export class ProcurementApprovalBinComponent implements OnInit {
  displayedColumns: string[] = [];
  data = [];
  obj = {};

  displayForm = false;
  operation = 'Add';
  title = 'Procurement';
  parent = 'procurement';

  constructor(
    protected http: HttpService,
    private router: Router
  ) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(procurementUrl.procurement.procurementApprovalBin).subscribe(
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
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() {
    this.displayForm = false;
  }

  loadItem(id) {
    const ProcurementID = id.row.data.id;
    this.router.navigate(['procurement/procurement-approval', ProcurementID]);
  }
}
