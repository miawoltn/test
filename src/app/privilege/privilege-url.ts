import { API_URL } from '../services/app-config';

export let privilegeUrl = {
    privileges: {
        add: API_URL + 'privileges/add',
        update: API_URL + 'privileges/update',
        list: API_URL + 'privileges/list',
        get: API_URL + 'privileges/get',
    },
    privilege_activity: {
        add: API_URL + 'privilege_activity/add',
        update: API_URL + 'privilege_activity/update',
        list: API_URL + 'privilege_activity/list',
        get: API_URL + 'privilege_activity/get',
    },
    privilege_activitydetails: {
        add: API_URL + 'privilege_activitydetails/add',
        update: API_URL + 'privilege_activitydetails/update',
        list: API_URL + 'privilege_activitydetails/list',
        get: API_URL + 'privilege_activitydetails/get',
    },
    privilege_assign: {
        add: API_URL + 'privilege_assign/add',
        update: API_URL + 'privilege_assign/update',
        list: API_URL + 'privilege_assign/list',
        get: API_URL + 'privilege_assign/get',
    },
    privilege_class: {
        add: API_URL + 'privilege_class/add',
        update: API_URL + 'privilege_class/update',
        list: API_URL + 'privilege_class/list',
        get: API_URL + 'privilege_class/get',
    },
    privilege_details: {
        add: API_URL + 'privilege_details/add',
        update: API_URL + 'privilege_details/update',
        list: API_URL + 'privilege_details/list',
        get: API_URL + 'privilege_details/get',
    },
    privilege_header: {
        add: API_URL + 'privilege_header/add',
        update: API_URL + 'privilege_header/update',
        list: API_URL + 'privilege_header/list',
        get: API_URL + 'privilege_header/get',
        staff_available: API_URL +'privilege_header/staff-available',
    },
    privilege_type: {
        add: API_URL + 'privilege_type/add',
        update: API_URL + 'privilege_type/update',
        list: API_URL + 'privilege_type/list',
        get: API_URL + 'privilege_type/get',
    },
};
