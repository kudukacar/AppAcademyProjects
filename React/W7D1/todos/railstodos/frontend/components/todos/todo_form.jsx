import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        // debugger
        super(props);
        
        // const { receiveTodo } = props;
        this.state = {
            title: "",
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }
    
    handleChange(title) {
        return(e) => {
            this.setState({[title]: e.target.value});
            // debugger
        }
    }
    
    handleSubmit(e) {
        e.preventDefault();
        const todo = this.state;
        todo.id = Math.floor(Math.random() * 10000);
        this.props.receiveTodo(todo);
        this.setState({title: ''});
        debugger
    }

    render() {
        const { title } = this.state;
        return(
            <form onSubmit={this.handleSubmit} className="todo-form">
                <label htmlFor="todo-title">Title
                    <input
                        id="todo-title"
                        type="text"
                        onChange={this.handleChange('title')}
                        value={title}
                    />
                </label>
                <input type="submit" className="todo-button" value="Todo!" />
            </form>
        );
    }
}

export default TodoForm;