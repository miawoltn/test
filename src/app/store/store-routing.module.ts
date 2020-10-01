
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StoreitemsComponent } from './storeitems/storeitems.component'
import { StoresComponent } from './stores/stores.component'

const routes: Routes = [
  { path: "storeitems", component: StoreitemsComponent },
  { path: "store", component: StoresComponent },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StoreRoutingModule { }

