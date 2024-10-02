import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  static targets = [ "name" ]
  static values = {product: Object}
  addToCart() {
    // check if cart exists
    const cart = localStorage.getItem('cart')
    if (cart) {
      const cartList = JSON.parse(cart)
      const foundIndex = cartList.findIndex(item => item.id === this.productValue.id)
      if (foundIndex >= 0) {
        cartList[foundIndex].quantity = parseInt(cartList[foundIndex].quantity) + 1
      } else {
        cartList.push({
          id: this.productValue.id,
          name: this.productValue.name,
          price: this.productValue.price,
          quantity: 1
        })
      }
      localStorage.setItem("cart", JSON.stringify(cartList))
    } else {
      const cartList = []
      cartList.push({
        id: this.productValue.id,
        name: this.productValue.name,
        price: this.productValue.price,
        quantity: 1
      })
      localStorage.setItem('cart', JSON.stringify(cartList));
    }
    const toastElement = this.nameTarget
    console.log(toastElement.classList)
    toastElement.classList.remove('hidden')

    setTimeout(function(){ toastElement.classList.add('hidden'); }, 3000);
  }
}
