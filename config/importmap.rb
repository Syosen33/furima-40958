# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "application", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "fee_calculator", to: "fee_calculator.js"