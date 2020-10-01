
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PayrollRoutingModule } from './payroll-routing.module';
import { PayrollcategoryComponent } from './payrollcategory/payrollcategory.component'
import { PayrollgeneratedComponent } from './payrollgenerated/payrollgenerated.component'
import { PayrollgenerateddetailComponent } from './payrollgenerateddetail/payrollgenerateddetail.component'
import { PayrollinstancesComponent } from './payrollinstances/payrollinstances.component'
import { PayrollinstancetypesComponent } from './payrollinstancetypes/payrollinstancetypes.component'
import { PayrollperiodComponent } from './payrollperiod/payrollperiod.component'
import { PayrollyearComponent } from './payrollyear/payrollyear.component';
import { FormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatStepperModule } from '@angular/material/stepper';
import { NgSelectModule } from '@ng-select/ng-select';
import {
	DxSelectBoxModule,
	DxTextAreaModule,
	DxDateBoxModule,
	DxFormModule,
	DxDataGridModule,
	DxSpeedDialActionModule,
	DxPivotGridModule, DxChartModule, DxPieChartModule
} from 'devextreme-angular';
import { PayrollledgerComponent } from './payrollledger/payrollledger.component';
import { PayrollreportComponent } from './payrollreport/payrollreport.component';
import { ProcesstypeComponent } from './processtype/processtype.component';
import { NetpayReportComponent } from './netpay-report/netpay-report.component';
import { BatchPayslipComponent } from './batch-payslip/batch-payslip.component';
import { ProcesspayrollComponent } from './processpayroll/processpayroll.component';
import { Processpayroll2Component } from './process-payroll/process-payroll.component';
import { CancelPayrollComponent } from './cancel-payroll/cancel-payroll.component';
import { PayrollModalComponent } from './payroll-modal/payroll-modal.component';
import { DashboardComponent } from './dashboard/dashboard.component';

@NgModule({
	imports: [
		CommonModule,
		PayrollRoutingModule,
		FormsModule,
		NgSelectModule,
		MatStepperModule,
		MatIconModule,
		DxSelectBoxModule,
		DxTextAreaModule,
		DxDateBoxModule,
		DxFormModule,
		DxDataGridModule,
		DxSpeedDialActionModule,
		DxPivotGridModule, DxChartModule, DxPieChartModule
	],
	declarations: [PayrollcategoryComponent, PayrollgeneratedComponent, PayrollgenerateddetailComponent, PayrollinstancesComponent,
		PayrollinstancetypesComponent, PayrollperiodComponent, PayrollyearComponent, PayrollledgerComponent, PayrollreportComponent,
		ProcesstypeComponent, NetpayReportComponent, BatchPayslipComponent, ProcesspayrollComponent, DashboardComponent,
		Processpayroll2Component, CancelPayrollComponent, PayrollModalComponent],
})
export class PayrollModule { }

