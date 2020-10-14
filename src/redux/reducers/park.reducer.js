const parkReducer = (state = {}, action) => {
    switch (action.type) {
      case 'SET_PARK':
        return action.payload;
      default:
        return state;
    }
  };
  
  export default parkReducer;