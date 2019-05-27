import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchBenches} from './actions/bench_actions';

document.addEventListener('DOMContentLoaded', () => {
    let store;
    if(window.currentUser) {
        const preloadedState = {
            entities: {
                users: {[window.currentUser.id]: window.currentUser }
            },
            session: { id: window.currentUser.id}
        };
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }
    window.store = store;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    

    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
});

window.fetchBenches = fetchBenches;

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