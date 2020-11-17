class Printer:
    def __init__(self, maxChars):
        self.maxChars = maxChars

    def printOptions(self):
        return("0 - SAIR\n\n"
        "1 - \n"
        "2 - \n"
        "3 - \n"
        "4 - \n"
        "5 - \n"
        "6 - \n"
        "7 - \n"
        "8 - \n"
        "9 - \n"
        "10 - \n")

    def printResults(results, self):
        for result in results:
            self.countMaxChars(result)
        self.printMarkers()
        for result in results:
            print(result)

    def printMarkers(self):
        for markerCount in range(self.maxChars):
            print('-')

    def countMaxChars(self, row):
        if len(row) > self.maxChars:
            self.maxChars = len(row)
