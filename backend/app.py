from flask import Flask, jsonify
import json
import requests
app = Flask(__name__)

@app.route('/')
def get_products():
    api = requests.get('https://reqres.in/api/products/')
    api_json = api.json()
    product_list = [i['name'] for i in api_json['data']]
    return jsonify(product_list)