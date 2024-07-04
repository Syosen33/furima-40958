window.document.addEventListener('DOMContentLoaded', () => {

  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  // 販売価格が変更されたときに計算を行う
  priceInput.addEventListener('input', () => {
    const price = document.getElementById("item-price").value
    
    // 販売手数料 (10%)
    const tax = Math.floor(price * 0.1)
    const profit = price - tax
    const taxForm = document.getElementById("add-tax-price")
    taxForm.textContent = tax 
    // 販売利益
    const profitForm = document.getElementById("profit")
    profitForm.textContent = profit  
  });
});


// 以下は学習用コメント
// 読み込ませる(importmap.application.js.windowオブジェクト)→取得する(getElementById)→操作する(addEventListener)
// 上記を「DOM操作」