import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MyPaySlipsComponent } from './my-pay-slips/my-pay-slips.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ViewPaySlipComponent } from './view-pay-slip/view-pay-slip.component';
import { EmployeeProfileComponent } from './employee-profile/employee-profile.component';
import { EmployeeProfile2Component } from './employee-profile-2/employee-profile-2.component';


const routes: Routes = [
  {
    path: '',
    data: { breadcrumb: 'Self Service' },
    children: [
      { path: 'payslip', component: MyPaySlipsComponent, data: { breadcrumb: 'Payroll History' } },
      { path: 'view-slip/:id/:id2', component: ViewPaySlipComponent, data: { breadcrumb: 'Pay Slip' } },
      { path: '', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
      { path: 'dashboard', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
      { path: 'profile', component: DashboardComponent, data: { breadcrumb: 'My Profile' } },
    { path: 'employee-profile', component: EmployeeProfileComponent, data: { breadcrumb: 'Dashboard' } },
    { path: 'employee-profile/:id', component: EmployeeProfile2Component, data: { breadcrumb: 'Dashboard' } }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SelfServiceRoutingModule { }
