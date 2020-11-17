import mysql.connector
from Caller import Caller
from Printer import Printer

mydb = mysql.connector.connect(
  host="localhost",
  user="user",
  password="password",
  database="steam"
)

printer = Printer(0)

choice = input(printer.printOptions())

caller = Caller(choice)
query = caller.retrieveQuery()

cursor = mydb.cursor()
cursor.execute(query)

results = cursor.fetchall()

printer.printResults(results)
