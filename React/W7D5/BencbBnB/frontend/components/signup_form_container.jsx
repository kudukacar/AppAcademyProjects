import SessionForm from './session_form';
import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { signup } from '../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
    return {
        errors: state.errors,
        type: 'signup'
    };
};

const mapDispatchToProps = dispatch => {
    return {
        processForm: (user) => dispatch(signup(user)),
    };
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(SessionForm));