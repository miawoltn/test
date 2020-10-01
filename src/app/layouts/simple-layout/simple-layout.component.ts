import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-simple-layout',
  templateUrl: './simple-layout.component.html',
  styleUrls: ['./simple-layout.component.scss']
})
export class SimpleLayoutComponent implements OnInit , OnDestroy {

  constructor() { }

  ngOnInit() {
    document.body.className ="vertical-layout vertical-menu 1-column  bg-full-screen-image menu-expanded blank-page ";
  }
  ngOnDestroy() {
    document.body.className ="";
  }
}
