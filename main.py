import mysql.connector
from Caller import Caller
from Printer import Printer

caller = Caller()
printer = Printer(0)

mydb = mysql.connector.connect(
  host="localhost",
  user="user",
  password="password",
  database="steam"
)

while(True):
    while (True):
        choice = input(printer.printOptions())
        query = caller.retrieveQuery(choice)
        if query != 'INVALID':
            break

    cursor = mydb.cursor()
    cursor.execute(query)

    results = cursor.fetchall()

    printer.printResults(results)
    choice = input(printer.printFinalOutput())
