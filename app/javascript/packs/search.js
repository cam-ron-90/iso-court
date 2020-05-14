const apiUrl = (query) => `http://localhost:3000/api/v1/users?query=${query}`;
const searchBar = document.getElementById('query');
const usersList = document.getElementById('ajax-search');
const currentUser = usersList.dataset["id"];
const selectedUsers = document.getElementById('selected-users');
const arrayOfUsers = [];

const imgSrc = (user) => {
  if ( user.avatar ) {
    return `<img class="avatar-large" src="http://res.cloudinary.com/julietteferrer27/image/upload/${user.avatar}">`
  } else {
    return `<img class="avatar-large" src="https://kitt.lewagon.com/placeholder/users/ssaunier">`
  }
};

const htmlBuilder = (users) => {
  let html = "";
  users.forEach((user) => {
    if (user.id.toString() !== currentUser && !arrayOfUsers.includes(user.id.toString())) {
      html = html + userCard(user);
    };
  });
  return html;
};

const userCard = (user) => {
  return `<div class="col-3">
    <input class="checkbox" type="checkbox" value="${user.id}" name="group[user_ids][]" id="group_user_ids_${user.id}">
    <label for="group_user_ids_${user.id}" class="user-choice">
      ${user.username}
        ${imgSrc(user)}
      <i class="fa fa-check"></i>
    </label>
  </div>`
};

const addToggle = () => {
  let newChoices = usersList.querySelectorAll(".user-choice");
  newChoices.forEach((newchoice) => {
    newchoice.addEventListener("click", (e) => {
      arrayOfUsers.push(newchoice.previousElementSibling.value);
      let value = `group_user_ids_${newchoice.previousElementSibling.value}`;
      newchoice.classList.add("active");

      if (selectedUsers.innerText === "No bros selected yet... 😭") {
        selectedUsers.innerHTML = `<div class="col-3">${newchoice.parentElement.innerHTML}</div>`;
      } else {
        selectedUsers.insertAdjacentHTML('afterbegin', `<div class="col-3">${newchoice.parentElement.innerHTML}</div>`);
      }
      newchoice.parentNode.remove();
      document.getElementById(value).checked = true;
      pickedUser();
    })
  })
};

const refresh = (query) => {
  if (query !== "") {
  fetch(apiUrl(query))
    .then(response => response.json())
    .then((data) => {
      usersList.innerHTML = htmlBuilder(data);
      addToggle();
    });
  } else {
    usersList.innerHTML = "<h6 class='container-fluid mb-3 ml-3 mr-3 mt-1'>😭 Y U no search for bros?</h6>";
  }
};

const pickedUser = () => {
  let selected = document.getElementById('selected-users');
  let checkBoxes = selected.querySelectorAll(".checkbox");
  checkBoxes[0].addEventListener("change", (e) => {
    if(e.currentTarget.checked) {
      e.currentTarget.nextElementSibling.classList.add("active");
    } else {
      e.currentTarget.nextElementSibling.classList.remove("active");
    }
  });
};

searchBar.addEventListener('input', (e) => {
  let query = e.currentTarget.value;
  refresh(query);
});

searchBar.addEventListener('keypress', (e) => {
  if (e.keyCode == 13) {
    console.log("keydown");
    e.preventDefault();
    e.stopPropagation();
  }
});
