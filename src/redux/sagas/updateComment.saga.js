import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_USER" actions
function* changeComment(action) {
    console.log(`in our changeComment`);
    let id = action.payload.tripId
  try {
    yield axios.put(`/api/comment/${id}`, action.payload);
    yield put({type: 'SET_TRIPS'});
  } catch (error) {
    console.log('Parks GET request failed', error);
  }
}


function* commentSaga() {
  yield takeLatest('UPDATE_COMMENT', changeComment);
}

export default commentSaga;