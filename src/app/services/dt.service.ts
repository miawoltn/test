import { Injectable, ElementRef } from '@angular/core';
declare var $;

@Injectable({
  providedIn: 'root'
})
export class DtService {
  constructor() { }
  
  default(table: ElementRef) {
    setTimeout(function () {
      $(function () {
        let dataTable = $(table.nativeElement).DataTable();
        return dataTable;
      });
    }, 3000);
  }
}
