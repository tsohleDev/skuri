import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shop"
export default class extends Controller {
  static targets = ["count"]

  // This is the method that will be called when the event is triggered
  async addToCart() {
    console.log("Add to cart clicked!, count: ", this.count)
  }

  get count() {
    return parseInt(document.getElementById("cart-count").textContent)
  }

  set count(value) {
    document.getElementById("cart-count").textContent = value
  }
}
