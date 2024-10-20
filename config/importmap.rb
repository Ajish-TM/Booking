# Pin npm packages by running ./bin/importmap

# Pin your application JavaScript
pin "application"

# Pin Hotwired packages
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

# Pin all controllers under the "controllers" directory
pin_all_from "app/javascript/controllers", under: "controllers"
