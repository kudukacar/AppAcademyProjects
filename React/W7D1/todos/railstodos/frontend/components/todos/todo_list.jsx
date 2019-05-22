import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

export const todoList = (props) => {

    const allItems = props.todos.map((todo, idx) => (
        <TodoListItem todo={todo} key={idx} />
        
    ));

    return (
        <>
            <h3>Todo List goes here!</h3>
            <ul>
                {allItems}
            </ul>
            <TodoForm receiveTodo={props.receiveTodo}/>
        </>
    )
}