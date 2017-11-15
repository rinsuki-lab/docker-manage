from myapp import app
from flask import jsonify

@app.route('/api/v1/containers')
def containers():
    return jsonify({
        "groups": [{
            "name": "group1",
            "groups": [{
                "name": "mastodon",
                "groups": [],
                "containers": [{
                    "id": 1,
                    "name": "web",
                    "isRun": False
                }]
            }],
            "containers": [{
                "id": 1,
                "name": "stopped container",
                "isRun": False
            },
            {
                "id": 1,
                "name": "running container",
                "isRun": True
            }]
        }],
        "containers": []
    })

@app.route('/api/v1/containers/<id>')
def containersShow(id):
    return jsonify({
        "id": 1,
        "name": "web",
        "isRun": False,
        "start": "2016-06-15T07:55:02.979652053Z"
    })