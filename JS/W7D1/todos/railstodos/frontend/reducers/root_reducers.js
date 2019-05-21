import { combineReducers } from 'redux';
import todos from './todos_reducer';


const rootReducer = (state={}, action) => {
    return {
        todos: todos(state.todos, action)
    };
};

export default rootReducer;