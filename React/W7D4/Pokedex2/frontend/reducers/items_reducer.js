import { RECEIVE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

const itemsReducer = (state = {}, action ) => {
    const oldState = Object.freeze(state);
    switch(action.type) {
        case RECEIVE_POKEMON:
            return merge({}, oldState, action.pokemon.items);
        default:
            return oldState;
    }
}; 

export default itemsReducer;