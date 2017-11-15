app
    nav.navbar.navbar-light.bg-light
        .container
            a.navbar-brand(href="/") docker manage
    .container
        #app
    script.
        import "./pages/home.tag"
        import "./pages/container.tag"
        import "font-awesome/css/font-awesome.css"
        var page = require("page")
        var routes = {
            "/": "home",
            "/containers/:id": "container",
        }
        this.on("mount", function() {
            Object.keys(routes).forEach(function(route) {
                page(route, function(ctx) {
                    console.log(routes[route], ctx.params)
                    riot.mount("#app", "page-"+routes[route], {params: ctx.params})
                })
            })
            page()
        })
