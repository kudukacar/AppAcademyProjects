import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
import {receiveTodos, receiveTodo} from "./actions/todo_actions";
import { merge } from 'lodash';
import Root from './components/root';
import selector from './reducers/selectors';



document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("content");
    ReactDOM.render(<Root store={store} />, root);
})

//test
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.merge = merge;
window.selector = selector;