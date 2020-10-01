import { Component, OnInit } from '@angular/core';
import { appraisalUrl } from '../appraisal-url';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-view-appraisals',
  templateUrl: './view-appraisals.component.html',
  styleUrls: ['./view-appraisals.component.css']
})
export class ViewAppraisalsComponent implements OnInit {

  data = [];
  constructor(protected http: HttpService) {
    // this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(appraisalUrl.appraisalheader.my_appraisals)
      .subscribe(success => {
        this.data = success.data;
      }, error => { console.log(error); });
  }

}
