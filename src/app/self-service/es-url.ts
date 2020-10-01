
import { API_URL } from '../services/app-config';

export let essUrl = {
    payroll: {
        mypayroll: API_URL + 'payrollgenerated/emp-netpay',
        payslip: API_URL + 'payrollgenerated/emp-pay-slip',
    },
    leave: {
        summary: API_URL + 'leaveapplication/summary',
    }
};


