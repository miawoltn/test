
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StatusesComponent } from './statuses/statuses.component';
import { YearComponent } from './year/year.component';
import { GenderComponent } from './gender/gender.component';
import { MaritalstatusComponent } from './maritalstatus/maritalstatus.component';
import { DocumenttypeComponent } from './documenttype/documenttype.component';
import { DurationComponent } from './duration/duration.component';
import { EquipmentComponent } from './equipment/equipment.component';
import { PriorityComponent } from './priority/priority.component';

const routes: Routes = [
    { path: 'statuses', component: StatusesComponent },
    { path: 'year', component: YearComponent },
    { path: 'gender', component: GenderComponent },
    { path: 'maritalstatus', component: MaritalstatusComponent },

    { path: 'documenttype', component: DocumenttypeComponent },
    { path: 'duration', component: DurationComponent },
    { path: 'equipment', component: EquipmentComponent },
    { path: 'priority', component: PriorityComponent },
];

// /settings/

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class SettingsRoutingModule {}
