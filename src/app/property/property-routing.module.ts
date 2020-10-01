
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PropertyComponent } from './property/property.component'
import { PropertyallocationComponent } from './propertyallocation/propertyallocation.component'
import { PropertyapplicantComponent } from './propertyapplicant/propertyapplicant.component'
import { PropertyapplicationComponent } from './propertyapplication/propertyapplication.component'
import { PropertyfloorComponent } from './propertyfloor/propertyfloor.component'
import { PropertygroupComponent } from './propertygroup/propertygroup.component'
import { PropertyinspectionComponent } from './propertyinspection/propertyinspection.component'
import { PropertyownerComponent } from './propertyowner/propertyowner.component'
import { PropertysubtypeComponent } from './propertysubtype/propertysubtype.component'
import { PropertytypeComponent } from './propertytype/propertytype.component'

const routes: Routes = [
  { path: "property", component: PropertyComponent },
  { path: "propertyallocation", component: PropertyallocationComponent },
  { path: "propertyapplicant", component: PropertyapplicantComponent },
  { path: "propertyapplication", component: PropertyapplicationComponent },
  { path: "propertyfloor", component: PropertyfloorComponent },
  { path: "propertygroup", component: PropertygroupComponent },
  { path: "propertyinspection", component: PropertyinspectionComponent },
  { path: "propertyowner", component: PropertyownerComponent },
  { path: "propertysubtype", component: PropertysubtypeComponent },
  { path: "propertytype", component: PropertytypeComponent },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PropertyRoutingModule { }

