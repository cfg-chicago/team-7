from flask import Flask, render_template
import os
app = Flask(__name__, template_folder='templates')
 
@app.route("/")
def mainRoute():
    return render_template("index.html")

@app.route("/survey")
def surveyRoute():
	return render_template("survey.html")

@app.route("/journey")
def journeyRoute():
    return render_template("journey.html")
 
if __name__ == "__main__":
    app.run(host=os.getenv('IP', '0.0.0.0'),
    	port=int(os.getenv('PORT', 8080)))
