import SessionForm from './session_form';
import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { login } from '../actions/session_actions';

const mapStateToProps = (state, ownProps) => {

    return {
        errors: state.errors,
        type: 'login'
    };
};

const mapDispatchToProps = dispatch => {
    return {
        processForm: (user) => dispatch(login(user)), 
    };
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(SessionForm));