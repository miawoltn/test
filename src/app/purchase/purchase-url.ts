import { API_URL } from '../services/app-config';

export let purchaseUrl = {
    purchase: {
        add: API_URL + 'purchase/add',
        update: API_URL + 'purchase/update',
        list: API_URL + 'purchase/list',
        get: API_URL + 'purchase/get',
    },
    purchasedetails: {
        add: API_URL + 'purchasedetails/add',
        update: API_URL + 'purchasedetails/update',
        list: API_URL + 'purchasedetails/list',
        get: API_URL + 'purchasedetails/get',
    },
    purchasetype: {
        add: API_URL + 'purchasetype/add',
        update: API_URL + 'purchasetype/update',
        list: API_URL + 'purchasetype/list',
        get: API_URL + 'purchasetype/get',
    },
    receipt: {
        add: API_URL + 'receipt/add',
        update: API_URL + 'receipt/update',
        list: API_URL + 'receipt/list',
        get: API_URL + 'receipt/get',
    },
    receivedetails: {
        add: API_URL + 'receivedetails/add',
        update: API_URL + 'receivedetails/update',
        list: API_URL + 'receivedetails/list',
        get: API_URL + 'receivedetails/get',
    },
    receiveorders: {
        add: API_URL + 'receiveorders/add',
        update: API_URL + 'receiveorders/update',
        list: API_URL + 'receiveorders/list',
        get: API_URL + 'receiveorders/get',
    },
};
