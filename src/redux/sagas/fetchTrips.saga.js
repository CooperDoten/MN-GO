import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_USER" actions
function* fetchTrip(action) {
    let userId = {userId: action.payload};
    console.log(`in our fetchTrip saga`, userId);
  try {
    let response = yield axios.post('/api/userTrips', userId);
    console.log(response);
    yield put({ type: 'SET_TRIPS', payload: response.data});
  } catch (error) {
    console.log('Parks GET request failed', error);
  }
}


function* tripsSaga() {
  yield takeLatest('FETCH_USER_TRIPS', fetchTrip);
}

export default tripsSaga;