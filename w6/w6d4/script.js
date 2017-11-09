document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const addListItem = (e) => {
    e.preventDefault();
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = document.querySelector(".favorite-input");
    ul.appendChild(li);
  };

  document
    .querySelectorAll(".list-container form")
    .forEach((submit) => {
      submit.addEventListener("submit", addListItem);
      // submit.addEventListener("submit", (event) => addListItem(event));
    });


  // adding new photos

  // --- your code here!



});
