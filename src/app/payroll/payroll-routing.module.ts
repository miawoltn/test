
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PayrollcategoryComponent } from './payrollcategory/payrollcategory.component';
import { PayrollgeneratedComponent } from './payrollgenerated/payrollgenerated.component';
import { PayrollgenerateddetailComponent } from './payrollgenerateddetail/payrollgenerateddetail.component';
import { PayrollinstancesComponent } from './payrollinstances/payrollinstances.component';
import { PayrollinstancetypesComponent } from './payrollinstancetypes/payrollinstancetypes.component';
import { PayrollperiodComponent } from './payrollperiod/payrollperiod.component';
import { PayrollyearComponent } from './payrollyear/payrollyear.component';
import { PayrollledgerComponent } from './payrollledger/payrollledger.component';
import { PayrollreportComponent } from './payrollreport/payrollreport.component';
import { ProcesstypeComponent } from './processtype/processtype.component';
import { NetpayReportComponent } from './netpay-report/netpay-report.component';
import { BatchPayslipComponent } from './batch-payslip/batch-payslip.component';
import { ProcesspayrollComponent } from './processpayroll/processpayroll.component';
import { CancelPayrollComponent } from './cancel-payroll/cancel-payroll.component';
import { Processpayroll2Component } from './process-payroll/process-payroll.component';
import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Payroll' },
  children: [
    { path: 'payrollcategory', component: PayrollcategoryComponent, data: { breadcrumb: 'Payroll Category' } },
    { path: 'payrollgenerated', component: PayrollgeneratedComponent, data: { breadcrumb: 'Payroll Generated' } },
    { path: 'payrollgenerateddetail', component: PayrollgenerateddetailComponent, data: { breadcrumb: 'Payroll Detail' } },
    { path: 'payrollinstances', component: PayrollinstancesComponent, data: { breadcrumb: 'Payroll Instances' } },
    { path: 'payrollinstancetypes', component: PayrollinstancetypesComponent, data: { breadcrumb: 'Payroll Instance Types' } },
    { path: 'payrollperiod', component: PayrollperiodComponent, data: { breadcrumb: 'Payroll Period' } },
    { path: 'payrollyear', component: PayrollyearComponent, data: { breadcrumb: 'Payroll Year' } },
    { path: 'payrollledger', component: PayrollledgerComponent, data: { breadcrumb: 'Payroll Ledger' } },
    { path: 'payrollreport', component: PayrollreportComponent, data: { breadcrumb: 'Payroll Report' } },
    { path: 'processtype', component: ProcesstypeComponent, data: { breadcrumb: 'Process Type' } },
    { path: 'payrolldetail', component: NetpayReportComponent, data: { breadcrumb: 'Payroll Report' } },
    { path: 'batch-slip', component: BatchPayslipComponent, data: { breadcrumb: 'Batch Pay Slip' } },
    { path: 'process', component: ProcesspayrollComponent, data: { breadcrumb: 'Process Payroll' } },
    { path: '', component: Processpayroll2Component, data: { breadcrumb: 'Process Payroll' } },
    { path: 'dashboard', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
    { path: 'cancel', component: CancelPayrollComponent, data: { breadcrumb: 'Cancel Payroll' } },
  ]
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PayrollRoutingModule { }

