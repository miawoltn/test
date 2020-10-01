import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FileUploadRoutingModule } from './file-upload-routing.module';
import { UploadxlsComponent } from './uploadxls/uploadxls.component';
import { FormsModule } from '@angular/forms';
import {
  DxSelectBoxModule, DxTextAreaModule, DxDateBoxModule, DxFormModule,
  DxDataGridModule, DxSpeedDialActionModule
} from 'devextreme-angular';


@NgModule({
  declarations: [UploadxlsComponent],
  imports: [
    CommonModule,
    FileUploadRoutingModule,
    FormsModule,
    DxSelectBoxModule,
    DxTextAreaModule,
    DxDateBoxModule,
    DxFormModule,
    DxDataGridModule,
    DxSpeedDialActionModule
  ]
})
export class FileUploadModule { }
