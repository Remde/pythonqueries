class Printer:
    def __init__(self, maxChars):
        self.maxChars = maxChars
        self.NUMBER_OF_ADDITIONAL_CHARACTERS = 4

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
        "10 - \n\n"
        "Escolha uma das opções: ")

    def printResults(self, results):
        for result in results:
            self._countMaxChars(result)
        self.printMarkers()
        for result in results:
            print(result)

    def printMarkers(self):
        return print('-'*self.maxChars)

    def printFinalOutput(self):
        return ("\nPressione Enter para continuar.")

    def _countMaxChars(self, row):
        currentMax = 0
        for string in row:
            currentMax += len(str(string))
            currentMax += self.NUMBER_OF_ADDITIONAL_CHARACTERS
        if currentMax > self.maxChars:
            self.maxChars = currentMax
