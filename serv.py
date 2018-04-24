from flask import Flask,request,render_template, redirect, url_for, session
from db import dbHelper

app=Flask(__name__,static_url_path="")
parent_q=[]
student_q=[]
alumni_q=[]
question={}
choice={0:'Strongly Disagree',1:'Disagree',2:'Agree',3:'Strongly Agree'}

def fillQues():
	with open('questions/studentq.txt') as f:
		student_q=[i.strip() for i in f.read().splitlines()]
	with open('questions/parentq.txt') as f:
		parent_q=[i.strip() for i in f.read().splitlines()]
	with open('questions/alumniq.txt') as f:
		alumni_q=[i.strip() for i in f.read().splitlines()]
	question['parent']=parent_q
	question['student']=student_q
	question['alumni']=alumni_q

@app.route("/")
def func():
	if 'userid' in session and session['userid']!='admin':
		return render_template('feedback.html',name=session['user'],question=question[session['type']],type=session['type'][0].upper()+session['type'][1:])
	elif 'userid' in session and session['userid']=='admin':
		return showResults()
	else:
		return render_template('index.html',myText='Please enter the following details to continue',submitLink="/login")

@app.route("/admin")
def admin():
	if 'userid' in session and session['userid']=='admin':
		return showResults()
	return render_template('admin.html',myText='Please enter the following details to continue',submitLink="/adminLogin")

@app.route("/adminLogin",methods=["GET","POST"])
def adminLogin():
	if 'userid' in session and session['userid']=='admin':
		return showResults()
	if(request.form['username']=='admin' and request.form['password']=='1234'):
		session['userid']="admin"
		session['type']=request.form['type']
		return showResults()
	else:
		return render_template('index.html',myText='The details you provided did not match any records. Please try again.',submitLink='/adminLogin')

@app.route("/login",methods=["POST"])
def login():
	uType=request.form['type']
	result=[]
	with dbHelper() as db:
		result=db.getId(request.form['username'],request.form['type'],request.form['password'])
	if(len(result)>0):
		userid=result[0][0]
		already=False
		with dbHelper() as db:
			already=db.checkFeedback(userid)
		if(already):
			return render_template('index.html',myText='You have already given Feedback. Please login at a different time.',submitLink='/login')
		session['userid']=str(userid)
		session['user']=request.form['username']
		return render_template('feedback.html',name=request.form['username'],question=question[request.form['type']],type=uType[0].upper()+uType[1:])
	else:
		return render_template('index.html',myText='The details you provided did not match any records. Please try again.',submitLink='/login')

@app.route("/submit",methods=["POST"])
def submit():
	if 'userid' not in session:
		return render_template('index.html',myText='Please enter the following details to continue')
	with dbHelper() as db:
		db.insertFeedback(session['userid'],request.form)
	return render_template('signout.html')

def showResults():
	uType=session['type']
	with dbHelper() as db:
		result=db.fetchTotal(uType)
	if(len(result)==0):
		return "No entries"
	total=float(result[0][1])
	with dbHelper() as db:
		result=fetchChoices(uType)
	answer=[{} for _ in range(len(question[uType]))];
	for i in result:
		answer[i[0]][i[1]]=int((i[2]/total)*100)
	return render_template('result.html',result=answer,type=uType[0].upper()+uType[1:],question=question[uType],choice=choice)

@app.route("/logout")
def logout():
	if 'userid' not in session:
		return redirect('/')
	username=session['userid']
	session.pop('userid', None)
	if username=='admin':
		return redirect('/admin')
	else:
		return redirect('/')

if __name__ == '__main__':
	fillQues()
	app.secret_key='abcdefghijklmnopqrstuvwxyz'
	app.run("localhost",debug=True)
