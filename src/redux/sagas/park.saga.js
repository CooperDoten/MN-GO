import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_USER" actions
function* fetchParks() {
    console.log(`in our fetchParks saga`);
  try {
    let response = yield axios.get('/api/parks');
    console.log(response);
    yield put({ type: 'SET_PARKS', payload: response.data});
  } catch (error) {
    console.log('Parks GET request failed', error);
  }
}

function* parksSaga() {
  yield takeLatest('FETCH_PARKS', fetchParks);
}

export default parksSaga;