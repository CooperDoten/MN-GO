import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';


function* fetchPark(action) {
    console.log(`in our fetchParks saga`);
  try {
    let response = yield axios.post( '/api/park', action.payload);
    console.log(response.data);
    yield put({ type: 'SET_PARK', payload: response.data});
} catch (error) {
    console.log('Park GET request failed', error);
    }
  }
  function* parkSaga() {
    yield takeLatest('FETCH_PARK', fetchPark);
  }
  export default parkSaga;