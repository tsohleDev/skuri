import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";
import debounce from "debounce"

// Connects to data-controller="search"
export default class extends Controller {
  initialize() {
    this.submit = debounce(this.submit.bind(this), 1000)
  }

  submit(event) {
    document.querySelector('#submit-search').click()
  }
}
