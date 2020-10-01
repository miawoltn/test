import { API_URL } from '../services/app-config';
export let chartsUrl = {
	charts: {
		add: API_URL + 'charts/add',
		update: API_URL + 'charts/update',
		list: API_URL + 'charts/list',
		get: API_URL + 'charts/get',
	},
	chart_category: {
		add: API_URL + 'chart_category/add',
		update: API_URL + 'chart_category/update',
		list: API_URL + 'chart_category/list',
		get: API_URL + 'chart_category/get',
	},
	chart_providers: {
		add: API_URL + 'chart_providers/add',
		update: API_URL + 'chart_providers/update',
		list: API_URL + 'chart_providers/list',
		get: API_URL + 'chart_providers/get',
	},
	chart_types: {
		add: API_URL + 'chart_types/add',
		update: API_URL + 'chart_types/update',
		list: API_URL + 'chart_types/list',
		get: API_URL + 'chart_types/get',
	},
	dashboardsetting: {
		add: API_URL + 'dashboardsetting/add',
		update: API_URL + 'dashboardsetting/update',
		list: API_URL + 'dashboardsetting/list',
		get: API_URL + 'dashboardsetting/get',
	},
	submodules: {
		list: API_URL + 'menu/submodules',
	}
}

