import Greeting from './greeting';
import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { logout } from  '../actions/session_actions';

/* 
    Greeting has Props which is an { random_props } 
    mapStateToProp merges return value with Greeting's props
    { user, random_props }

    { {}, }
*/

const mapStateToProps = (state, ownProps) => {
    const session_id = state.session.id;
    const user = state.entities.users[session_id];
    return { 
        user 
    };
};

const mapDispatchToProps = dispatch => {
    return {
        logout: ()=> dispatch( logout() )
    };
};
export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Greeting));

