
import { API_URL } from '../services/app-config';

export let loanUrl = {
	loanapplication: {
		add: API_URL + 'loanapplication/add',
		update: API_URL + 'loanapplication/update',
		list: API_URL + 'loanapplication/list',
		get: API_URL + 'loanapplication/get',
		mine: API_URL + 'loanapplication/employee-request',
		mylist: API_URL + 'loanapplication/pending-approvals',
		hrlist: API_URL + 'loanapplication/hr-approval',
		balance: API_URL + 'loanapplication/balance',
		chart: API_URL + 'loanapplication/charts',
		report: API_URL + 'loanapplication/report',
		dashboard: API_URL + 'loanapplication/dashboard',
	},
	loanapproval: {
		add: API_URL + 'loanapproval/add',
		update: API_URL + 'loanapproval/update',
		list: API_URL + 'loanapproval/list',
		get: API_URL + 'loanapproval/get',
		history: API_URL + 'loanapproval/get-history',
		mylist: API_URL + 'loanapproval/mylist',
	},
	loanrepayment: {
		add: API_URL + 'loanrepayment/add',
		update: API_URL + 'loanrepayment/update',
		list: API_URL + 'loanrepayment/list',
		get: API_URL + 'loanrepayment/get',
	},
	loanrepaymentsource: {
		add: API_URL + 'loanrepaymentsource/add',
		update: API_URL + 'loanrepaymentsource/update',
		list: API_URL + 'loanrepaymentsource/list',
		get: API_URL + 'loanrepaymentsource/get',
	},
	loanrepaymenttype: {
		add: API_URL + 'loanrepaymenttype/add',
		update: API_URL + 'loanrepaymenttype/update',
		list: API_URL + 'loanrepaymenttype/list',
		get: API_URL + 'loanrepaymenttype/get',
	},
	loantypes: {
		add: API_URL + 'loantypes/add',
		update: API_URL + 'loantypes/update',
		list: API_URL + 'loantypes/list',
		get: API_URL + 'loantypes/get',
	},
}

