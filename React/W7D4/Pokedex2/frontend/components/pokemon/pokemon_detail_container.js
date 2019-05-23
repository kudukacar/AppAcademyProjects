import { connect } from 'react-redux';
// import { selectAllPokemon } from '../../reducers/selectors';
import { requestPokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const msp = (state, ownProps) => {
    // debugger
    const id= ownProps.match.params.pokemonId;
    // let myItems = {};
    // if(state.entities.items!={})
    // if (state.entities.pokemon[id]) {

    // }

    return {
        pokemon: state.entities.pokemon[id] || {},
        // items: state.entities.pokemon[id].item_ids || {},
        items: state.entities.items || {},
    };
};

const mdp = dispatch => {
    return {
        requestPokemon: (id) => {
            dispatch(requestPokemon(id));
        },
    };
};

export default connect(msp,mdp)(PokemonDetail);