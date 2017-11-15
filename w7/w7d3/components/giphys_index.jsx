import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = (props) => {
  const { giphys } = props;
  return (
    <ul>
      {
        giphys.map(giphy => (
          <li key ={giphy.id} >
            <GiphysIndexItem className="giphy-li" url={giphy.embed_url} />  
          </li>
        ))
      }
    </ul>
  );
};

export default GiphysIndex;
