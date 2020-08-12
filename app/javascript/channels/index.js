// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', function(){
 const item_price = document.getElementById("item-price")
 const handling_charge = document.getElementById("add-tax-price")
 const profit = document.getElementById("profit")

 item_price.addEventListener('change', function(){
   let price = item_price.value;
  
   let handling_charge = price * 0.1
   let profit = price - handling_charge
   document.getElementById("add-tax-price").textContent = handling_charge
   document.getElementById("profit").textContent = profit
  })
})