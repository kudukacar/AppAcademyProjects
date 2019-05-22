import React from 'react';

class PokemonIndex extends React.Component {
    constructor(props){
        super(props);
    }
    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render(){
        const { pokemon } = this.props;
        const lists = pokemon.map((poke, index) => {
            return <li key={index} > {poke.name} <img src={poke.image_url} alt="" width="50" /></li>
        });
        return ( <ul>{lists}</ul> 
        );
    }
}

export default PokemonIndex;