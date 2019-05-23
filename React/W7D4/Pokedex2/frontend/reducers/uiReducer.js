const uiReducer = (state = {}, action) => {
    const oldState = Object.freeze(state);
    switch(action.type) {
        default:
            return oldState;
    }
};

export default uiReducer;