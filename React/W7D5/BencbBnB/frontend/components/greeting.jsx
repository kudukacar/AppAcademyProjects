import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = (props) => {

    if (props.user){
        return (
            <div>
                <h3> Welcome {props.user.username} </h3>
                <button onClick={ props.logout } 
                    type='button'> Sign Out</button>
            </div>
        )
    } else {
        return (
            <div>
                <Link to='/signup'> Sign Up </Link>
                <Link to='/login'> Login </Link>
            </div>
        )
    }

}

export default Greeting;