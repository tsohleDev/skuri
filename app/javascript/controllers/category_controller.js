import { Controller } from "@hotwired/stimulus"

/**
 * @class CategoryController
 * @classdesc This controller is used to display a modal with the category name when the user hovers a category name in the navbar
 * @extends Controller
  */

// Connects to data-controller="category"
export default class extends Controller {
  static previousElement = null;
  static MODAL = null;

  connect() {
    // Set up event listeners when the controller is connected
    this.element.addEventListener("mouseenter", this.logCategory.bind(this));
  }

  disconnect() {
    // Remove event listeners when the controller is disconnected
    this.element.removeEventListener("mouseenter", this.logCategory.bind(this));
  }

  logCategory() {
    // clean the previous category modal if it exists
    if (this.constructor.previousElement) this.constructor.previousElement.removeCategory();
    this.constructor.previousElement = this;

    this.showCategory();
  }

  showCategory() {
    this.constructor.MODAL = document.getElementById("categories");

    this.constructor.MODAL.classList.remove("hidden");
    this.constructor.MODAL.addEventListener("mouseleave", this.modalleave.bind(this));

    document.querySelectorAll(`[id="${this.element.textContent.toLowerCase()}"]`).forEach((element) => {
      element.classList.remove("hidden");
    });
  }

  removeCategory() {
    document.getElementById("categories").classList.add("hidden");
    document.querySelectorAll(`[id="${this.element.textContent.toLowerCase()}"]`).forEach((element) => {
      element.classList.add("hidden");
    });
  }

  modalleave() {
    this.constructor.MODAL.classList.add("hidden");
    this.constructor.MODAL.removeEventListener("mouseleave", this.modalleave.bind(this));
  }
}
