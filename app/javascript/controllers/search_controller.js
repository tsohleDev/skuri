import { Controller } from "@hotwired/stimulus"
import debounce from "debounce"

// Connects to data-controller="search"
export default class extends Controller {
  initialize() {
    this.submit = debounce(this.submit.bind(this), 1000)
  }

  submit(event) {
    console.log('submitting search')
    document.querySelector('#submit-search').click()
  }
}

