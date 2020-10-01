import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ExpenseRoutingModule } from './expense-routing.module';
import { ExpensecategoryComponent } from './expensecategory/expensecategory.component';
import { ExpenselineComponent } from './expenseline/expenseline.component';
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
    DxSpeedDialActionModule,
} from 'devextreme-angular';

@NgModule({
    imports: [
        CommonModule,
        ExpenseRoutingModule,
        FormsModule,
        NgSelectModule,
        MatStepperModule,
        MatIconModule,
        DxSelectBoxModule,
        DxTextAreaModule,
        DxDateBoxModule,
        DxFormModule,
        DxDataGridModule,
        DxSpeedDialActionModule,
    ],
    declarations: [ExpensecategoryComponent, ExpenselineComponent],
})
export class ExpenseModule {}
