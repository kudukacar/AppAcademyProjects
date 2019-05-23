import React from 'react';

class ItemDetail extends React.Component {

    render() {
        return (
            <ul className="item-show">
                <li className="item-name"> {this.props.item.name}</li>
                <li>Price: {this.props.item.price}</li>
            </ul>
        )

    }
}

export default ItemDetail;