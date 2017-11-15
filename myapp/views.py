from myapp import app
from flask import render_template

@app.route('/')
@app.route('/<path:path>')
def indexPage(path=None):
    return render_template("index.jade")