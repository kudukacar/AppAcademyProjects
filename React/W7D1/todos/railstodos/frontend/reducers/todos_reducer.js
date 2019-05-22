import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions';
import { merge } from 'lodash';
import { receiveTodos, receiveTodo } from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: 'make todo list',
        body: 'with redux',
        done: false
    }
};

const todosReducer = ( state=initialState, action ) => {

    const newTodo = {};

    switch(action.type) {
        case RECEIVE_TODOS:
            // const {todos} = action;
            action.todos.forEach (todo => {
                // newTodo[todo.id] = todo.title;
                const { id, title } = todo;
                newTodo[id] = {
                    id: id,
                    title: title,
                };
            });
            return newTodo;
        case RECEIVE_TODO: 
            const { id, title } = action.todo;
            const oneTodo = {
                [id]: {
                    id: id,
                    title: title,
                }
            };
            
            const newState = merge({}, state, oneTodo);
            return newState;
        default:
            return state;
    }
};

export default todosReducer;