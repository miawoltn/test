import { Injectable } from '@angular/core';
import Swal from 'sweetalert2';

declare let alertify: any;

@Injectable({
  providedIn: 'root'
})

export class AlertService {

  constructor() { }

  alert(message: string) {
    Swal.fire('Immigration Alert', message);
    // alertify.alert('Payarya Alert', message);
  }

  success(message: string) {
    Swal.fire({
      type: 'success',
      title: message,
      showConfirmButton: false,
      timer: 1500
    });
  }

  error(message: string) {
    Swal.fire({
      type: 'error',
      title: message,
      showConfirmButton: true,
      // timer: 1500
    });
  }

  showLoading()
  {
    Swal.showLoading();
  }

  hideLoading()
  {
    Swal.close();
  }

  /* confirm(message:string, callback: () => any)
  {
    alertify.confirm('Confirm Request', message, function(){ alertify.success('Ok');}
                , function(){ alertify.error('Cancel');});
  }

  alert(message:string)
  {
    alertify.alert('Payarya Alert', message);

  }

  success(message:string)
  {
    alertify.success(message);
  }

  error(message:string)
  {
    alertify.error(message);
  }

  warning(message:string)
  {
    alertify.warning(message);
  }

  message(message:string)
  {
    alertify.message(message);
  }

  notify(message:string)
  {
    alertify.notify(message, 'success', 5, function(){  console.log('dismissed'); });
  }

  prompt(message:string)
  {
    alertify.prompt( 'Prompt Title', 'Prompt Message', 'Prompt Value'
               , function(evt, value) { alertify.success('You entered: ' + value);}
               , function() { alertify.error('Cancel');});
  } */


}
