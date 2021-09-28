from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import make_wsgi_app


from flask_prom_metrics import start_request, end_request

app = Flask(__name__)

app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {"/metrics": make_wsgi_app()})
app.before_request(start_request)
app.after_request(end_request)


@app.route("/")
def home():
    return "home"
