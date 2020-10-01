import { API_URL } from '../services/app-config';

export let vendorUrl = {
    vendor: {
        add: API_URL + 'vendor/add',
        update: API_URL + 'vendor/update',
        list: API_URL + 'vendor/list',
        get: API_URL + 'vendor/get',
    },
    vendorcategory: {
        add: API_URL + 'vendorcategory/add',
        update: API_URL + 'vendorcategory/update',
        list: API_URL + 'vendorcategory/list',
        get: API_URL + 'vendorcategory/get',
    },
    vendors: {
        add: API_URL + 'vendors/add',
        update: API_URL + 'vendors/update',
        list: API_URL + 'vendors/list',
        get: API_URL + 'vendors/get',
    },
    vendortype: {
        add: API_URL + 'vendortype/add',
        update: API_URL + 'vendortype/update',
        list: API_URL + 'vendortype/list',
        get: API_URL + 'vendortype/get',
    },
};
