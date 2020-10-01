import { Component, OnInit } from '@angular/core';
import * as io from 'socket.io-client';
import { employeeUrl } from './chat';
import { HttpService } from 'src/app/services/http.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-chat-inbox',
  templateUrl: './chat-inbox.component.html',
  styleUrls: ['./chat-inbox.component.css']
})
export class ChatInboxComponent implements OnInit {

  SOCKET_ENDPOINT = 'localhost:3000';
  socket;
  message: string;
  searchText: string;
  employeeList = [];
  employeeListData = [];
  searchCount = 0;

  constructor(protected http: HttpService, protected router: Router) { }
  ngOnInit() {
    this.setupSocketConnection();
    this.getEmployeeList();
  }
  setupSocketConnection() {
    this.socket = io(this.SOCKET_ENDPOINT);
    this.socket.on('message-broadcast', (data: string) => {
      console.log(data);
      let date1 = new Date();
      if (data) {
        let data2 = `
        <div class="chat-avatar">
          <a class="avatar" data-toggle="tooltip" href="#" data-placement="left" title="" data-original-title="">
            <img src="../../../assets/img/portrait/small/avatar-s-1.png" class="width-50 rounded-circle" alt="avatar" />
          </a>
        </div>
        <div class="chat-body">
          <div class="chat-content">
            <p>${data}</p>
            <p class="time">${date1}</p>
          </div>
        </div>
      `;
        const element = document.createElement('div');
        //element.className ="chat left";
        element.classList.add("chat");
        element.classList.add("chat-left");
        element.innerHTML = data2;
        // element.style.background = 'white';
        // element.style.padding = '15px 30px';
        // element.style.margin = '10px';
        document.getElementById('message-list').appendChild(element);
        document.getElementById('message-list').scrollTo({ behavior: 'smooth', top: document.getElementById('message-list').scrollHeight });

      }
    });
  }

  send(evt) {
    // console.log(evt.key);
    if (evt.key == "Enter") {
      this.SendMessage();
    }
  }

  SendMessage() {
    this.socket.emit('message', this.message);
    let date1 = new Date();
    let data = `
          <div class="chat-avatar">
            <a class="avatar" data-toggle="tooltip" href="#" data-placement="right" title="" data-original-title="">
              <img src="../../../assets/img/portrait/small/avatar-s-1.png" class="width-50 rounded-circle" alt="avatar" />
            </a>
          </div>
          <div class="chat-body">
            <div class="chat-content">
              <p>${this.message}</p>
              <p class="time">${date1}</p>
            </div>
          </div>
        `;
    const element = document.createElement('div');
    element.classList.add("chat");
    element.innerHTML = data;
    // element.style.background = 'white';
    // element.style.padding = '15px 30px';
    // element.style.margin = '10px';
    // element.style.textAlign = 'right';
    document.getElementById('message-list').appendChild(element);
    document.getElementById('message-list').scrollTo({ behavior: 'smooth', top: document.getElementById('message-list').scrollHeight });
    this.message = '';
  }

  getEmployeeList() {
    this.http.get(employeeUrl.employee.list)
      .subscribe(res => {
        this.employeeList = res.data;
        console.log(this.employeeList);
      }, err => { console.log(err); });
  }


  public search() {
    // alert(this.searchText);
    if (this.searchText.length > -1) {
      const myVal = this.searchText.toLowerCase();
      this.employeeListData = this.employeeList.filter(
        items => (items.FullName.toLowerCase().indexOf(myVal.toLowerCase()) != -1));
      this.searchCount = this.employeeListData.length;
    }
  }

}
