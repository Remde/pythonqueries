from Reader import Reader

class Caller:
    def __init__(self):
        self.reader = Reader()

    def retrieveQuery(self, choice):
        if choice == '1':
            return self.reader.read1()
        elif choice == '2':
            return self.reader.read2()
        elif choice == '3':
            return self.reader.read3()
        elif choice == '4':
            return self.reader.read4()
        elif choice == '5':
            return self.reader.read5()
        elif choice == '6':
            return self.reader.read6()
        elif choice == '7':
            return self.reader.read7()
        elif choice == '8':
            return self.reader.read8()
        elif choice == '9':
            return self.reader.read9()
        elif choice == '10':
            return self.reader.read10()
        elif choice == '0':
            return self.reader.exitCall()
        else:
            return self.reader.callFailed()
