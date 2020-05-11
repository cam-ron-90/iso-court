const apiUrl = (query) => `http://localhost:3000/api/v1/users?query=${query}`;
const searchBar = document.getElementById('query')
const usersList = document.getElementById('ajax-search')

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
    html = html + userCard(user);
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
}

const refresh = (query) => {
  // TODO: Implement the global refresh logic.
  fetch(apiUrl(query))
    .then(response => response.json())
    .then((data) => {
      usersList.innerHTML = htmlBuilder(data);
    });
};

const addToggle = () => {
  console.log("function called");
  let choices = document.querySelectorAll(".user-choice")
  choices.forEach((choice) => {
    choice.addEventListener("click", (e) => {
      choice.classList.toggle("active");
    })
  })
};

searchBar.addEventListener('input', (e) => {
  let query = e.currentTarget.value;
  refresh(query);
  addToggle();
})
