import { MySharedEvent } from 'src/app/services/shared-events.service';
import { SharedModule } from './shared.module';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MAT_STEPPER_GLOBAL_OPTIONS } from '@angular/cdk/stepper';
import { MatStepperModule } from '@angular/material/stepper';
import { MatIconModule } from '@angular/material/icon';
import { FormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { DxButtonModule, DxPieChartModule } from 'devextreme-angular';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DashboardLayoutComponent } from './layouts/dashboard-layout/dashboard-layout.component';
import { SimpleLayoutComponent } from './layouts/simple-layout/simple-layout.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { GenericService } from './services/generic.service';
import { TokenInterceptorService } from './services/token-interceptor.service';
import { AuthService } from './services/auth.service';
import { AuthGuard } from './services/auth.guard';
import { LoginComponent } from './components/login/login.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AuthLayoutComponent } from './layouts/auth-layout/auth-layout.component';
import { DtService } from './services/dt.service';
import { LockscreenComponent } from './components/lockscreen/lockscreen.component';
import { ForgotPasswordComponent } from './components/forgot-password/forgot-password.component';
import { Error404Component } from './components/error404/error404.component';
import { Error505Component } from './components/error505/error505.component';
import { BreadcrumbComponent } from './components/breadcrumb/breadcrumb.component';
// import { PageComponent } from './page/page.component';
// import { CalenderService } from './services/fullcalendar.service';
// import { PreviewLayoutComponent } from './layouts/preview-layout/preview-layout.component';
import { BreadcrumbModule } from 'primeng/breadcrumb';
import { NewLayoutComponent } from './layouts/new-layout/new-layout.component';
import { Header2Component } from './components/header2/header2.component';
import { CustomPreloadingStrategy } from './services/custom-preloading,strategy';
import { MatDialogModule, MAT_DIALOG_DEFAULT_OPTIONS } from '@angular/material/dialog';
import { MAT_RADIO_DEFAULT_OPTIONS } from '@angular/material/radio';
import { UserIdleModule } from 'angular-user-idle';
import { ChatInboxComponent } from './components/chat-inbox/chat-inbox.component';
import { ResetPasswordComponent } from './components/reset-password/reset-password.component';

import { TextMaskModule } from 'angular2-text-mask';
import * as $ from 'jquery';


@NgModule({
    declarations: [
        AppComponent,
        DashboardLayoutComponent,
        SimpleLayoutComponent,
        HeaderComponent,
        FooterComponent,
        SidebarComponent,
        LoginComponent,
        AuthLayoutComponent,
        DashboardComponent,
        LockscreenComponent,
        ForgotPasswordComponent,
        ResetPasswordComponent,
        Error404Component,
        Error505Component,
        BreadcrumbComponent,
        NewLayoutComponent,
        Header2Component,
        ChatInboxComponent,
//        FullCalendarModule

        // PageComponent,
        // PreviewLayoutComponent
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        BrowserAnimationsModule,
        HttpClientModule,
        FormsModule,
        TextMaskModule,
        MatStepperModule,
        MatIconModule,
        NgSelectModule,
        DxButtonModule,
        BreadcrumbModule,
        SharedModule, DxPieChartModule,
        MatDialogModule,
        UserIdleModule.forRoot({ idle: 600, timeout: 60, ping: 120 })
    ],
    providers: [
        {
            provide: MAT_STEPPER_GLOBAL_OPTIONS,
            useValue: {
                displayDefaultIndicatorType: true, showError: true,
            },
        },
        {
            provide: MAT_RADIO_DEFAULT_OPTIONS,
            useValue: { color: 'accent' },
        },
        GenericService,
        {
            provide: HTTP_INTERCEPTORS,
            useClass: TokenInterceptorService,
            multi: true,
        },
        // AuthService, AuthGuard, DtService, CalenderService
        AuthService,
        AuthGuard,
        DtService,
        MySharedEvent, CustomPreloadingStrategy
    ],
    bootstrap: [AppComponent],
})
export class AppModule { }
