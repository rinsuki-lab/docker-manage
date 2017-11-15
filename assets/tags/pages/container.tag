page-container
    h1 {container.name}
    p uptime: 
        page-container-relative-time(time="{container.start}")
        .btn-group
            button.btn.btn-success Deploy
            button.btn.btn-primary(disabled="{container.isRun}") Start
            button.btn.btn-danger(disabled="{!container.isRun}") Stop
            a.btn.btn-secondary(href="/containers/{container.id}/settings") Settings
    script.
        fetch("/api/v1/containers/"+this.opts.params.id).then(r => r.json()).then(r => {
            this.container = r
            this.update()
        })
page-container-relative-time
    span {time}
    script.
        var timer = undefined
        this.on("mount", function() {
            timer = setInterval(() => {
                var time = Math.floor((Date.now() - new Date(this.opts.time))/1000)
                var str = ""
                // ---
                str = `${time%60}秒${str}`
                time = Math.floor(time/60)
                // ---
                str = `${time%60}分${str}`
                time = Math.floor(time/60)
                // ---
                str = `${time%24}時間${str}`
                time = Math.floor(time/24)
                // --- 
                str = `${time}日${str}`
                // time = Math.floor(time/24)
                this.time = str
                this.update()
            }, 1000)
        })
        this.on("unmount", () => {
            if(timer) {
                clearInterval(timer)
                timer = undefined
            }
        })