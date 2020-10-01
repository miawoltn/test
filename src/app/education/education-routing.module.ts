
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GradelevelsComponent } from './gradelevels/gradelevels.component';
import { GradesComponent } from './grades/grades.component';
import { ProgrammetypesComponent } from './programmetypes/programmetypes.component';
import { QualificationgradeComponent } from './qualificationgrade/qualificationgrade.component';
import { QualificationsComponent } from './qualifications/qualifications.component';
import { SchooltypesComponent } from './schooltypes/schooltypes.component';

const routes: Routes = [{
    path: '',
    data: { breadcrumb: 'Education' },
    children: [
        {
            path: 'gradelevels', component: GradelevelsComponent,
            data: { breadcrumb: 'Grade Levels' }
        },
        {
            path: 'grades', component: GradesComponent,
            data: { breadcrumb: 'Grades' }
        },
        {
            path: 'programmetypes', component: ProgrammetypesComponent,
            data: { breadcrumb: 'Programme Types' }
        },
        {
            path: 'qualificationgrade', component: QualificationgradeComponent,
            data: { breadcrumb: 'Qualification Grades' }
        },
        {
            path: 'qualifications', component: QualificationsComponent,
            data: { breadcrumb: 'Qualifications' }
        },
        {
            path: 'schooltypes', component: SchooltypesComponent,
            data: { breadcrumb: 'School Types' }
        },]
}
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class EducationRoutingModule { }
