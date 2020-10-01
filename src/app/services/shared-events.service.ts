import { Injectable, EventEmitter, Component } from '@angular/core';
@Injectable()
export class MySharedEvent {
    eventData = new EventEmitter<any>();
    breadcrumbData = new EventEmitter<any>();
}
