document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  // 販売価格が変更されたときに計算を行う
  priceInput.addEventListener('input', () => {
    const price = parseFloat(priceInput.value);
    
    // 販売手数料 (10%)
    const commission = price * 0.1;
    addTaxPrice.textContent = commission.toFixed(0); // 小数点以下を表示しない場合は toFixed(0) を使用
    
    // 販売利益
    const salesProfit = price - commission;
    profit.textContent = salesProfit.toFixed(0); // 小数点以下を表示しない場合は toFixed(0) を使用
  });
});