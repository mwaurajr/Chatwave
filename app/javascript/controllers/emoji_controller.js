import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["button", "hiddenInput"]

  connect() {
    this.selectedEmoji = this.hiddenInputTarget.value
    this.updateSelectedButton()
    this.updateSelectedEmojiDisplay()
  }

  select(event) {
    this.selectedEmoji = event.currentTarget.textContent
    this.hiddenInputTarget.value = this.selectedEmoji
    this.updateSelectedButton()
    this.updateSelectedEmojiDisplay()
  }

  updateSelectedButton() {
    this.buttonTargets.forEach(button => {
      button.classList.toggle("border-indigo-600", button.textContent === this.selectedEmoji)
    })
  }

  updateSelectedEmojiDisplay() {
    const selectedEmojiDisplay = document.getElementById("selected-emoji")
    selectedEmojiDisplay.textContent = this.selectedEmoji || "😃"
  }
}
