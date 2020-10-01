
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PropertyRoutingModule } from './property-routing.module';
import { PropertyComponent } from './property/property.component'
import { PropertyallocationComponent } from './propertyallocation/propertyallocation.component'
import { PropertyapplicantComponent } from './propertyapplicant/propertyapplicant.component'
import { PropertyapplicationComponent } from './propertyapplication/propertyapplication.component'
import { PropertyfloorComponent } from './propertyfloor/propertyfloor.component'
import { PropertygroupComponent } from './propertygroup/propertygroup.component'
import { PropertyinspectionComponent } from './propertyinspection/propertyinspection.component'
import { PropertyownerComponent } from './propertyowner/propertyowner.component'
import { PropertysubtypeComponent } from './propertysubtype/propertysubtype.component'
import { PropertytypeComponent } from './propertytype/propertytype.component';
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
    PropertyRoutingModule,
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
  declarations: [PropertyComponent, PropertyallocationComponent, PropertyapplicantComponent, PropertyapplicationComponent, PropertyfloorComponent, PropertygroupComponent, PropertyinspectionComponent, PropertyownerComponent, PropertysubtypeComponent, PropertytypeComponent]
})
export class PropertyModule { }

