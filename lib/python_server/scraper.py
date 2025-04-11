# from flask import Flask, request, jsonify
# from selenium import webdriver
# from selenium.webdriver.common.by import By
# import time
#
# app = Flask(__name__)
#
# @app.route('/scrape', methods=['GET'])
# def scrape_telegram():
#     phone_number = request.args.get('phone')
#
#     options = webdriver.ChromeOptions()
#     options.add_argument("--headless")  # Run in headless mode
#     driver = webdriver.Chrome(options=options)
#
#     try:
#         driver.get("https://web.telegram.org/k/")  # Open Telegram Web
#
#         time.sleep(5)  # Wait for Telegram to load (Log in manually before running this)
#
#         # Find chat with TruecallerBot
#         bot_chat = driver.find_element(By.XPATH, "//span[contains(text(),'TruecallerBot')]")
#         bot_chat.click()
#
#         time.sleep(3)  # Wait for messages to load
#
#         # Get the last bot message
#         messages = driver.find_elements(By.CSS_SELECTOR, ".message:last-child .text")
#         bot_response = messages[-1].text if messages else "No response found."
#
#         driver.quit()
#         return jsonify({"response": bot_response})
#
#     except Exception as e:
#         driver.quit()
#         return jsonify({"error": str(e)})
#
# if __name__ == '__main__':
#     app.run(debug=True, port=5000)
# ----------------------------

from flask import Flask, request, jsonify
from flask_cors import CORS
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

app = Flask(__name__)
CORS(app)  # Allow requests from Flutter

@app.route('/scrape', methods=['GET'])
def scrape_telegram():
    phone_number = request.args.get('phone')

    if not phone_number:
        return jsonify({"error": "Missing phone number"}), 400

    try:
        # Set up Selenium WebDriver
        options = webdriver.ChromeOptions()
        options.add_argument("--headless")  # Run in headless mode
        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

        # Open Telegram Web
        driver.get("https://web.telegram.org/")
        time.sleep(5)  # Give time for page to load

        # Search for TruecallerBot
        search_box = driver.find_element(By.XPATH, "//input[@type='text']")
        search_box.send_keys("TruecallerBot")
        time.sleep(3)

        # Click the bot
        bot_element = driver.find_element(By.XPATH, "//a[contains(@href, 'TruecallerBot')]")
        bot_element.click()
        time.sleep(3)

        # Send the phone number
        input_box = driver.find_element(By.XPATH, "//div[@contenteditable='true']")
        input_box.send_keys(phone_number)
        input_box.send_keys("\n")  # Press enter
        time.sleep(5)

        # Get bot response
        messages = driver.find_elements(By.XPATH, "//div[contains(@class, 'message-text')]")
        last_message = messages[-1].text if messages else "No response from bot."

        driver.quit()
        return jsonify({"result": last_message})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
