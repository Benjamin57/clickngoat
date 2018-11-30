import flatpickr from "flatpickr"
import "flatpickr/dist/themes/confetti.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const flatPickrExists = document.getElementById("range_start")
if (flatPickrExists) {
  flatpickr("#range_start", {
    altInput: true,
    allowInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})],
  })
}

