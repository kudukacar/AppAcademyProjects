import { connect } from 'react-redux';
import ItemDetail from './item_detail';


const msp = (state, ownProps) => {
    const id = ownProps.match.params.itemId;
    return {
        item: state.entities.items[id] || {},
    };
};

// const mdp = dispatch => {

// }

export default connect(msp)(ItemDetail);