import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  static clicked = false;

  connect() {
    this.element.addEventListener("mouseenter", this.rate.bind(this));
    this.element.addEventListener("mouseleave", this.reset.bind(this));
    this.element.addEventListener("click", this.click.bind(this));
  }

  disconnect() {
    this.element.removeEventListener("mouseenter", this.rate.bind(this));
    this.element.removeEventListener("mouseleave", this.reset.bind(this));
    this.element.removeEventListener("click", this.click.bind(this));
  }

  rate(event) {
    // log the id of the current target
    this.stars = parseInt(event.target.children[0].id.split("-")[1]);
    console.log(this.stars);

    // all stars are yellow
    this.reset();

    for (let i = 5; i >= 1; i--) {
      let x = document.querySelector(`#star-${i}`)
      if (i <= this.stars) {
        // add yellow color to stars
        x.classList.remove("text-gray-400");
        x.classList.add("text-yellow-500");
      } else {
        x.classList.remove("text-yellow-500");
        x.classList.add("text-gray-400");
      }
    }
  }

  reset() {
    console.log("reset");
    // loop through all stars
    console.log(this.constructor.clicked);
    if (this.constructor.clicked == false) {
      console.log("reset if");
      console.log(this.stars);
      for (let i = 5; i >= 1; i--) {
        let x = document.querySelector(`#star-${i}`)
        if (x.classList.contains("text-yellow-500")) {
          x.classList.remove("text-yellow-500");
          x.classList.add("text-gray-400");
        }
      }
    }
  }

  clicked() {
    this.constructor.clicked = true;
  }
}
