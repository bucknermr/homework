

export function fetchSearchGiphys(searchTerm) {
  return $.ajax({
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=at9xeUCsD7fZcB6oRaqWM4Ov3yVQ5mHU&limit=2`
  });
}
