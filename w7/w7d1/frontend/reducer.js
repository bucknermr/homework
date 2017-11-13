import merge from 'lodash/merge';

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case "SWITCH_CURRENCY":
      return {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      };
    default:
      return state;
    }

      // const newState = initialState.merge(state, action.currency);
      // break;
};

export default reducer;
