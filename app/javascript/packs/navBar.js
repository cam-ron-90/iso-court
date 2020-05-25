const regex = new RegExp(/\d+/, 'i');
let nav = document.querySelector(".navbar-nav");
let dashboard = document.getElementById("dashboard")

if (window.location.href.startsWith("http://localhost:3000/groups") || window.location.href === "http://localhost:3000/") {
  dashboard.querySelector(".first").classList.add("nav-active");

  if (window.location.href.startsWith("http://localhost:3000/groups") && regex.test(window.location.href.slice(29, 30))) {
    dashboard.querySelector(".second").classList.remove("d-none");
  }

} else if (window.location.href.startsWith("http://localhost:3000/users")) {
  nav.querySelectorAll(".navbar-brand")[1].classList.add("nav-active");
} else if (window.location.href.startsWith("http://localhost:3000/notices")) {
  nav.querySelectorAll(".navbar-brand")[2].classList.add("nav-active");
} else {
  nav.querySelectorAll(".navbar-brand")[3].classList.add("nav-active");
};
