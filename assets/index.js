const riot = require("riot")

import "jquery"
import "bootstrap/dist/css/bootstrap.min.css"
import "./tags/app.tag"

addEventListener("load", function() {
    riot.mount("*")
})