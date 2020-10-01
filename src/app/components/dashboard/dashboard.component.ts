import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { MySharedEvent } from 'src/app/services/shared-events.service';
import { DecimalPipe } from '@angular/common';
import Swal from 'sweetalert2';

declare var $: any;
declare var jQuery: any;
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  countries: Iterable<string>;
  pipe: any = new DecimalPipe('en-US');
  data = [

  ];
  constructor(
    public _auth: AuthService, private events: MySharedEvent, public router: Router
  ) {

  }

  ngOnInit() {
    this.data = JSON.parse(localStorage.getItem('modules'));
    console.log(this.data);
    if (this.data == undefined) {
      Swal.showLoading();
      this._auth.menu().subscribe(
        (res) => {
          this.data = res.data.modules;
          this.loadCarosel();
          Swal.close();
          // localStorage.setItem('menus', JSON.stringify(res.data.menus));
        },
        (err) => {
          console.log(err);
          Swal.close();
        }
      );

    } else {
      this.loadCarosel();
    }


  }

  loadCarosel() {
    jQuery(function($) {
    $('.screen-carousel').owlCarousel({
      loop: true,
      margin: 0,
      center: true,
      dots: false,
      nav: false,
      autoplay: true,
      responsive: {
        0: {
          items: 1
        },
        768: {
          items: 2
        },
        991: {
          items: 3
        },
        1200: {
          items: 3
        },
        1920: {
          items: 3
        }
      }
    });
  }); // JQuery end

  }

  loadMenu(id, cs) {
    console.log(id);
    localStorage.setItem('moduleId', id);
    this.events.eventData.emit(id);
    //this.router.navigate([cs]);
  }
}
