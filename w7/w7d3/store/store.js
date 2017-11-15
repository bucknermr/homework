import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';

// const preloadedState = {};

const configureStore = () => {
  // return createStore(rootReducer, preloadedState, applyMiddleware(thunk));
  return createStore(rootReducer, applyMiddleware(thunk));
};

export default configureStore;
