from flask import Flask, jsonify
import redis
import os

app = Flask(__name__)

# Redis Configuration
redis_host = os.getenv("REDIS_HOST", "redis")

try:
    r = redis.Redis(host=redis_host, port=6379, decode_responses=True)
except Exception as e:
    print(f"Redis connection failed: {e}")

@app.route('/health')
def health():
    return jsonify({
        "status": "healthy"
    }), 200

@app.route('/ekyc')
def ekyc():
    try:
        r.set('last_request', 'ekyc')
    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500

    return jsonify({
        "message": "Mock eKYC API response",
        "service": "UIDAI Sandbox Mock API"
    }), 200

@app.route('/')
def home():
    return jsonify({
        "message": "Welcome to Mock eKYC API"
    }), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
