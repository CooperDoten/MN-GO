import axios from 'axios';
import {takeLatest } from 'redux-saga/effects';


function* addTrip(action) {
    console.log(`in add trip`, action.payload);
  try {
   yield axios.post('/api/trip', action.payload);
  } catch (error) {
    console.log('Parks GET request failed', error);
  }
}


function* tripSaga() {
  yield takeLatest('CREATE_TRIP', addTrip);
}

export default tripSaga;