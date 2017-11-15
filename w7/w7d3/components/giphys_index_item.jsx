import React from 'react';

const GiphysIndexItem = (props) => {
  console.log(props);
  return (
    // <iframe src={props.url}></iframe>
    // <iframe src={props.url}></iframe>
    <img src={props.url}>
  );
};

// <iframe src="https://giphy.com/embed/xvV3NUMbSTqSY" width="480" height="228" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/like-job-fighter-xvV3NUMbSTqSY">via GIPHY</a></p>
// <div style="width:100%;height:0;padding-bottom:47%;position:relative;"><iframe src="https://giphy.com/embed/xvV3NUMbSTqSY" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/like-job-fighter-xvV3NUMbSTqSY">via GIPHY</a></p>
export default GiphysIndexItem;
