import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MenuComponent } from './menu/menu.component';
import { MenuauthorizationComponent } from './menuauthorization/menuauthorization.component';
import { MenutypeComponent } from './menutype/menutype.component';

const routes: Routes = [
    { path: 'menu', component: MenuComponent },
    { path: 'menuauthorization', component: MenuauthorizationComponent },
    { path: 'menutype', component: MenutypeComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class MenuRoutingModule {}
