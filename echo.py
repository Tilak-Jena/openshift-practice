from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from ACE demo!"

@app.route("/echo")
def echo():
    return "Echo response - still blinking!"

if __name__ == "__main__":
    # Critical: bind to 0.0.0.0 so it listens on all interfaces
    app.run(host="0.0.0.0", port=7600)