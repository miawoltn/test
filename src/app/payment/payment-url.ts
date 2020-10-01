
import { API_URL } from '../services/app-config';

export let paymentUrl = {
	payment: { 
		add: API_URL + 'payment/add',
		update: API_URL + 'payment/update',
		list: API_URL + 'payment/list',
		get: API_URL + 'payment/get',
    },
	paymentmethod: { 
		add: API_URL + 'paymentmethod/add',
		update: API_URL + 'paymentmethod/update',
		list: API_URL + 'paymentmethod/list',
		get: API_URL + 'paymentmethod/get',
    },
	paymentplan: { 
		add: API_URL + 'paymentplan/add',
		update: API_URL + 'paymentplan/update',
		list: API_URL + 'paymentplan/list',
		get: API_URL + 'paymentplan/get',
    },
	paymenttranche: { 
		add: API_URL + 'paymenttranche/add',
		update: API_URL + 'paymenttranche/update',
		list: API_URL + 'paymenttranche/list',
		get: API_URL + 'paymenttranche/get',
    },
	paymenttype: { 
		add: API_URL + 'paymenttype/add',
		update: API_URL + 'paymenttype/update',
		list: API_URL + 'paymenttype/list',
		get: API_URL + 'paymenttype/get',
    },
	

}
