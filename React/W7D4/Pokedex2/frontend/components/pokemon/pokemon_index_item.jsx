import React from 'react';
import { Link } from 'react-router-dom';


export const PokemonIndexItem = (props) => {
    const { pokemon } = props;
    const linkTo = `/pokemon/${pokemon.id}`;
    return (
        <li> <Link to={linkTo} > <img src={pokemon.image_url} alt="" width="20" /> {pokemon.name} </Link></li>
    );
};