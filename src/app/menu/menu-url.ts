import { API_URL } from '../services/app-config';

export let menuUrl = {
    menu: {
        add: API_URL + 'menu/add',
        update: API_URL + 'menu/update',
        list: API_URL + 'menu/list',
        get: API_URL + 'menu/get',
    },
    menuauthorization: {
        add: API_URL + 'menuauthorization/add',
        update: API_URL + 'menuauthorization/update',
        list: API_URL + 'menuauthorization/list',
        get: API_URL + 'menuauthorization/get',
        delete: API_URL + 'menuauthorization/delete',
    },
    menutype: {
        add: API_URL + 'menutype/add',
        update: API_URL + 'menutype/update',
        list: API_URL + 'menutype/list',
        get: API_URL + 'menutype/get',
    },
    modules: {
        add: API_URL + 'modules/add',
        update: API_URL + 'modules/update',
        list: API_URL + 'modules/list',
        get: API_URL + 'modules/get',
    },
};
