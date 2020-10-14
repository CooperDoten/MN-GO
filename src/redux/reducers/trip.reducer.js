const tripReducer = (state = {}, action) => {
    switch (action.type) {
      case 'SET_TRIP':
        return action.payload;
      default:
        return state;
    }
  };
  
  export default tripReducer;