from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

challenges_bp = Blueprint('challenges_and_badges', __name__, url_prefix='/challenges_and_badges')

@challenges_bp.route('/', methods=['GET'])
def get_all_challenges():
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Challenge_ID, Levels, User_ID, Badges, Start_Date, End_Date FROM Challenges")
    challenges = cursor.fetchall()
    return jsonify(challenges)

@challenges_bp.route('/completed/<int:user_id>', methods=['GET'])
def get_completed_challenges(user_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT c.Challenge_ID, c.Badges FROM Challenges c JOIN User_Challenges uc ON c.Challenge_ID = uc.Challenge_ID WHERE uc.User_ID = %s AND uc.Progress = 1", (user_id,))
    completed_challenges = cursor.fetchall()
    return jsonify(completed_challenges)

@challenges_bp.route('/<int:challenge_id>', methods=['GET'])
def get_challenge(challenge_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Levels, Badges, Start_Date, End_Date FROM Challenges WHERE Challenge_ID = %s", (challenge_id,))
    challenge = cursor.fetchone()
    return jsonify(challenge)

@challenges_bp.route('/', methods=['POST'])
def create_challenge():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("INSERT INTO Challenges (Levels, User_ID, Badges, Start_Date, End_Date) VALUES (%s, %s, %s, %s, %s)", (data['Levels'], data['User_ID'], data['Badges'], data['Start_Date'], data['End_Date']))
    db.get_db().commit()
    return jsonify({'message': 'Challenge created successfully'}), 201

@challenges_bp.route('/<int:challenge_id>', methods=['PUT'])
def update_challenge(challenge_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("UPDATE Challenges SET Levels = %s, Badges = %s, Start_Date = %s, End_Date = %s WHERE Challenge_ID = %s", (data['Levels'], data['Badges'], data['Start_Date'], data['End_Date'], challenge_id))
    db.get_db().commit()
    return jsonify({'message': 'Challenge updated successfully'}), 200

@challenges_bp.route('/<int:challenge_id>', methods=['DELETE'])
def delete_challenge(challenge_id):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM Challenges WHERE Challenge_ID = %s", (challenge_id,))
    db.get_db().commit()
    return jsonify({'message': 'Challenge deleted successfully'}), 200
