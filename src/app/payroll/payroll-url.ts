
import { API_URL } from '../services/app-config';

export let payrollUrl = {
	payrollcategory: {
		add: API_URL + 'payrollcategory/add',
		update: API_URL + 'payrollcategory/update',
		list: API_URL + 'payrollcategory/list',
		get: API_URL + 'payrollcategory/get',
	},
	payrollgenerated: {
		add: API_URL + 'payrollgenerated/add',
		update: API_URL + 'payrollgenerated/update',
		list: API_URL + 'payrollgenerated/list',
		get: API_URL + 'payrollgenerated/get',
		netpay: API_URL + 'payrollgenerated/netpay',
		details: API_URL + 'payrollgenerated/payrolldetails',
		details2: API_URL + 'payrollgenerated/payrolldetails2',
		dashboard:  API_URL + 'payrollgenerated/dashboard'
	},
	payrollgenerateddetail: {
		add: API_URL + 'payrollgenerateddetail/add',
		update: API_URL + 'payrollgenerateddetail/update',
		list: API_URL + 'payrollgenerateddetail/list',
		get: API_URL + 'payrollgenerateddetail/get',
	},
	payrollinstances: {
		add: API_URL + 'payrollinstances/add',
		update: API_URL + 'payrollinstances/update',
		list: API_URL + 'payrollinstances/list',
		get: API_URL + 'payrollinstances/get',
		cancel: API_URL + 'payrollinstances/cancel',
		process: API_URL + 'payrollinstances/process',
	},
	payrollinstancetypes: {
		add: API_URL + 'payrollinstancetypes/add',
		update: API_URL + 'payrollinstancetypes/update',
		list: API_URL + 'payrollinstancetypes/list',
		get: API_URL + 'payrollinstancetypes/get',
	},
	payrollledger: {
		add: API_URL + 'payrollinstancetypes/add',
		update: API_URL + 'payrollinstancetypes/update',
		list: API_URL + 'payrollinstancetypes/list',
		get: API_URL + 'payrollinstancetypes/get',
	},
	payrollperiod: {
		add: API_URL + 'payrollperiod/add',
		update: API_URL + 'payrollperiod/update',
		list: API_URL + 'payrollperiod/list',
		get: API_URL + 'payrollperiod/get',
		unprocessed: API_URL + 'payrollperiod/unprocessed',
		processed: API_URL + 'payrollperiod/processed',
	},
	payrollreport: {
		add: API_URL + 'payrollreport/add',
		update: API_URL + 'payrollreport/update',
		list: API_URL + 'payrollreport/list',
		get: API_URL + 'payrollreport/get',
	},
	payrollyear: {
		add: API_URL + 'payrollyear/add',
		update: API_URL + 'payrollyear/update',
		list: API_URL + 'payrollyear/list',
		get: API_URL + 'payrollyear/get',
	},
	processpayroll: {
		add: API_URL + 'processpayroll/add',
		update: API_URL + 'processpayroll/update',
		list: API_URL + 'processpayroll/list',
		get: API_URL + 'processpayroll/get',

	},
	processtype: {
		add: API_URL + 'processtype/add',
		update: API_URL + 'processtype/update',
		list: API_URL + 'processtype/list',
		get: API_URL + 'processtype/get',
	},
}
