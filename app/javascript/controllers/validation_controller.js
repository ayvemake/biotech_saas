import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["error"]

  validate(event) {
    const field = event.target
    const value = field.value.trim()
    const message = field.dataset.validationMessage

    if (!value) {
      this.showError(message)
      field.classList.add('border-red-300')
      field.classList.remove('border-gray-300')
    } else {
      this.hideError()
      field.classList.remove('border-red-300')
      field.classList.add('border-gray-300')
    }
  }

  showError(message) {
    this.errorTarget.textContent = message
    this.errorTarget.classList.remove('hidden')
  }

  hideError() {
    this.errorTarget.classList.add('hidden')
  }
} 