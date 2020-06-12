from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from send_mail import send_mail
from sqlalchemy.sql import func

app = Flask(__name__)
#app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:Abhi99@Localhost/Height_Collector'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres://imobswmzifyxjt:a4d353b0111ee55f3b7605138058bf744097e4f4783a59bde90b42fcaab86b44@ec2-35-169-254-43.compute-1.amazonaws.com:5432/d1p12uiomfbrrr?sslmode=require'

db = SQLAlchemy(app)


class Data (db.Model):
    __tablename__ = "data"
    id = db.Column(db.Integer, primary_key = True)
    email_db = db.Column(db.String(120), unique = True)
    height_db = db.Column(db.Integer)

    def __init__ (self, email_db, height_db):
        self.email_db = email_db
        self.height_db = height_db



@app.route("/")

def index():
    return render_template("index.html")

@app.route("/success", methods = ['POST'])

def success():
    if request.method == 'POST':
        email = request.form["email_name"]
        height = request.form["height_value"]
        if db.session.query(Data).filter(Data.email_db == email).count() == 0:
            data = Data(email,height)
            db.session.add(data)
            db.session.commit()
            avg_height = db.session.query(func.avg(Data.height_db)).scalar()
            avg_height = round(avg_height,1)
            count = db.session.query(Data.height_db).count()
            send_mail(email, height, avg_height, count)
            return render_template("success.html")

    return render_template("index.html",
            text = "Seems like we have got the response from that email already!")

if __name__ == '__main__':
    app.debug = True
    app.run()