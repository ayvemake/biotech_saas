import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "content"]

  connect() {
    // Fermer avec Escape
    document.addEventListener("keydown", this.handleKeyboard.bind(this))
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeyboard.bind(this))
  }

  open() {
    this.containerTarget.classList.remove("hidden")
    setTimeout(() => {
      this.contentTarget.classList.remove("translate-y-4", "opacity-0")
    }, 50)
  }

  close() {
    this.contentTarget.classList.add("translate-y-4", "opacity-0")
    setTimeout(() => {
      this.containerTarget.classList.add("hidden")
    }, 300)
  }

  handleKeyboard(event) {
    if (event.key === "Escape") this.close()
  }

  // Fermer si on clique en dehors du modal
  clickOutside(event) {
    if (event.target === this.containerTarget) this.close()
  }
} 