import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shop"
export default class extends Controller {
  static targets = ["quantity", "size", "image", "mainImage", "cartQuantity","cartSize", "cartColour", "wishlistQuantity", "wishlistSize", "wishlistColour"]

  //increment the quantity
  increment() {
    this.quantityTarget.textContent = parseInt(this.quantityTarget.textContent) + 1
    this.cartQuantityTarget.value = this.quantityTarget.textContent
    this.wishlistQuantityTarget.value = this.quantityTarget.textContent
  }

  //decrement the quantity
  decrement() {
    if (parseInt(this.quantityTarget.textContent) > 1) {
      this.quantityTarget.textContent = parseInt(this.quantityTarget.textContent) - 1
      this.cartQuantityTarget.value = this.quantityTarget.textContent
      this.wishlistQuantityTarget.value = this.quantityTarget.textContent
    }
  }

  // change the size of the product
  change_size(event) {
    // all the size targets
    this.sizeTargets.forEach(button => button.classList.remove("shadow-lg", "shadow-green-500", 'border-green-500'))
    event.target.classList.add("shadow-lg", "shadow-green-500", 'border-green-500')

    // change the size for the cart
    this.cartSizeTarget.value = event.target.dataset.id
    this.wishlistSizeTarget.value = event.target.dataset.id
  }

  // change the image of the product
  change_image(event) {
    // all the size targets
    //this.imageTargets.forEach(button => button.classList.remove("shadow-lg", "shadow-green-500", 'border-green-500'))
    //event.target.classList.add("shadow-lg", "shadow-green-500", 'border-green-500')

    // change the image
    this.mainImageTarget.src = event.target.src
  }
}
