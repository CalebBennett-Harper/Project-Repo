from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

user_stories_bp = Blueprint('user_stories', __name__, url_prefix='/user_stories')

@user_stories_bp.route('/', methods=['GET'])
def get_all_posts():
    print("u / accessed")
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Post_ID, Support_ID, User_ID, Content, Date FROM Posts")
    posts = cursor.fetchall()
    return jsonify(posts)

@user_stories_bp.route('/<int:post_id>', methods=['GET'])
def get_post(post_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Support_ID, User_ID, Content, Date FROM Posts WHERE Post_ID = %s", (post_id,))
    post = cursor.fetchone()
    return jsonify(post)

@user_stories_bp.route('/<int:post_id>/comments', methods=['GET'])
def get_comments_for_post(post_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Comment_ID, Content, Date FROM Comments WHERE Post_ID = %s", (post_id,))
    comments = cursor.fetchall()
    return jsonify(comments)

@user_stories_bp.route('/<int:post_id>/comments', methods=['POST'])
def add_comment_to_post(post_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("INSERT INTO Comments (Post_ID, User_ID, Content, Date) VALUES (%s, %s, %s, %s)", (post_id, data['User_ID'], data['Content'], data['Date']))
    db.get_db().commit()
    return jsonify({'message': 'Comment added successfully'}), 201

@user_stories_bp.route('/comments/<int:comment_id>', methods=['DELETE'])
def delete_comment(comment_id):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM Comments WHERE Comment_ID = %s", (comment_id,))
    db.get_db().commit()
    return jsonify({'message': 'Comment deleted successfully'}), 200

@user_stories_bp.route('/', methods=['POST'])
def create_post():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("INSERT INTO Posts (Support_ID, User_ID, Content, Date) VALUES (%s, %s, %s, %s)", (data['Support_ID'], data['User_ID'], data['Content'], data['Date']))
    db.get_db().commit()
    return jsonify({'message': 'Post created successfully'}), 201

@user_stories_bp.route('/<int:post_id>', methods=['PUT'])
def update_post(post_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute("UPDATE Posts SET Content = %s, Date = %s WHERE Post_ID = %s", (data['Content'], data['Date'], post_id))
    db.get_db().commit()
    return jsonify({'message': 'Post updated successfully'}), 200

@user_stories_bp.route('/<int:post_id>', methods=['DELETE'])
def delete_post(post_id):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM Posts WHERE Post_ID = %s", (post_id,))
    db.get_db().commit()
    return jsonify({'message': 'Post deleted successfully'}), 200
