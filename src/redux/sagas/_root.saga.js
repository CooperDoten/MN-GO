import { all } from 'redux-saga/effects';
import loginSaga from './login.saga';
import registrationSaga from './registration.saga';
import userSaga from './user.saga';
import parkSaga from './park.saga';
import parkDetails from './parkDetails.saga';
import trip from './createTrip.saga';
import images from './images.saga';
import userTrips from './fetchTrips.saga';
// rootSaga is the primary saga.
// It bundles up all of the other sagas so our project can use them.
// This is imported in index.js as rootSaga

// some sagas trigger other sagas, as an example
// the registration triggers a login
// and login triggers setting the user
export default function* rootSaga() {
  yield all([
    loginSaga(), // login saga is now registered
    registrationSaga(),
    userSaga(),
    parkSaga(),
    parkDetails(),
    trip(),
    images(),
    userTrips(),
  ]);
}
