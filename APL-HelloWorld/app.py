import os
import socket

from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def index():
    msg_hello= []
    svctype = []

    msg_hello = socket.gethostname()
    svc_type = os.getenv('HELLO_SVC_TYPE', 'NotDefined')

    return render_template('index.html', cor= "red", svctype= svc_type, msg= msg_hello)

@app.route('/health')
def health():
    return "UP"

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))

    