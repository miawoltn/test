import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-auth-layout',
  templateUrl: './auth-layout.component.html',
  styleUrls: ['./auth-layout.component.scss']
})
export class AuthLayoutComponent implements OnInit, OnDestroy {

  constructor() { }

  ngOnInit() {
    document.body.className ="vertical-layout vertical-menu 1-column  bg-full-screen-image menu-expanded blank-page ";
  }
  ngOnDestroy() {
    document.body.className ="";
  }
}
