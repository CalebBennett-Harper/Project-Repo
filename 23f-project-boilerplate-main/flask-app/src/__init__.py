# Some set up for the application 

from flask import Flask, render_template, session, request, redirect
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()

def create_app():
    app = Flask(__name__)
    app.app_context().push()
    
    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'

    # these are for the DB object to be able to connect to MySQL. 
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = 456
    # open('/secrets/db_root_password.txt').readline().strip()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'nosmoke'  # Change this to your DB name

    # Initialize the database object with the settings above. 
    db.init_app(app)
    
    # Add the default route
    # Can be accessed from a web browser
    # http://ip_address:port/
    # Example: localhost:8001
    @app.route("/")
    def welcome():
          with open('templates/index.html', 'r') as file:
                html_content = file.read()
          return html_content 

    @app.route('/savings')
    def savings():
        with open('templates/savings/savings.html', 'r') as file:
            return file.read()

    @app.route('/education')
    def education():
        with open('templates/education/education.html', 'r') as file:
            return file.read()

    @app.route('/challenges')
    def challenges():
        with open('templates/challenges_badges/challenges_badges.html', 'r') as file:
            return file.read()

    @app.route('/user-stories')
    def user_stories():
        with open('templates/user_stories/user_stories.html', 'r') as file:
            return file.read()

    # Import the various Blueprint Objects
    from src.savings.savings  import savings_bp
    from src.education.education  import education_bp
    from src.challenges_and_badges.challenges_and_badges  import challenges_bp
    from src.user_stories.user_stories  import user_stories_bp

    # Register the routes from each Blueprint with the app object
    # and give a url prefix to each
    app.register_blueprint(savings_bp)
    app.register_blueprint(education_bp)
    app.register_blueprint(challenges_bp)
    app.register_blueprint(user_stories_bp)

    # Don't forget to return the app object
    return app

