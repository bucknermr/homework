import React from 'react';

const GiphysIndexItem = (props) => {
  console.log(props);
  return (
    <iframe src={props.url}></iframe>
  );
};
export default GiphysIndexItem;
