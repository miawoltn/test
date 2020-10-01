
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { EducationRoutingModule } from './education-routing.module';
import { GradelevelsComponent } from './gradelevels/gradelevels.component'import { GradesComponent } from './grades/grades.component'import { ProgrammetypesComponent } from './programmetypes/programmetypes.component'import { QualificationgradeComponent } from './qualificationgrade/qualificationgrade.component'import { QualificationsComponent } from './qualifications/qualifications.component'import { SchooltypesComponent } from './schooltypes/schooltypes.component';
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
    EducationRoutingModule,
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
  declarations: [GradelevelsComponent,GradesComponent,ProgrammetypesComponent,QualificationgradeComponent,QualificationsComponent,SchooltypesComponent]
})
export class EducationModule { }

