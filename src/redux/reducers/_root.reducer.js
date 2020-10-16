import { combineReducers } from 'redux';
import errors from './errors.reducer';
import user from './user.reducer';
import parks from './parks.reducer';
import park from './park.reducer';
import trip from './trip.reducer';
import images from './images.reducer';
import userTrips from './userTrips.reducer';
// rootReducer is the primary reducer for our entire project
// It bundles up all of the other reducers so our project can use them.
// This is imported in index.js as rootSaga

// Lets make a bigger object for our store, with the objects from our reducers.
// This is what we get when we use 'state' inside of 'mapStateToProps'
const rootReducer = combineReducers({
  errors, // contains registrationMessage and loginMessage
  user, // will have an id and username if someone is logged in
  parks, //contains all parks
  park,
  trip,
  images,
  userTrips,
});

export default rootReducer;
