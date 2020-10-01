import { API_URL } from '../services/app-config';

export let requisitionUrl = {
    requisition: {
        add: API_URL + 'requisition/add',
        update: API_URL + 'requisition/update',
        list: API_URL + 'requisition/list',
        get: API_URL + 'requisition/get',
    },
    requisitiondetails: {
        add: API_URL + 'requisitiondetails/add',
        update: API_URL + 'requisitiondetails/update',
        list: API_URL + 'requisitiondetails/list',
        get: API_URL + 'requisitiondetails/get',
    },
};
