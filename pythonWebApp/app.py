from flask import Flask, request
import logging

app = Flask(__name__)

# Setup basic logging
logging.basicConfig(
    filename='app.log',
    level=logging.INFO,
    format='%(asctime)s %(levelname)s:%(message)s'
)

@app.route('/')
def home():
    visitor_ip = request.remote_addr
    logging.info(f'Homepage visited from {visitor_ip}')
    return "Hello, Welcome to the homepage!"

@app.route('/about')
def about():
    visitor_ip = request.remote_addr
    logging.info(f'About page visited from {visitor_ip}')
    return "This is the about page!"

if __name__ == '__main__':
    app.run(debug=True)
