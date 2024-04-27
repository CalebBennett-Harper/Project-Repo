import mysql.connector

# Connect to MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123",
    database="nosmoke"
)

cursor = db.cursor()

# Function to create a new user
def create_user(username, age, economic_status, health, years_vaping):
    try:
        cursor.execute("INSERT INTO users (username, age, economic_status, health, years_vaping) VALUES (%s, %s, %s, %s, %s)", (username, age, economic_status, health, years_vaping))
        db.commit()
        print('User has been successfully created')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        print('User has not been created successfully')

# Function to check if a username exists
def check_user(username):
    cursor.execute("SELECT username FROM users WHERE username = %s", (username,))
    if cursor.fetchone():
        return True
    else:
        return False

# Function to delete a user
def delete_user(username):
    try:
        cursor.execute("DELETE FROM users WHERE username = %s", (username,))
        db.commit()
        print('User has been successfully deleted')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        print('User has not been deleted successfully')

# Function to update user information
def update_user(username, age, economic_status, health, years_vaping):
    try:
        cursor.execute("UPDATE users SET age = %s, economic_status = %s, health = %s, years_vaping = %s WHERE username = %s", (age, economic_status, health, years_vaping, username))
        db.commit()
        print('User information has been successfully updated')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        print('User information has not been updated successfully')

# Close the cursor and database connection
cursor.close()
db.close()

# Call the functions after defining them
create_user('mark', 20, 'in danger', 'good', 5)
create_user('jill', 16, 'stable', 'great', 1)
create_user('pierce', 13, 'bad', 'okay', 1)
