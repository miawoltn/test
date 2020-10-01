import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ExpensecategoryComponent } from './expensecategory/expensecategory.component';
import { ExpenselineComponent } from './expenseline/expenseline.component';

const routes: Routes = [
    { path: 'expensecategory', component: ExpensecategoryComponent },
    { path: 'expenseline', component: ExpenselineComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class ExpenseRoutingModule {}
