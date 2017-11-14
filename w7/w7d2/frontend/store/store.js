import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

function addLoggingToDispatch(store) {
  return function(next) {
    return function(action) {
      console.log("Old state:", store.getState());
      console.log("Action:", action);
      let result = next(action);
      console.log("New state:", store.getState());
      return result;
    };
  };
}


const configureStore = (preloadedState = {}) => {
  let store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
