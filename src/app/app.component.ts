import { Component } from '@angular/core';
import { Router, RouterEvent, RouteConfigLoadStart, RouteConfigLoadEnd, NavigationCancel, NavigationError } from '@angular/router';
import Swal from 'sweetalert2';
// import { CalendarOptions } from '@fullcalendar/angular';
// import { CalenderService } from './services/fullcalendar.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'TEAM NG';
  message = '';

  public isShowingRouteLoadIndicator: boolean;

  // I initialize the app view component.
  constructor(router: Router) {

    this.isShowingRouteLoadIndicator = false;

    // As the router loads modules asynchronously (via loadChildren), we're going to
    // keep track of how many asynchronous requests are currently active. If there is
    // at least one pending load request, we'll show the indicator.
    let asyncLoadCount = 0;

    // The Router emits special events for "loadChildren" configuration loading. We
    // just need to listen for the Start and End events in order to determine if we
    // have any pending configuration requests.
    router.events.subscribe(
      (event: RouterEvent): void => {
        // console.log(event);
        if (event instanceof RouteConfigLoadStart) {

          asyncLoadCount++;
          if (event !== null) {
            Swal.fire({
               title: 'Loading ' + ' ...',
              // imageUrl: '/assets/img/gallery/favicon.png',
              // imageHeight: 120,
              // imageWidth: 120,
              // imageAlt: 'A tall image'
            });
            Swal.showLoading();
          }

        } else if (event instanceof RouteConfigLoadEnd || event instanceof NavigationCancel
          || event instanceof NavigationError || event instanceof NavigationError) {

          asyncLoadCount--;
          Swal.close();
        }

        // If there is at least one pending asynchronous config load request,
        // then let's show the loading indicator.
        // --
        // CAUTION: I'm using CSS to include a small delay such that this loading
        // indicator won't be seen by people with sufficiently fast connections.
        // this.isShowingRouteLoadIndicator = !! asyncLoadCount;
        // if (this.isShowingRouteLoadIndicator) {
        //   Swal.fire({
        //     title: 'Loading ' + ' ...'
        //   });
        //   Swal.showLoading();

        // } else {
        //   Swal.close();
        // }
      }
    );

  }
}
