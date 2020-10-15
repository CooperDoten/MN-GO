import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* fetchImages(action) {
    console.log(`in our fetchImages saga`, action.payload);
  try {
    let response = yield axios.post('/api/images', action.payload);
    console.log(response);
    yield put({ type: 'SET_IMAGES', payload: response.data});
  } catch (error) {
    console.log('IMAGES GET request failed', error);
  }
}


function* ImagesSaga() {
  yield takeLatest('FETCH_IMAGES', fetchImages);
}

export default ImagesSaga;