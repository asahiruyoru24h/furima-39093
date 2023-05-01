window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  console.log(priceInput);


   priceInput.addEventListener("input", () => {
   console.log("イベント発火");
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
   const addPofitDom = document.getElementById("profit");
   addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))

})

});

