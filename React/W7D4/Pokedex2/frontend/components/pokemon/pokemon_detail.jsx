import React from 'react';
import { Link, Route } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';

class PokemonDetail extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.requestPokemon(this.props.match.params.pokemonId);
    }

    componentDidUpdate(prevProps) {
        if(this.props.match.params.pokemonId !== prevProps.match.params.pokemonId) {
            this.props.requestPokemon(this.props.match.params.pokemonId);
        }
    }
    render() {
        let itemsElements = null;
        if (this.props.items !== {} && this.props.pokemon.item_ids){
    
            itemsElements = Object.keys(this.props.items).map((item) => {
                if(this.props.items[item].pokemon_id === this.props.pokemon.id){
                    const linkTo = `/pokemon/${this.props.pokemon.id}/items/${item}`;
                    return <li className="item-pic" key={item}> <Link to={linkTo}> <img src={this.props.items[item].image_url} height="100" /> </Link></li>
                }
            });
        }
        return (
        <div className="pokemon-show">
            <div><img src={this.props.pokemon.image_url} /></div>
            <span className="pokemon-name">{this.props.pokemon.name}</span>
            <ul className="item-pic-list">
            {itemsElements}</ul>
            <Route path="/pokemon/:pokemonId/items/:itemId" component={ItemDetailContainer} />
        </div>
    )}
}

export default PokemonDetail;