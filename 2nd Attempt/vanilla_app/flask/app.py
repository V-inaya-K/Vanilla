from flask import Flask, request, jsonify
import joblib
import re

app = Flask(__name__)

# Load Model and Vectorizer
scam_model = joblib.load('scam_model.pkl')
vectorizer = joblib.load('vectorizer.pkl')

@app.route('/detect_scam', methods=['POST'])
def detect_scam():
    data = request.json
    message = data['message']

    # Preprocess Message
    message = re.sub(r'\W', ' ', message.lower())
    message_vectorized = vectorizer.transform([message])

    # Predict
    prediction = scam_model.predict(message_vectorized)

    return jsonify({'is_scam': bool(prediction[0])})

if __name__ == '__main__':
    app.run(debug=True)
