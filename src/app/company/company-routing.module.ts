
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BranchesComponent } from './branches/branches.component'
import { BranchtypesComponent } from './branchtypes/branchtypes.component'
import { CompanyComponent } from './company/company.component'
import { DepartmentgroupComponent } from './departmentgroup/departmentgroup.component'
import { DepartmentsComponent } from './departments/departments.component'
import { DesignationsComponent } from './designations/designations.component'
import { DivisionsComponent } from './divisions/divisions.component'
import { SupervisortypesComponent } from './supervisortypes/supervisortypes.component'
import { UnitsComponent } from './units/units.component'
import { DesignationcategoryComponent } from './designationcategory/designationcategory.component';

const routes: Routes = [{
  path: '',
  data: {
    breadcrumb: 'Company'
  },
  children: [
    {
      path: "branches", component: BranchesComponent, data: {
        breadcrumb: 'Branches'
      }
    },
    {
      path: "branchtypes", component: BranchtypesComponent, data: {
        breadcrumb: 'Branches'
      }
    },

    {
      path: "", component: CompanyComponent, data: {
        breadcrumb: null
      }
    },
    {
      path: "company", component: CompanyComponent, data: {
        breadcrumb: null
      }
    },
    {
      path: "departmentgroup", component: DepartmentgroupComponent, data: {
        breadcrumb: 'Department Group'
      }
    },
    {
      path: "departments", component: DepartmentsComponent, data: {
        breadcrumb: 'Departments'
      }
    },
    {
      path: "designationcategory", component: DesignationcategoryComponent, data: {
        breadcrumb: 'Designation Category'
      }
    },
    {
      path: "designations", component: DesignationsComponent, data: {
        breadcrumb: 'Designations'
      }
    },
    {
      path: "divisions", component: DivisionsComponent, data: {
        breadcrumb: 'Divisions'
      }
    },
    {
      path: "supervisortypes", component: SupervisortypesComponent, data: {
        breadcrumb: 'Supervisor Types'
      }
    },
    {
      path: "units", component: UnitsComponent, data: {
        breadcrumb: 'Units'
      }
    }],
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CompanyRoutingModule { }

