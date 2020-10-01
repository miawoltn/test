
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CompanyRoutingModule } from './company-routing.module';
import { BranchesComponent } from './branches/branches.component'
import { BranchtypesComponent } from './branchtypes/branchtypes.component'
import { CompanyComponent } from './company/company.component'
import { DepartmentgroupComponent } from './departmentgroup/departmentgroup.component'
import { DepartmentsComponent } from './departments/departments.component'
import { DesignationsComponent } from './designations/designations.component'
import { DivisionsComponent } from './divisions/divisions.component'
import { SupervisortypesComponent } from './supervisortypes/supervisortypes.component'
import { UnitsComponent } from './units/units.component';
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
	DxSpeedDialActionModule
	, DxTreeListModule
} from 'devextreme-angular';
import { DesignationcategoryComponent } from './designationcategory/designationcategory.component';

@NgModule({
	imports: [
		CommonModule,
		CompanyRoutingModule,
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
		DxTreeListModule
	],
	declarations: [BranchesComponent, BranchtypesComponent, CompanyComponent, DepartmentgroupComponent, DepartmentsComponent, DesignationcategoryComponent, DesignationsComponent, DivisionsComponent, SupervisortypesComponent, UnitsComponent]
})
export class CompanyModule { }

