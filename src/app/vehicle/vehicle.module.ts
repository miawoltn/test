
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VehicleRoutingModule } from './vehicle-routing.module';
import { EnginetypeComponent } from './enginetype/enginetype.component'
import { FrequencyComponent } from './frequency/frequency.component'
import { VehicleComponent } from './vehicle/vehicle.component'
import { VehiclebookingComponent } from './vehiclebooking/vehiclebooking.component'
import { VehicledriverComponent } from './vehicledriver/vehicledriver.component'
import { VehicleexpensecategoryComponent } from './vehicleexpensecategory/vehicleexpensecategory.component'
import { VehicleexpensetransactionsComponent } from './vehicleexpensetransactions/vehicleexpensetransactions.component'
import { VehicleincomecategoryComponent } from './vehicleincomecategory/vehicleincomecategory.component'
import { VehicleincometransactionsComponent } from './vehicleincometransactions/vehicleincometransactions.component'
import { VehiclepartComponent } from './vehiclepart/vehiclepart.component'
import { VehiclepartrequisitionComponent } from './vehiclepartrequisition/vehiclepartrequisition.component';
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
    VehicleRoutingModule,
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
  declarations: [EnginetypeComponent, FrequencyComponent, VehicleComponent, VehiclebookingComponent, VehicledriverComponent, VehicleexpensecategoryComponent, VehicleexpensetransactionsComponent, VehicleincomecategoryComponent, VehicleincometransactionsComponent, VehiclepartComponent, VehiclepartrequisitionComponent]
})
export class VehicleModule { }

