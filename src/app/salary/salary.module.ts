
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { SalaryRoutingModule } from './salary-routing.module';
import { SalarycomponentsComponent } from './salarycomponents/salarycomponents.component'import { SalaryformulaeComponent } from './salaryformulae/salaryformulae.component'import { SalarytaxstatusComponent } from './salarytaxstatus/salarytaxstatus.component'import { SalarytypeComponent } from './salarytype/salarytype.component'import { SalaryvariablecategoryComponent } from './salaryvariablecategory/salaryvariablecategory.component'import { SalaryvariablesComponent } from './salaryvariables/salaryvariables.component'import { SalaryvariabletypeComponent } from './salaryvariabletype/salaryvariabletype.component';
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
} from 'devextreme-angular';

@NgModule({
  imports: [
    CommonModule,
    SalaryRoutingModule,
    FormsModule,
	NgSelectModule,
    MatStepperModule,
    MatIconModule,
	DxSelectBoxModule,
	DxTextAreaModule,
	DxDateBoxModule,
	DxFormModule,
	DxDataGridModule,
	DxSpeedDialActionModule
  ],
  declarations: [SalarycomponentsComponent,SalaryformulaeComponent,SalarytaxstatusComponent,SalarytypeComponent,SalaryvariablecategoryComponent,SalaryvariablesComponent,SalaryvariabletypeComponent]
})
export class SalaryModule { }

