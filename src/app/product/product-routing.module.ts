import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductComponent } from './product/product.component';
import { ProductcategoryComponent } from './productcategory/productcategory.component';
import { ProducttypeComponent } from './producttype/producttype.component';

const routes: Routes = [
    { path: 'product', component: ProductComponent },
    { path: 'productcategory', component: ProductcategoryComponent },
    { path: 'producttype', component: ProducttypeComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class ProductRoutingModule {}
