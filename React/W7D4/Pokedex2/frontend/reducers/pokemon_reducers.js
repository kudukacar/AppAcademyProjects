import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

const pokemonReducer = (state = {}, action ) => {
    const oldState = Object.freeze(state);
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            return merge({}, oldState, action.pokemon);
        case RECEIVE_POKEMON:
            // debugger
            const newObj = {
                [action.pokemon.pokemon.id]: action.pokemon.pokemon,
            };
            return merge({}, oldState, newObj);
        default:
            return oldState;
    }
};

export default pokemonReducer;