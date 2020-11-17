from Reader import Reader

class Caller:
    def __init__(self, choice):
        self.choice = choice
        self.reader = Reader()

    def retrieveQuery(self):
        if self.choice == '1':
            self.reader.read1()
        elif self.choice == '2':
            self.reader.read2()
        elif self.choice == '3':
            self.reader.read3()
        elif self.choice == '4':
            self.reader.read4()
        elif self.choice == '5':
            self.reader.read5()
        elif self.choice == '6':
            self.reader.read6()
        elif self.choice == '7':
            self.reader.read7()
        elif self.choice == '8':
            self.reader.read8()
        elif self.choice == '9':
            self.reader.read9()
        elif self.choice == '10':
            self.reader.read10()
        elif self.choice == '0':
            self.reader.exitCall()
        else:
            self.reader.callFailed()
