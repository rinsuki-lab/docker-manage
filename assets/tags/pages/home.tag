page-home
    h1 home
    page-home-group(group="{this.group}")
    script.
        fetch("/api/v1/containers").then(r => r.json()).then(r => {
            this.group = r
            this.update()
        })
page-home-group
    details(each="{group in this.opts.group.groups}")
        summary {group.name}
        page-home-group(group="{group}")
    ul
        li(each="{container in this.opts.group.containers}")
                .buttons
                    button.btn.btn-success.btn-sm deploy
                    button.btn.btn-primary.btn-sm(disabled="{container.isRun}") start
                    button.btn.btn-danger.btn-sm(disabled="{!container.isRun}") stop
                a(href="/containers/{container.id}") {container.name}
    style.
        page-home-group {
            display:block;
        }
        page-home-group details > *:not(summary) {
            margin-left: 1em;
        }
        page-home-group li {
            line-height: 2.5em;
        }
        page-home-group .buttons {
            float:left;
            padding-right: 1em;
        }
    script.
        console.log(this.opts.group)