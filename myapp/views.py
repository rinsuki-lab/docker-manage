from myapp import app
from flask import render_template

@app.route('/')
def indexPage():
    return render_template("index.jade")