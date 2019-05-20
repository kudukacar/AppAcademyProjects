export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos,
    };
};

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo,
    };
};

// const newTodos = [
//     {id: 1, title: 'this is a test 1'},
//     {id: 5, title: 'this is a test 5'}
// ];