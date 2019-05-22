import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducers';
import { thunk } from '../middleware/thunk';
import { applyMiddleware } from 'redux';

// const configureStore = () => {
//     createStore(rootReducer);
// };

// export default configureStore(rootReducer);

export default createStore(rootReducer, applyMiddleware(thunk));