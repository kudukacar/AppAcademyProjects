import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
        this.handleSubmit = this.handleSubmit.bind(this);
        this.update = this.update.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user).then( () => this.props.history.push('/'));
    }

    update(field){
        return (event)=>{
            event.preventDefault();
            this.setState( { [field]: event.target.value });
        };
    }

    render() {
        let error;
        if(this.props.errors) {
            error =  Object.values(this.props.errors).map(error => <li>{error}</li>);
        }

        return (
            <div>
            <h1> {this.props.type === "login" ? 'LOGIN' : 'SIGN UP'}</h1>
             <form onSubmit={this.handleSubmit}>
                <label> Username
                    <input onChange={this.update('username')} type='text' value={this.state.username}/>
                </label>


                <label> Password
                    <input onChange={this.update('password')} type='password' value={this.state.password} />
                </label>

                    <input type='submit' value={this.props.type === "login" ? 'LOGIN' : 'SIGN UP'}/>
             </form>
                {this.props.type === "login" ? <Link to='/signup' /> : <Link to='/login' /> }
                <ul>{error}</ul>
            </div>
        )
    }
}

export default SessionForm;