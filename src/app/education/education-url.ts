
import { API_URL } from '../services/app-config';

export let educationUrl = {
	gradelevels: { 
		add: API_URL + 'gradelevels/add',
		update: API_URL + 'gradelevels/update',
		list: API_URL + 'gradelevels/list',
		get: API_URL + 'gradelevels/get',
    },
	grades: { 
		add: API_URL + 'grades/add',
		update: API_URL + 'grades/update',
		list: API_URL + 'grades/list',
		get: API_URL + 'grades/get',
    },
	programmetypes: { 
		add: API_URL + 'programmetypes/add',
		update: API_URL + 'programmetypes/update',
		list: API_URL + 'programmetypes/list',
		get: API_URL + 'programmetypes/get',
    },
	qualificationgrade: { 
		add: API_URL + 'qualificationgrade/add',
		update: API_URL + 'qualificationgrade/update',
		list: API_URL + 'qualificationgrade/list',
		get: API_URL + 'qualificationgrade/get',
    },
	qualifications: { 
		add: API_URL + 'qualifications/add',
		update: API_URL + 'qualifications/update',
		list: API_URL + 'qualifications/list',
		get: API_URL + 'qualifications/get',
    },
	schooltypes: { 
		add: API_URL + 'schooltypes/add',
		update: API_URL + 'schooltypes/update',
		list: API_URL + 'schooltypes/list',
		get: API_URL + 'schooltypes/get',
    },
	

}
