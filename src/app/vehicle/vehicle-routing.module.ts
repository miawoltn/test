
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
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
import { VehiclepartrequisitionComponent } from './vehiclepartrequisition/vehiclepartrequisition.component'

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Logistics' },
  children: [
    { path: "enginetype", component: EnginetypeComponent, data: { breadcrumb: 'Engine Types' } },
    { path: "frequency", component: FrequencyComponent, data: { breadcrumb: 'Frequency' } },
    { path: "vehicle", component: VehicleComponent, data: { breadcrumb: 'Vehicles' } },
    { path: "vehiclebooking", component: VehiclebookingComponent, data: { breadcrumb: 'Vehicle Bookings' } },
    { path: "vehicledriver", component: VehicledriverComponent, data: { breadcrumb: 'Drivers' } },
    { path: "vehicleexpensecategory", component: VehicleexpensecategoryComponent, data: { breadcrumb: 'Expense Categoy' } },
    { path: "vehicleexpensetransactions", component: VehicleexpensetransactionsComponent, data: { breadcrumb: 'Transactions' } },
    { path: "vehicleincomecategory", component: VehicleincomecategoryComponent, data: { breadcrumb: 'Income Category' } },
    { path: "vehicleincometransactions", component: VehicleincometransactionsComponent, data: { breadcrumb: 'Income Transactions' } },
    { path: "vehiclepart", component: VehiclepartComponent, data: { breadcrumb: 'Vehicle Part' } },
    { path: "vehiclepartrequisition", component: VehiclepartrequisitionComponent, data: { breadcrumb: 'Part Requisition' } },]
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class VehicleRoutingModule { }

