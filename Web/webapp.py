from flask import Flask, render_template
from firebase import firebase
import os
app = Flask(__name__, template_folder='templates')

firebase = firebase.FirebaseApplication('https://cfgteam7.firebaseio.com/', authentication=None)
#authentication = firebase.Authentication('AIzaSyDL_wTY9KSHsIk83KSV4de1nRvR34Cf5cA', 'nnoles@umich.edu', extra={'id': 123})

@app.route("/")
def mainRoute():
    return render_template("login.html")

@app.route("/survey/")
def surveyRoute():
	students = firebase.get('/review', None)
	for student in students:
		print (student + "responded: ")

	questions = students.get('ajeet', None)
	questions.sort()
	for question in qudestions:
		print (question + " ") + questions[question]

	#studentdata = json.loads(students)
	#print studentdata['ajeet']
	#questions = results.get('ajeet', None)
	#supers = answers.get('Q1', None)
	#print("hi")
	#print(results)
	#print(answers)
	#for result in results:
	#	print result + " responded:"
	#for answer in answers:
	#	print answer +  " "
	#	print supers
	#print(super)
	#for result in results:
		#print(result.Q1)
	return render_template("survey.html")

@app.route("/portal/")
def portalRoute():
    return render_template("index.html")

@app.route("/journey/")
def journeyRoute():
    return render_template("journey.html")
 
if __name__ == "__main__":
    app.run(host=os.getenv('IP', '0.0.0.0'),
    	port=int(os.getenv('PORT', 8080)))

