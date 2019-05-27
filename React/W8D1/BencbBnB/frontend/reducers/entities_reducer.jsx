import { combineReducers } from 'redux';
import usersReducer from './user_reducer';
import benchesReducer from './benches_reducer';

export default combineReducers({
    users: usersReducer,
    benches: benchesReducer
});