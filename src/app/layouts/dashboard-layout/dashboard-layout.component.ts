import { Component, OnInit, OnDestroy } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';
import { UserIdleService } from 'angular-user-idle';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-dashboard-layout',
  templateUrl: './dashboard-layout.component.html',
  styleUrls: ['./dashboard-layout.component.scss']
})
// export class DashboardLayoutComponent implements OnInit, OnDestroy {
export class DashboardLayoutComponent implements OnInit {
  public links = [];
  public user_name = null;
  public currentUrl = '';
  public menu_title = 'MAIN NAVIGATION';

  constructor(
    private _auth: AuthService, private router: Router, private userIdle: UserIdleService
  ) {
    this.router.events.subscribe((evt: any) => this.currentUrl = evt.url);
  }

  // ngOnInit() {
  //   document.body.className = "vertical-layout vertical-menu-modern 2-columns fixed-navbar menu-expanded"
  // }

  ngOnInit() {
    this.user_name = this._auth.getUserInfo();
    this._auth.menu().subscribe(
      (res) => {
        localStorage.setItem('modules', JSON.stringify(res.data.modules));
        localStorage.setItem('menus', JSON.stringify(res.data.menus));
      },
      (err) => {
        console.log(err);
      }
    );

    // Start watching for user inactivity.
    this.userIdle.startWatching();

    // Start watching when user idle is starting.
    this.userIdle.onTimerStart().subscribe(count => {
      console.log(count);
      // let timerInterval;
    });

    // Start watch when time is up.
    this.userIdle.onTimeout().subscribe(() => {
      this._auth.logoutUser();
      console.log('Time is up!');
    });
  }

  stop() {
    this.userIdle.stopTimer();
  }

  stopWatching() {
    this.userIdle.stopWatching();
  }

  startWatching() {
    this.userIdle.startWatching();
  }

  restart() {
    this.userIdle.resetTimer();
  }
}
