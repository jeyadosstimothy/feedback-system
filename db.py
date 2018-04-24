import MySQLdb
class dbHelper:
	def __init__(self):
		self.db=MySQLdb.connect("localhost","student","student","webprog")
		self.cursor=self.db.cursor()

	def __enter__(self):
		return self

	def __exit__(self,exc_type, exc_value, traceback):
		self.db.close()

	def getId(self,user,utype,password):
		self.cursor.execute("select id from info where name='{}' and type='{}' and pass='{}'".format(user,utype,password))
		return self.cursor.fetchall()

	def checkFeedback(self,userid):
		self.cursor.execute("select * from feedback where userid={}".format(userid))
		return len(self.cursor.fetchall())>0

	def insertFeedback(self,userid,form):
		try:	
			for key,value in form.items():
				self.cursor.execute("insert into feedback(userid,qno,choice) values({},{},{})".format(userid,key,value))
			self.db.commit()
		except:
			self.db.rollback()

	def fetchTotal(self,uType):
		self.cursor.execute("select qno,count(choice) from feedback,info where feedback.userid=info.id and type='{}' group by qno;".format(uType))
		return self.cursor.fetchall()

	def fetchChoices(self,uType):
		self.cursor.execute("select qno,choice,count(choice) from feedback,info where feedback.userid=info.id and type='{}' group by qno, choice;".format(uType))
		return self.cursor.fetchall()