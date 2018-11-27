const players = document.querySelector("#players");
const bookings = document.querySelector("#bookings");
const tab = document.querySelector(".tab");


const toggleTab = () => {
  tab.addEventListener('click', (event) => {
    event.currentTarget.classList.toggle("active");
    console.log(event.currentTarget)
  });
};
export { toggleTab };
