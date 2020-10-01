import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { menuUrl } from '../menu-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-menu',
    templateUrl: './menu.component.html',
    styleUrls: ['./menu.component.scss'],
})
export class MenuComponent implements OnInit {
    displayedColumns: string[] = [
        'MenuTitle',
        'MenuUrl',
        'OrderBy',
        'Icon',
        'DashBoardUrl',
        'MenuTypeID',
        'StatusID',
    ];
    data = [];
    obj = {
        menu_title: null,
        menu_href: null,
        parent_menu_id: null,
        order_by: null,
        menu_img: null,
        active_id: '1',
        moduleId: '1',
    };
    displayForm = false;
    operation = 'Add';
    title = 'Menu';
    parent = 'menu';
    Modules: any;
    statuses = [{ value: '1', label: 'Yes' }, { value: '0', label: 'No' }];
    ParentMenus: any[];

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(menuUrl.menu.list).subscribe(
            (res) => {
                this.data = res.data;
                this.ParentMenus = this.data; // .filter(i => i.parent_menu_id == null);
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(menuUrl.modules.list).subscribe(
            (res) => {
                this.Modules = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
    }

    showForm() {
        this.displayForm = true;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    hideForm() {
        this.displayForm = false;
    }

    addItem() {
        this.resetForm();
        this.showForm();
    }

    processForm() {
        let url = menuUrl.menu.add;
        if (this.operation === 'Update') {
            url = menuUrl.menu.update;
        }
        this.save(url);
    }

    save(url) {
        console.log(this.obj);
        this.http.post(url, this.obj).subscribe(
            (res) => {
                this.data = res.data;
                this.ParentMenus = this.data;
                swal.fire('Process Complete', res.message, 'success');
                this.resetForm();
            },
            (err) => {
                console.log(err);
                swal.fire('Process Unsuccessful', err.error.message, 'error');
            }
        );
    }

    loadItem(id) {
        this.obj = this.data.find((item) => item.id === id.row.data.id);
        console.log(this.obj);
        this.operation = 'Update';
        this.showForm();
    }

    resetForm() {
        this.obj = {
            menu_title: null,
            menu_href: null,
            parent_menu_id: null,
            order_by: null,
            menu_img: null,
            active_id: '1',
            moduleId: '1',
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
