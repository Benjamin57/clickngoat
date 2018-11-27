const toggleTab = () => {
  const playersTab = document.getElementById("players-trigger")
  const bookingsTab = document.getElementById("bookings-trigger")
  playersTab.addEventListener('click', (event) => {
    event.preventDefault();
    playersTab.classList.add("active");
    bookingsTab.classList.remove("active");
    document.getElementById('players').classList.remove("hidden")
    document.getElementById('bookings').classList.add("hidden")
  });
  bookingsTab.addEventListener('click', (event) => {
    event.preventDefault();
    bookingsTab.classList.add("active");
    playersTab.classList.remove("active");
    document.getElementById('bookings').classList.remove("hidden")
    document.getElementById('players').classList.add("hidden")
  });
};
export { toggleTab };
