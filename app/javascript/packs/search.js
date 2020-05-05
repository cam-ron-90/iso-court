const apiUrl = (query) => `http://localhost:3001/api/v1/users?query=${query}`;

const refresh = (query) => {
  // TODO: Implement the global refresh logic.
  fetch(apiUrl(query))
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    });
};

const searchBar = document.getElementById('query')

searchBar.addEventListener('input', (e) => {
  let query = e.currentTarget.value;
  refresh(query);
})
