import { Component, OnInit } from '@angular/core';
import { essUrl } from '../es-url';
import { HttpService } from 'src/app/services/http.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-view-pay-slip',
  templateUrl: './view-pay-slip.component.html',
  styleUrls: ['./view-pay-slip.component.css']
})
export class ViewPaySlipComponent implements OnInit {

  data = [];
  data2 = [];
  earnings = 0;
  deductions = 0;
  reliefs = 0;
  netpay = 0;
  nettaxable = 0;
  constructor(protected http: HttpService, public route: ActivatedRoute) {

  }

  ngOnInit() {
    this.http.post(essUrl.payroll.payslip, { id: this.route.snapshot.params.id, PayrollPeriodID: this.route.snapshot.params.id2 })
      .subscribe(res => {
        this.data = res.data;

        const earnData = this.data.filter(i => i.SalaryTypeID == 1);
        const dedData = this.data.filter(i => i.SalaryTypeID == 2);
        const reliefData = this.data.filter(i => i.SalaryTypeID == 3);

        this.earnings = earnData.reduce((a, b) => {
          return Number(a) * 1.0 + Number(b.Amount) * 1.0;
        }, 0);

        this.deductions = dedData.reduce((a, b) => {
          return a * 1.0 + b.Amount * 1.0;
        }, 0);
        this.reliefs = reliefData.reduce((a, b) => {
          return a * 1.0 + b.Amount * 1.0;
        }, 0);

        this.netpay = this.earnings + this.deductions;
        this.nettaxable = this.earnings - this.reliefs;

      }, err => { console.log(err); });
  }

  filterData(data, value) {
    return data.filter(i => i.SalaryTypeID == value);
  }

}
