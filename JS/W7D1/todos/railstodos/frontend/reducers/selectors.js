import React from 'react';

const allTodos = (state) => {
    const allList = Object.keys(state.todos);
    return allList.map(id => state.todos[id]);
};

export default allTodos;