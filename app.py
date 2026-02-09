from flask import Flask, jsonify

app = Flask(__name__)

# / 
@app.route('/')
def hello_docker():
    return jsonify({"message": "Hello Docker"})

# health check
@app.route('/health')
def health_check():
    return jsonify({"message": "OK"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000, debug=True)
