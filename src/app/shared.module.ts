import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { KeysPipe } from './pipes/keys.pipe';
import { Jsonpipe } from './pipes/jsonpipe.pipe';
import { EscapeHtmlPipe } from './pipes/escape-html.pipe';
import { StaffStatusPipe } from './pipes/staffstatus.pipe';
import { YesNoPipe } from './pipes/YesNo.pipe';
import { DynamicContentComponent } from './components/dynamic-content/dynamic-content.component';
import { UnknownDynamicComponent } from './components/dynamic-content/unknown';
import { criteriaOptionsPipe } from './pipes/filter-pipe.pipe';
import { GroupByPipe } from './pipes/group-by.pipe';
// import { HeaderComponent } from './components/header/header.component';
// import { HeaderComponent } from './components/header/header.component';

@NgModule({
  declarations: [
    KeysPipe,
    Jsonpipe,
    EscapeHtmlPipe, StaffStatusPipe, YesNoPipe, DynamicContentComponent, UnknownDynamicComponent, criteriaOptionsPipe, GroupByPipe
  ],
  imports: [
    CommonModule,
  ],
  entryComponents: [UnknownDynamicComponent],
  exports: [
    KeysPipe, Jsonpipe, EscapeHtmlPipe, StaffStatusPipe, YesNoPipe, DynamicContentComponent, UnknownDynamicComponent,
    criteriaOptionsPipe, GroupByPipe]
})
export class SharedModule { }
