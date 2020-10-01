import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PrivilegesComponent } from './privileges/privileges.component';
import { Privilege_activityComponent } from './privilege_activity/privilege_activity.component';
import { Privilege_activitydetailsComponent } from './privilege_activitydetails/privilege_activitydetails.component';
import { Privilege_assignComponent } from './privilege_assign/privilege_assign.component';
import { Privilege_classComponent } from './privilege_class/privilege_class.component';
import { Privilege_detailsComponent } from './privilege_details/privilege_details.component';
import { Privilege_headerComponent } from './privilege_header/privilege_header.component';
import { Privilege_typeComponent } from './privilege_type/privilege_type.component';

const routes: Routes = [
    { path: 'privileges', component: PrivilegesComponent },
    { path: 'privilege_activity', component: Privilege_activityComponent },
    { path: 'privilege_activitydetails', component: Privilege_activitydetailsComponent },
    { path: 'privilege_assign', component: Privilege_assignComponent },
    { path: 'privilege_class', component: Privilege_classComponent },
    { path: 'privilege_details', component: Privilege_detailsComponent },
    { path: 'privilege_header', component: Privilege_headerComponent },
    { path: 'privilege_type', component: Privilege_typeComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class PrivilegeRoutingModule { }
