import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// TODO FOR TESTING! REMOVE:

import * as APIUtil from './util/api_util';
import { receiveSearchGiphys, fetchSearchGiphys } from './actions/giphy_actions';


document.addEventListener('DOMContentLoaded', () => {

  const store = configureStore();
  const root = document.querySelector('#root');

  ReactDOM.render(<Root store={store} />, root);

// TODO: FOR TESTING! REMOVE:
  window.store = store;
  window.fetchSearchGiphys = APIUtil.fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
  window.fetchSearchGiphys = fetchSearchGiphys;
});
