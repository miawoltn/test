import { Injectable } from '@angular/core';
import { PreloadingStrategy, Route } from '@angular/router';
import { Observable, of, timer } from 'rxjs';
import { flatMap } from 'rxjs/operators';


@Injectable()
export class CustomPreloadingStrategy implements PreloadingStrategy {

    preload(route: Route, load: () => Observable<any>): Observable<any> {
        // if (route.data && route.data.preload) {
        //     return load();
        // } else {
        //     return of(null);
        // }
        const loadRoute = (delay) => delay
            ? timer(150).pipe(flatMap(_ => load()))
            : load();
        return route.data && route.data.preload
            ? loadRoute(route.data.delay)
            : of(null);

    }
}
