import { HttpClient, HttpEvent, HttpErrorResponse, HttpEventType } from  '@angular/common/http';
import { map } from  'rxjs/operators';

import { Injectable } from '@angular/core';
// import { FileManagerUrl } from '../file-manager/filemanager';

@Injectable({
  providedIn: 'root'
})
export class UploadService {

  //SERVER_URL: string = "http://localhost:3000";
  constructor(private httpClient: HttpClient) { }

  public upload(data, loadUrl) {
    let uploadURL = loadUrl; //`${this.SERVER_URL}/upload`;

    return this.httpClient.post<any>(uploadURL, data, {
      reportProgress: true,
      observe: 'events'
    }).pipe(map((event) => {

      switch (event.type) {

        case HttpEventType.UploadProgress:
          const progress = Math.round(100 * event.loaded / event.total);
          return { status: 'progress', message: progress };

        case HttpEventType.Response:
          return event.body;
        default:
          return `Unhandled event: ${event.type}`;
      }
    })
    );
  }

  public upload2(data, loadUrl) {
    let uploadURL = loadUrl; //`${this.SERVER_URL}/upload`;

    return this.httpClient.post<any>(uploadURL, data);
  }
}
