import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';


function* addTrip(action) {
    console.log(`in add trip`, action.payload);
  try {
   yield axios.post('/api/trip', action.payload);
    yield put({ type: 'SET_TRIP'});
  } catch (error) {
    console.log('Parks GET request failed', error);
  }
}


function* tripSaga() {
  yield takeLatest('CREATE_TRIP', addTrip);
}

export default tripSaga;