import { API_URL } from '../services/app-config';

export let expenseUrl = {
    expensecategory: {
        add: API_URL + 'expensecategory/add',
        update: API_URL + 'expensecategory/update',
        list: API_URL + 'expensecategory/list',
        get: API_URL + 'expensecategory/get',
    },
    expenseline: {
        add: API_URL + 'expenseline/add',
        update: API_URL + 'expenseline/update',
        list: API_URL + 'expenseline/list',
        get: API_URL + 'expenseline/get',
    },
};
