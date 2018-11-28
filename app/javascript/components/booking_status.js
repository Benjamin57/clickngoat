const bookingStatus = () => {
  const accept = document.getElementById("booking-accept")
  const decline = document.getElementById("booking-decline")
  if (accept && decline ) {
    accept.addEventListener("click", (event) => {
      event.preventDefault();
      console.log(event);
    });
  }
};

export { bookingStatus };
