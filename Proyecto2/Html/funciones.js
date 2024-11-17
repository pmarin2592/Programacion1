function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.body.style.overflow = "hidden"; // Evitar desplazamiento del body
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.body.style.overflow = "auto"; // Restaurar desplazamiento del body
}
