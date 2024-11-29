"""Web service that accepts a text and returns its language code."""

from flask import Flask
from flask import request
import langdetect as ld
import os


app = Flask(__name__)


@app.route("/")
def hello_world():
    """Returns a description of the web service."""
    return "Hello!! This is an app to detect the language of a document"


@app.route("/detect", methods=['GET'])
def detect():
    """Identifies the language of the text."""
    query = request.args.get('text')
    language = ld.detect(query)
    return language

@app.route("/instance", methods=['GET'])
def return_first_file_in_dir():
    """Returns the first file in the directory /var/lib/cloud/instances/"""
    path = '/var/lib/cloud/instances/'
    if not os.path.exists(path):
        return f"Directory {path} does not exist"
    else:
        dirs = os.listdir(path)
        return dirs[0]

if __name__ == "__main__":
    app.run()