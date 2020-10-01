import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-new-layout',
  templateUrl: './new-layout.component.html',
  styleUrls: ['./new-layout.component.css']
})
export class NewLayoutComponent implements OnInit {

  constructor(private _auth: AuthService) { }

  ngOnInit() {
    this._auth.menu().subscribe(
      (res) => {
        localStorage.setItem('modules', JSON.stringify(res.data.modules));
        localStorage.setItem('menus', JSON.stringify(res.data.menus));
      },
      (err) => {
        console.log(err);
      }
    );
  }

}
