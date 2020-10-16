import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* deleteTrip(action){
    console.log('in deleteTrip', action.payload);
    let id = action.payload.tripId;
    yield axios.delete(`/api/delete/${id}`);

    yield put({type: 'FETCH_USER_TRIPS'});
}

function* deleterSaga() {
    yield takeLatest('DELETE_TRIP', deleteTrip);
  }
  
  export default deleterSaga;