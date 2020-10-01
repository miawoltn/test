import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UploadxlsComponent } from './uploadxls/uploadxls.component';


const routes: Routes = [
  { path: 'xlsupload', component: UploadxlsComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FileUploadRoutingModule { }
