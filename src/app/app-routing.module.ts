import { LockscreenComponent } from './components/lockscreen/lockscreen.component';
import { ForgotPasswordComponent } from './components/forgot-password/forgot-password.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardLayoutComponent } from './layouts/dashboard-layout/dashboard-layout.component';
import { SimpleLayoutComponent } from './layouts/simple-layout/simple-layout.component';
import { LoginComponent } from './components/login/login.component';
import { AuthGuard } from './services/auth.guard';
// import { PreviewLayoutComponent } from './layouts/preview-layout/preview-layout.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { NewLayoutComponent } from './layouts/new-layout/new-layout.component';
import { CustomPreloadingStrategy } from './services/custom-preloading,strategy';
// import { PageComponent } from './page/page.component';
import { ChatInboxComponent } from './components/chat-inbox/chat-inbox.component';
import { ResetPasswordComponent } from './components/reset-password/reset-password.component';

const routes: Routes = [
    {
        path: '',
        component: NewLayoutComponent,
        canActivate: [AuthGuard],
        children: [
            { path: '', component: DashboardComponent },
            { path: 'dashboard', component: DashboardComponent },
            { path: 'chat-box', component: ChatInboxComponent },
        ],
        data: { delay: false, preload: true }
    },
    {
        path: '',
        component: DashboardLayoutComponent,
        canActivate: [AuthGuard],
        children: [
            {
                path: 'account',
                loadChildren: () => import('./account/account.module').then(m => m.AccountModule),
                data: { title: 'Finance', delay: true, preload: false }
            },
            {
                path: 'approval',
                loadChildren: () => import('./approval/approval.module').then(m => m.ApprovalModule),
                data: { title: 'Workflow Manager', delay: true, preload: false }
            },
            {
                path: 'company',
                loadChildren: () => import('./company/company.module').then(m => m.CompanyModule),
                data: { title: 'Company Setup', delay: true, preload: false }
            },
            {
                path: 'ess',
                loadChildren: () => import('./self-service/self-service.module').then(m => m.SelfServiceModule),
                data: { title: 'Self Service', delay: false, preload: true }
            },
            {
                path: 'customer',
                loadChildren: () => import('./customer/customer.module').then(m => m.CustomerModule),
                data: { title: 'Customer Setup', delay: true, preload: false }
            },
            {
                path: 'education',
                loadChildren: () => import('./education/education.module').then(m => m.EducationModule),
                data: { title: 'Qualification Setup', delay: true, preload: false }
            },
            {
                path: 'employee',
                loadChildren: () => import('./employee/employee.module').then(m => m.EmployeeModule),
                data: { title: 'Employee Manager', delay: true, preload: false }
            },
            {
                path: 'expense',
                loadChildren: () => import('./expense/expense.module').then(m => m.ExpenseModule),
                data: { title: 'Expense Manager', delay: true, preload: false }
            },
            {
                path: 'item',
                loadChildren: () => import('./item/item.module').then(m => m.ItemModule),
                data: { title: 'Item Manager', delay: true, preload: false }
            },
            {
                path: 'leave',
                loadChildren: () => import('./leave/leave.module').then(m => m.LeaveModule),
                data: { title: 'Leave Manager', delay: false, preload: true }
            },
            {
                path: 'loan',
                loadChildren: () => import('./loan/loan.module').then(m => m.LoanModule),
                data: { title: 'Loan Manager', delay: false, preload: true }
            },
            {
                path: 'menu',
                loadChildren: () => import('./menu/menu.module').then(m => m.MenuModule),
                data: { title: 'Menu Setup', delay: true, preload: false }
            },
            {
                path: 'payment',
                loadChildren: () => import('./payment/payment.module').then(m => m.PaymentModule),
                data: { title: 'Payment Manager', delay: true, preload: false }
            },
            {
                path: 'payroll',
                loadChildren: () => import('./payroll/payroll.module').then(m => m.PayrollModule),
                data: { title: 'Payroll Manager', delay: true, preload: false }
            },
            {
                path: 'privilege',
                loadChildren: () => import('./privilege/privilege.module').then(m => m.PrivilegeModule),
                data: { title: 'Privilege Manager', delay: true, preload: false }
            },
            {
                path: 'procurement',
                loadChildren: () => import('./procurement/procurement.module').then(m => m.ProcurementModule),
                data: { title: 'Procurement', delay: true, preload: false }
            },
            {
                path: 'product',
                loadChildren: () => import('./product/product.module').then(m => m.ProductModule),
                data: { title: 'Products', delay: true, preload: false }
            },
            {
                path: 'project',
                loadChildren: () => import('./project/project.module').then(m => m.ProjectModule),
                data: { title: 'Project Management', delay: true, preload: false }
            },
            {
                path: 'property',
                loadChildren: () => import('./property/property.module').then(m => m.PropertyModule),
                data: { title: 'Estate Manager', delay: true, preload: false }
            },
            {
                path: 'purchase',
                loadChildren: () => import('./purchase/purchase.module').then(m => m.PurchaseModule),
                data: { title: 'Purchases', delay: true, preload: false }
            },
            {
                path: 'requisition',
                loadChildren: () => import('./requisition/requisition.module').then(m => m.RequisitionModule),
                data: { title: 'Requistion', delay: true, preload: false }
            },
            {
                path: 'salary',
                loadChildren: () => import('./salary/salary.module').then(m => m.SalaryModule),
                data: { title: 'Salary Setup', delay: true, preload: false }
            },
            {
                path: 'settings',
                loadChildren: () => import('./settings/settings.module').then(m => m.SettingsModule),
                data: { title: 'Other Settings', delay: true, preload: false }
            },
            {
                path: 'store',
                loadChildren: () => import('./store/store.module').then(m => m.StoreModule),
                data: { title: 'Stores', delay: true, preload: false }
            },

            {
                path: 'task',
                loadChildren: () => import('./task/task.module').then(m => m.TaskModule),
                data: { title: 'Task Manager', delay: false, preload: true }
            },
            {
                path: 'user',
                loadChildren: () => import('./user/user.module').then(m => m.UserModule),
                data: { delay: true, preload: false }
            },
            {
                path: 'vendor',
                loadChildren: () => import('./vendor/vendor.module').then(m => m.VendorModule),
                data: { title: 'Vendor Management', delay: true, preload: false }
            },
            {
                path: 'vehicle',
                loadChildren: () => import('./vehicle/vehicle.module').then(m => m.VehicleModule),
                data: { title: 'Fleet Manager', delay: true, preload: false }
            },
            {
                path: 'workforce',
                loadChildren: () => import('./workforce/workforce.module').then(m => m.WorkforceModule),
                data: { title: 'Workforce Manager', delay: true, preload: false }
            },
            {
                path: 'shift',
                loadChildren: () => import('./shift/shift.module').then(m => m.ShiftModule),
                data: { title: 'Attendance Manager', delay: true, preload: false }
            },
            {
                path: 'periods', loadChildren: () => import('./periods/periods.module').then(m => m.PeriodsModule),
                data: { title: 'Appraisal Periods', delay: true, preload: false }
            },
            {
                path: 'appraisal', loadChildren: () => import('./appraisal/appraisal.module').then(m => m.AppraisalModule),
                data: { title: 'Appraisal', delay: true, preload: false }
            },
            {
                path: 'appraisal-setup',
                loadChildren: () => import('./appraisalsetup/appraisalsetup.module').then(m => m.AppraisalsetupModule),
                data: { title: 'Appraisal Settings', delay: true, preload: false }
            },
            {
                path: 'benchmarks',
                loadChildren: () => import('./benchmacks/benchmacks.module').then(m => m.BenchmacksModule),
                data: { title: 'Benchmarks Settings', delay: true, preload: false }
            },
            {
                path: 'kpi', loadChildren: () => import('./kpi/kpi.module').then(m => m.KpiModule),
                data: { title: 'KPI Settings', delay: true, preload: false }
            },
            {
                path: 'recruitment',
                loadChildren: () => import('./recruitment/recruitment.module').then(m => m.RecruitmentModule),
                data: { title: 'Recruitment', delay: true, preload: false }
            },
            {
                path: 'fileupload',
                loadChildren: () => import('./file-upload/file-upload.module').then(m => m.FileUploadModule),
                data: { title: 'File Upload', delay: true, preload: false }
            },
            {
                path: 'approvals',
                loadChildren: () => import('./approvals/approvals.module').then(m => m.ApprovalsModule),
                data: { title: 'Approvals', delay: true, preload: true }
            },
            {
                path: 'charts',
                loadChildren: () => import('./charts/charts.module').then(m => m.ChartsModule),
                data: { title: 'Chart Settings', delay: true, preload: false }
            },
            {
                path: 'sanction',
                loadChildren: () => import('./sanction/sanction.module').then(m => m.SanctionModule),
                data: { title: 'Employee Manager' }
            },

            {
                path: 'queryresponse',
                loadChildren: () => import('./employeequeryresponse/employeequeryresponse.module').then(m => m.EmployeequeryresponseModule),
                data: { title: 'Employee Query' }
            },
        ],
    },
    {
        path: '',
        component: SimpleLayoutComponent,
        children: [
            { path: 'login', component: LoginComponent },
            { path: 'forgot-password', component: ForgotPasswordComponent },
            { path: 'reset-password/:token', component: ResetPasswordComponent },
            // { path: 'dashboard', component: DashboardComponent },
        ],
        data: { delay: false, preload: true }
    },
    // {
    //   path: "", component: PreviewLayoutComponent,
    //   children: [
    //     { path: "preview", loadChildren: "./previews/previews.module#PreviewsModule" },
    //   ]
    // },
];

@NgModule({
    imports: [RouterModule.forRoot(routes, {
        useHash: true, preloadingStrategy: CustomPreloadingStrategy,
        scrollPositionRestoration: 'top',
    })],
    exports: [RouterModule],
})
export class AppRoutingModule { }
