document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const feeDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseFloat(priceInput.value) || 0;
      const fee = Math.floor(price * 0.1);
      const profit = price - fee;

      feeDisplay.innerText = fee.toLocaleString();
      profitDisplay.innerText = profit.toLocaleString();
    });
  }
});