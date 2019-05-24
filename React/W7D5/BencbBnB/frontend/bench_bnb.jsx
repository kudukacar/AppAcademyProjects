import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { login, logout } from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    window.store = store;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.login = login;
    window.logout = logout;

    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
});


/*
next is the original functionality of dispatch,
which is something like

   this.store.state = reducer(this.store.state, action )



Because of the thunk, dispatch = action => {
    if action is function
        action(dispatch, state)
    else
        next(action)
}
*/