import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    //this.element.textContent = "Hello World! hahahaha"
    console.log("Hello from the cart controller!")
    //log the content of id cart-count
    console.log(document.getElementById("cart-count").textContent)
  }
}
