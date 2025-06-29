# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "card", to: "card.js"

pin "item_price", to: "item_price.js"
#エラー検証メモ　以下の記述による変化なし
#pin "item-price", to: "item_price.js"