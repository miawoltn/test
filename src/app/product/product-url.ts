import { API_URL } from '../services/app-config';

export let productUrl = {
    product: {
        add: API_URL + 'product/add',
        update: API_URL + 'product/update',
        list: API_URL + 'product/list',
        get: API_URL + 'product/get',
    },
    productcategory: {
        add: API_URL + 'productcategory/add',
        update: API_URL + 'productcategory/update',
        list: API_URL + 'productcategory/list',
        get: API_URL + 'productcategory/get',
    },
    producttype: {
        add: API_URL + 'producttype/add',
        update: API_URL + 'producttype/update',
        list: API_URL + 'producttype/list',
        get: API_URL + 'producttype/get',
    },
};
