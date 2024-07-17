from flask import Flask

app = Flask(__name__) # Habilitar el modo de depuración

@app.route('/')
def hello():
    return "Hello, World!"

if __name__ == '__main__':
    app.run(host='0.0.0.0')