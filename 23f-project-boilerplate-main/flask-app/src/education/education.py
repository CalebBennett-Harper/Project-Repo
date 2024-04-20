from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

education_bp = Blueprint('education', __name__, url_prefix='/education')

@education_bp.route('/', methods=['GET'])
def get_all_materials():
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Resource_ID, Articles, Videos, User_ID, Statistics FROM Education")
    materials = cursor.fetchall()
    return jsonify(materials)

@education_bp.route('/<int:resource_id>', methods=['GET'])
def get_material(resource_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Articles, Videos, Statistics FROM Education WHERE Resource_ID = %s", (resource_id,))
    material = cursor.fetchone()
    return jsonify(material)

@education_bp.route('/', methods=['POST'])
def add_material():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("INSERT INTO Education (Articles, Videos, User_ID, Statistics) VALUES (%s, %s, %s, %s)", (data['Articles'], data['Videos'], data['User_ID'], data['Statistics']))
    db.get_db().commit()
    return jsonify({'message': 'Educational material added successfully'}), 201

@education_bp.route('/<int:resource_id>', methods=['PUT'])
def update_material(resource_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("UPDATE Education SET Articles = %s, Videos = %s, Statistics = %s WHERE Resource_ID = %s", (data['Articles'], data['Videos'], data['Statistics'], resource_id))
    db.get_db().commit()
    return jsonify({'message': 'Educational material updated successfully'}), 200

@education_bp.route('/<int:resource_id>', methods=['DELETE'])
def delete_material(resource_id):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM Education WHERE Resource_ID = %s", (resource_id,))
    db.get_db().commit()
    return jsonify({'message': 'Educational material deleted successfully'}), 200
