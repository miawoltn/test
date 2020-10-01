import { MySharedEvent } from './../../services/shared-events.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
@Component({
    selector: 'app-sidebar',
    templateUrl: './sidebar.component.html',
    styleUrls: ['./sidebar.component.scss'],
})
export class SidebarComponent implements OnInit {
    public links = [];
    public data = [];
    public modules = [];
    public user_name = '';
    public currentUrl = '';
    public menu_title = '';
    moduleId = '-1';
    timeout: any;
    constructor(private _auth: AuthService, private router: Router, private events: MySharedEvent) {

        this.router.events.subscribe((evt: any) => (this.currentUrl = evt.url));

    }
    ngOnInit() {
        this.moduleId = localStorage.getItem('moduleId');
        this.events.eventData.subscribe((evt: any) => {
            console.log(evt);
            const data = this.data.filter(item => item.moduleId === evt + '' || item.moduleId === 0);

            this.links = this.data.filter(item => item.moduleId === evt + '');
            this.moduleId = evt;
            this.menu_title = this.modules.find(item => item.moduleId === evt + '').moduleName;
        });

        this.user_name = this._auth.getUserInfo();

        this.modules = JSON.parse(localStorage.getItem('modules'));
        this.data = JSON.parse(localStorage.getItem('menus'));
        const tree = this.data;
        // this.data = res.data.menus;
        if (this.data) {

            this.links = this.GenerateTree(tree.filter(item => item.moduleId === this.moduleId + '' || item.moduleId === '0'));
            this.menu_title = this.modules.find(item => item.moduleId === this.moduleId + '').moduleName;
        }

        this.loadScript();
        // console.log(this.links);
        this.timeout = setInterval(() => {
            this.reloadMenu();
            // console.log('c');
        }, 1500);
    }

    reloadMenu() {
        this.moduleId = localStorage.getItem('moduleId');
        this.modules = JSON.parse(localStorage.getItem('modules'));
        this.data = JSON.parse(localStorage.getItem('menus'));
        const tree = this.data;
        if (this.data) {
            this.links = this.GenerateTree(tree.filter(item => item.moduleId === this.moduleId + '' || item.moduleId === '0'));
            this.menu_title = this.modules.find(item => item.moduleId === this.moduleId + '').moduleName;
            clearInterval(this.timeout);
            // console.log('x');
        }
    }

    loadScript() {
        // isFound = false;
        console.log('preparing to load...');
        const scripts = document.getElementsByTagName('script');
        for (let i = 0; i < scripts.length; ++i) {
            if (scripts[i].getAttribute('src') != null && scripts[i].getAttribute('src').includes('app-sidebar')) {
                // isFound = true;
                console.log('preparing to load2...');
                scripts[i].parentNode.removeChild(scripts[i]);

            }
        }

        // if (!isFound) {
        //console.log('preparing to load3...');
        const node = document.createElement('script');
        node.src = './assets/js/app-sidebar.js';
        node.type = 'text/javascript';
        node.async = true;
        node.charset = 'utf-8';
        document.getElementsByTagName('body')[0].appendChild(node);
        //    }
    }

    buildTree(tree, item) {
        if (item) {
            // if item then have parent
            // tslint:disable-next-line:prefer-for-of
            for (let i = 0; i < tree.length; i++) {
                // parses the entire tree in order to find the parent
                if (String(tree[i].id) === String(item.parent)) {
                    // bingo!
                    tree[i].sublinks.push(item); // add the child to his parent
                    break;
                } else {
                    this.buildTree(tree[i].sublinks, item);
                } // if item doesn't match but tree have sublinks then parses sublinks again to find item parent
            }
        } else {
            // if no item then is a root item, multiple root items are supported
            let idx = 0;
            while (idx < tree.length) {
                if (tree[idx].parent && tree[idx].parent > 0) {
                    this.buildTree(tree, tree.splice(idx, 1)[0]);
                } else { idx++; }
            } // if doesn't have parent then is root and move it to the next object
        }
    }

    GenerateTree(data) {
        // tslint:disable-next-line:prefer-for-of
        for (let i = 0; i < data.length; i++) {
            // add sublinks to every item
            data[i].sublinks = [];
        }
        this.buildTree(data, null);
        data.sort((a, b) => a.order_by - b.order_by);
        return data;
    }
}
