import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { payrollUrl } from '../payroll-url';

@Component({
  selector: 'app-batch-payslip',
  templateUrl: './batch-payslip.component.html',
  styleUrls: ['./batch-payslip.component.css']
})
export class BatchPayslipComponent implements OnInit {

  data = [];
  data2 = [];
  obj = { PayrollID: null };
  payrollperiod = [];
  constructor(protected http: HttpService) { }

  ngOnInit() {

    this.http.get(payrollUrl.payrollperiod.processed)
      .subscribe(success => {
        this.payrollperiod = success.data;
        swal.close();
      }, error => { console.log(error); });

  }

  filterData(data, value) {
    return data.filter(i => i.SalaryTypeID == value);
  }

  arrayToJSONObject(arr) {
    //header
    var keys = arr[0];

    //vacate keys from main array
    var newArr = arr.slice(1, arr.length);

    var formatted = [],
      data = newArr,
      cols = keys,
      l = cols.length;
    for (var i = 0; i < data.length; i++) {
      var d = data[i],
        o = {};
      for (var j = 0; j < l; j++)
        o[cols[j]] = d[j];
      formatted.push(o);
    }
    return formatted;
  }


  onPrint(){
    window.print();
  }

  processForm() {
    swal.showLoading();
    this.http.post(payrollUrl.payrollgenerated.details2, this.obj)
      .subscribe(success => {
        this.data = success.data;
        this.data2 = this.data.reduce((r, a) => {
          // console.log('a', a);
          // console.log('r', r);
          r[a.EmployeeID] = [...r[a.EmployeeID] || [], a];
          return r;
        }, {});
        //console.log('group', this.data2);
        const x = Object.keys(this.data2);
        this.data2 = [];
        x.forEach(item => {
          const dat = this.data.filter(i => i.EmployeeID === item);
          const earnData = dat.filter(i => i.SalaryTypeID == 1);
          const dedData = dat.filter(i => i.SalaryTypeID == 2);
          const reliefData = dat.filter(i => i.SalaryTypeID == 3);

          const earnings = earnData.reduce((a, b) => {
            console.log('a', a);
            console.log('b', b);
            return Number(a) * 1.0 + Number(b.Amount) * 1.0;
          }, 0);

          const deductions = dedData.reduce((a, b) => {
            return a * 1.0 + b.Amount * 1.0;
          }, 0);
          const reliefs = reliefData.reduce((a, b) => {
            return a * 1.0 + b.Amount * 1.0;
          }, 0);

          this.data2.push({
            id: item, data: dat, gross: earnings, deduction: deductions, netpay: earnings + deductions,
            relief: reliefs, nettaxable: earnings - reliefs
          });

        });

        swal.close();
      }, error => {
        swal.close();
        console.log(error);
      });
  }


}
