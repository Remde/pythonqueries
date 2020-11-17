class Reader:
    def __init__(self):
        pass

    def read1(self):
        return "SELECT * FROM Perfil"

    def read2(self):
        return "SELECT * FROM customers"

    def read3(self):
        return "SELECT * FROM customers"

    def read4(self):
        return "SELECT * FROM customers"

    def read5(self):
        return "SELECT * FROM customers"

    def read6(self):
        return "SELECT * FROM customers"

    def read7(self):
        return "SELECT * FROM customers"

    def read8(self):
        return "SELECT * FROM customers"

    def read9(self):
        return "SELECT * FROM customers"

    def read10(self):
        return "SELECT * FROM customers"

    def exitCall(self):
        return exit()

    def callFailed(self):
        choice = input("\n\nEntrada inválida. Aperte Enter para tentar novamente.")
        return 'INVALID'
