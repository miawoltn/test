
import { API_URL } from '../services/app-config';

export let itemUrl = {
	itemcategory: { 
		add: API_URL + 'itemcategory/add',
		update: API_URL + 'itemcategory/update',
		list: API_URL + 'itemcategory/list',
		get: API_URL + 'itemcategory/get',
    },
	items: { 
		add: API_URL + 'items/add',
		update: API_URL + 'items/update',
		list: API_URL + 'items/list',
		get: API_URL + 'items/get',
    },
	itemstatus: { 
		add: API_URL + 'itemstatus/add',
		update: API_URL + 'itemstatus/update',
		list: API_URL + 'itemstatus/list',
		get: API_URL + 'itemstatus/get',
    },
	itemtype: { 
		add: API_URL + 'itemtype/add',
		update: API_URL + 'itemtype/update',
		list: API_URL + 'itemtype/list',
		get: API_URL + 'itemtype/get',
    },
	

}
