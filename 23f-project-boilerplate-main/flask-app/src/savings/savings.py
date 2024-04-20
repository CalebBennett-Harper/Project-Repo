from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

savings_bp = Blueprint('savings', __name__, url_prefix='/savings')

# Get the total sum of a specified user's savings
@savings_bp.route('/total/<int:user_id>', methods=['GET'])
def get_total_savings(user_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT SUM(Amount) FROM Savings WHERE User_ID = %s", (user_id,))
    total_savings = cursor.fetchone()[0]  # Fetch the first column of the first row
    return jsonify({'User_ID': user_id, 'Total Savings': total_savings})

# Get a specific savings transaction by Savings_ID
@savings_bp.route('/transaction/<int:savings_id>', methods=['GET'])
def get_savings_transaction(savings_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Savings_ID, User_ID, Amount, Date FROM Savings WHERE Savings_ID = %s", (savings_id,))
    transaction = cursor.fetchone()
    return jsonify(transaction)

# Create a new savings transaction
@savings_bp.route('/', methods=['POST'])
def create_savings():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("INSERT INTO Savings (User_ID, Amount, Date) VALUES (%s, %s, %s)", (data['User_ID'], data['Amount'], data['Date']))
    db.get_db().commit()
    return jsonify({'message': 'Savings transaction created'}), 201

# Update an existing savings transaction
@savings_bp.route('/<int:savings_id>', methods=['PUT'])
def update_savings(savings_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("UPDATE Savings SET Amount = %s, Date = %s WHERE Savings_ID = %s", (data['Amount'], data['Date'], savings_id))
    db.get_db().commit()
    return jsonify({'message': 'Savings transaction updated successfully'}), 200

# Delete a specific savings transaction
@savings_bp.route('/<int:savings_id>', methods=['DELETE'])
def delete_savings(savings_id):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM Savings WHERE Savings_ID = %s", (savings_id,))
    db.get_db().commit()
    return jsonify({'message': 'Savings transaction deleted successfully'}), 200
