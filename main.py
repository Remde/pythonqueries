import mysql.connector
from Caller import Caller
from Printer import Printer

caller = Caller()

mydb = mysql.connector.connect(
  host="localhost",
  user="user",
  password="password",
  database="steam"
)

while(True):
    printer = Printer(0)
    while (True):
        choice = input(printer.printOptions())
        query = caller.retrieveQuery(choice)
        if query["call"] != 'INVALID':
            break

    cursor = mydb.cursor()
    cursor.execute(query["call"])

    results = cursor.fetchall()

    printer.printResults(results, query["header"])
    choice = input(printer.printFinalOutput())
