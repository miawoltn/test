import { Injectable } from '@angular/core';
// import { Observable} from 'rxjs';
import { of, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class GenericService {

  constructor() { }

  getYesNo() {
    return of<any>([{ id: '0', title: 'No' }, { id: '1', title: 'Yes' }]);
  }

  getStatus(): Observable<any> {
    return of<any>([{ title: 'Active', id: '1' }, { title: 'In-Active', id: '0' }]);
  }

  getGoodBad(): Observable<any> {
    return of<any>([{ title: 'Good', id: '1' }, { title: 'Bad', id: '0' }]);
  }

  getDoneStatus(): Observable<any> {
    return of<any>([{ title: 'Done', id: '1' }, { title: 'Not Done', id: '0' }]);
  }
}
