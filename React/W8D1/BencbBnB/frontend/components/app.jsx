import React from 'react';
import GreetingContainer from './greeting_container';
import {Route} from 'react-router-dom';
import { AuthRoute } from '../util/route_util';
import loginForm from './login_form_container';
import signupForm from './signup_form_container';
import SearchContainer from './search_container';

const App = () => (
    <div>
        <header>
            <h1>Bench BnB</h1>
            <GreetingContainer />
        </header>
        <AuthRoute path="/login" component={loginForm} />
        <AuthRoute path="/signup" component={signupForm} />
        <Route exact path="/" component={ SearchContainer } />

    </div>
);

export default App;