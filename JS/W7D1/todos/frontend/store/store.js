import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducers';

// const configureStore = () => {
//     createStore(rootReducer);
// };

// export default configureStore(rootReducer);

export default createStore(rootReducer);