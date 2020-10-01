import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductRoutingModule } from './product-routing.module';
import { ProductComponent } from './product/product.component';
import { ProductcategoryComponent } from './productcategory/productcategory.component';
import { ProducttypeComponent } from './producttype/producttype.component';
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
        ProductRoutingModule,
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
    declarations: [
        ProductComponent,
        ProductcategoryComponent,
        ProducttypeComponent,
    ],
})
export class ProductModule {}
