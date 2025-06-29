const price = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

   // 手数料要素を取得
   const addTaxDom = document.getElementById("add-tax-price");
   // 入力値を数値に変換して手数料を計算
    const fee = Math.floor(inputValue * 0.10);
   // 計算結果を表示
    addTaxDom.innerHTML = `${fee}`;
    // 利益要素を取得 (新たに追加)
  const profitDom = document.getElementById("profit");
  // 利益を計算（入力値から手数料を引く）
  const profit = inputValue - fee;
  // 利益を表示
  profitDom.innerHTML = `${profit}`;
})
}
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);