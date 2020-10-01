import { privilegeUrl } from './../../privilege/privilege-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { menuUrl } from '../menu-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-menuauthorization',
  templateUrl: './menuauthorization.component.html',
  styleUrls: ['./menuauthorization.component.scss'],
})
export class MenuauthorizationComponent implements OnInit {
  displayedColumns: string[] = ['MenuID', 'PrivilegesID'];
  data = [];
  obj = {
    menu_id: null,
    privilege_id: null,
    parent_menu_id: null,
    child_menu_id: null,
    child_menu_id2: null,
  };
  displayForm = false;
  operation = 'Add';
  title = 'Menu Authorization';
  parent = 'menu';
  Menu: any;
  Privileges: any;
  SubMenus = [];
  MenuList = [];
  FilteredMenus = [];
  MenuList2 = [];
  SubMenus2 = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
    this.deleteItem = this.deleteItem.bind(this);

  }

  ngOnInit() {
    this.http.get(menuUrl.menuauthorization.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(menuUrl.menu.list).subscribe(
      (res) => {
        this.Menu = res.data.filter((i) => i.parent_menu_id === null);
        this.MenuList = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(privilegeUrl.privileges.list).subscribe(
      (res) => {
        this.Privileges = res.data;
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


  assignedMenus(e) {
    // console.log(e);
    this.FilteredMenus = this.data.filter(
      (i) => i.privilege_id === e.PrivilegeID
    );
    // console.log(this.FilteredMenus);

    // console.log(this.MenuList);
    this.MenuList2 = this.MenuList.filter(
      (elem) =>
        !this.FilteredMenus.find(({ menu_id }) => elem.menu_id === menu_id)
    );

    // console.log(this.MenuList2);
  }

  filterSub(e) {
    // console.log(e);
    // console.log(this.MenuList2);
    // this.SubMenus = this.MenuList2.filter(
    //   (i) => i.parent_menu_id === e.menu_id
    // );
    this.SubMenus = this.MenuList2.filter(
      (i) => i.parent_menu_id === e.menu_id
    );
  }

  filterSub2(e) {
    console.log(e);
    this.SubMenus2 = this.MenuList2.filter(
      (i) => i.parent_menu_id === e.menu_id
    );
  }

  processForm() {
    let url = menuUrl.menuauthorization.add;
    if (this.operation === 'Update') {
      url = menuUrl.menuauthorization.update;
    }

    if (this.obj.child_menu_id !== null) {
      this.obj.menu_id = this.obj.child_menu_id;
    } else {
      this.obj.menu_id = this.obj.parent_menu_id;
    }

    if (this.obj.child_menu_id2 !== null) {
      this.obj.menu_id = this.obj.child_menu_id2;
    }
    // console.log(this.obj);
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj).subscribe(
      (res) => {
        this.data = res.data;
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
    console.log(id.row.data);
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.obj.privilege_id = id.row.data.PrivilegesID;
    this.assignedMenus({ PrivilegeID: id.row.data.PrivilegesID });
    if (this.MenuList.find(item => item.menu_id === id.row.data.MenuID)) {
      this.obj.privilege_id = id.row.data.PrivilegesID;
      const d = this.MenuList.find(item => item.menu_id === id.row.data.MenuID);
      // console.log(d);
      if (d.parent_menu_id === null) {
        this.obj.parent_menu_id = id.row.data.MenuID;
        this.filterSub(d);
      } else {
        this.obj.parent_menu_id = d.parent_menu_id;
        const d1 = this.MenuList.find(item => item.menu_id === this.obj.parent_menu_id);
        this.filterSub(d1);
        this.obj.child_menu_id = d.id;
      }
    }
    this.operation = 'Update';
    this.showForm();
  }

  deleteItem(id) {
    swal.fire({
      title: 'Are you sure want to remove?',
      text: 'You will not be able to recover this file!',
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, keep it'
    }).then((result) => {
      if (result.value) {
        this.http.get(menuUrl.menuauthorization.delete + '/' + id.row.data.id).subscribe(
          (res) => {
            this.data = res.data;
            swal.fire('Process Complete', res.message, 'success');
            this.resetForm();
          },
          (err) => {
            console.log(err);
            swal.fire('Process Unsuccessful', err.error.message, 'error');
          }
        );
      } else if (result.dismiss === swal.DismissReason.cancel) {

      }
    });

  }

  resetForm() {
    this.obj = {
      menu_id: null,
      privilege_id: null,
      parent_menu_id: null,
      child_menu_id: null,
      child_menu_id2: null,
    };
    this.hideForm();
    this.operation = 'Add';
  }
}
