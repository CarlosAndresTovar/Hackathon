from flask import Flask, render_template

app = Flask(__name__) # Habilitar el modo de depuración

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0')