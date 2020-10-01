import { employeeUrl } from 'src/app/employee/employee-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { privilegeUrl } from '../privilege-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-privilege_header',
    templateUrl: './privilege_header.component.html',
    styleUrls: ['./privilege_header.component.scss'],
})
export class Privilege_headerComponent implements OnInit {
    displayedColumns: string[] = [
        'DeptID',
        'UnitID',
        'SupervisorTypeID',
        'DesignationClassID',
        'LocationID',
        'posted_by',
        'date_posted',
        'transID',
        'StageID',
        'PrivilegeID',
        'PrivilegeClassID',
    ];
    isEditable = true;
    isLinear = true;
    privileges = [];
    privilege_class = [];
    obj = { detail: [], PrivilegeID: null, PrivilegeClassID: null };
    obj2 = { detail: [], Privilege: null, PrivilegeClass: null };
    staff = [];


    data = [];
    // obj = {
    //     DeptID: null,
    //     UnitID: null,
    //     SupervisorTypeID: null,
    //     DesignationClassID: null,
    //     LocationID: null,
    //     posted_by: null,
    //     date_posted: null,
    //     transID: null,
    //     StageID: null,
    //     PrivilegeID: null,
    //     PrivilegeClassID: null,
    // };
    displayForm = false;
    operation = 'Add';
    title = 'Privilege_header';
    parent = 'privilege';
    Privileges: any;
    PrivilegeClass: any;
    Employee: any;

    constructor(protected http: HttpService) {
        // this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(privilegeUrl.privilege_header.list).subscribe(
            (res) => {
                this.data = res.data;
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

        this.http.get(privilegeUrl.privilege_class.list).subscribe(
            (res) => {
                this.PrivilegeClass = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        // this.http.get(employeeUrl.employee.list).subscribe(
        //     (res) => {
        //         this.Employee = res.data;
        //     },
        //     (err) => {
        //         console.log(err);
        //     }
        // );
    }

    fetchUsers() {
        if (this.obj.PrivilegeClassID != null && this.obj.PrivilegeID != null) {
            console.log(this.obj)
            swal.showLoading();
            this.http.post(privilegeUrl.privilege_header.staff_available, this.obj)
                .subscribe(success => {
                    this.staff = success.data
                    this.obj.detail = [];
                    swal.close();
                }, error => { swal.close(); });
        }
    }

    // showForm() {
    //     this.displayForm = true;
    //     window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    // }

    // hideForm() {
    //     this.displayForm = false;
    // }

    // addItem() {
    //     this.resetForm();
    //     this.showForm();
    // }

    // processForm() {
    //     let url = privilegeUrl.privilege_header.add;
    //     if (this.operation == 'Update')
    //         url = privilegeUrl.privilege_header.update;
    //     this.save(url);
    // }

    onConfirm() {
        // alert('great')
        console.log(this.obj)
        this.obj2.Privilege = this.Privileges.filter(i => i.id == this.obj.PrivilegeID)[0].privilege_name;
        this.obj2.PrivilegeClass = this.PrivilegeClass.filter(i => i.id == this.obj.PrivilegeClassID)[0].PrivilegeClass;
        this.obj2.detail = [];

        for (let i = 0; i < this.obj.detail.length; i++) {
            console.log(this.obj.detail);
            this.obj2.detail.push(this.staff.filter(j => j.EmployeeID === this.obj.detail[i])[0].staff_name || "")
        }
    }

    processForm() {
        // if (form.valid) {
            let url = privilegeUrl.privilege_header.add;
            this.save(url);
        // }
        console.log(url)
    }


    save(url) {
        // console.log(this.obj);
        this.http.post(url, this.obj)
            .subscribe(success => {
                //this.data = success.data;
                swal.fire("Process Complete", success.message, 'success');
                //this.resetForm();
                this.isEditable = false;
            }, error => {
                console.log(error);
                swal.fire("Process Unsuccessful", error.error.message, 'error');
            });
    }

    // save(url) {
    //     this.http.post(url, this.obj).subscribe(
    //         (res) => {
    //             this.data = res.data;
    //             swal.fire('Process Complete', res.message, 'success');
    //             this.resetForm();
    //         },
    //         (err) => {
    //             console.log(err);
    //             swal.fire('Process Unsuccessful', err.error.message, 'error');
    //         }
    //     );
    // }

    // loadItem(id) {
    //     this.obj = this.data.find((item) => item.id === id.row.data.id);
    //     this.operation = 'Update';
    //     this.showForm();
    // }

    // resetForm() {
    //     this.obj = {
    //         DeptID: null,
    //         UnitID: null,
    //         SupervisorTypeID: null,
    //         DesignationClassID: null,
    //         LocationID: null,
    //         posted_by: null,
    //         date_posted: null,
    //         transID: null,
    //         StageID: null,
    //         PrivilegeID: null,
    //         PrivilegeClassID: null,
    //     };
    //     this.hideForm();
    //     this.operation = 'Add';
    // }
}
