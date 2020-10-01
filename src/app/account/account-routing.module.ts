
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AccountComponent } from './account/account.component'import { AccountgroupComponent } from './accountgroup/accountgroup.component'import { AccountssubtypeComponent } from './accountssubtype/accountssubtype.component'import { AccounttypeComponent } from './accounttype/accounttype.component'

const routes: Routes = [
 { path:"account", component:AccountComponent }, { path:"accountgroup", component:AccountgroupComponent }, { path:"accountssubtype", component:AccountssubtypeComponent }, { path:"accounttype", component:AccounttypeComponent }, 

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }

