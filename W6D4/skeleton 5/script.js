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

  const addToList = (e) => {
    e.preventDefault();
    const input = document.querySelector('.favorite-input');
    const place = input.value;
    input.value = '';


    const ul = document.getElementById("restaurants");

    const li = document.createElement("li");
    li.textContent = place;

    ul.appendChild(li)
  }

  const togglePhotoClass = (e) => {
    const container = document.querySelector('.photo-form-container')
    container.classList.toggle("hidden")
  }

  const addPhoto = (e) => {
    e.preventDefault();

    const photoUL = document.querySelector('.dog-photos')
    const newPhoto = document.createElement('li')
    const img = document.createElement('img')


    const URL = document.querySelector('.photo-url-input')
    const URLvalue = URL.value;
    URL.value = '';

    img.setAttribute('src', URLvalue);
    newPhoto.append(img);

    photoUL.append(newPhoto);
  }



  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  document.querySelector(".hold").addEventListener("submit", addToList);

  document.querySelector('.photo-show-button').addEventListener("click", togglePhotoClass);

  document.querySelector('.photo-form-container').addEventListener('submit',addPhoto)




  // adding SF places as list items

  // --- your code here!



  // adding new photos

  // --- your code here!



});
