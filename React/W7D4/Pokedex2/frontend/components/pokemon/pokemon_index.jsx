import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';
import { Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';

class PokemonIndex extends React.Component {
    constructor(props){
        super(props);
    }
    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render(){
        const { pokemon } = this.props;
        // const lists = pokemon.map((poke, index) => {
        //     return <li key={index} > <img src={poke.image_url} alt="" width="20" /> {poke.name}</li>
        // });
        const pokemonItems = pokemon.map((poke, idx) => <PokemonIndexItem key={idx} pokemon={poke} />);

        // const pokemonItems = pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />);
        return ( 
            // <ol>{lists}</ol> 
            <>
                <section className="pokedex">
                    <ul>
                        {pokemonItems}
                    </ul>
                </section>
                <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
            </>
        );
    }
}

export default PokemonIndex;