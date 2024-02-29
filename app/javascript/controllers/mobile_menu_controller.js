import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["main", "footer", "header", "menu"];

  toggle() {
    //all the elements with the data-target="mobile-menu.toggle
    const targets = [this.mainTarget, this.footerTarget, this.headerTarget, this.menuTarget];
    targets.forEach((target) => {
      target.classList.toggle("hidden");
    });
  }
}
