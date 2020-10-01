
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ItemcategoryComponent } from './itemcategory/itemcategory.component';
import { ItemsComponent } from './items/items.component';
import { ItemstatusComponent } from './itemstatus/itemstatus.component';
import { ItemtypeComponent } from './itemtype/itemtype.component';

const routes: Routes = [
    { path: 'itemcategory', component: ItemcategoryComponent },
    { path: 'items', component: ItemsComponent },
    { path: 'itemstatus', component: ItemstatusComponent },
    { path: 'itemtype', component: ItemtypeComponent },
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ItemRoutingModule { }

