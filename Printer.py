class Printer:
    def __init__(self, maxChars):
        self.maxChars = maxChars
        self.NUMBER_OF_ADDITIONAL_CHARACTERS = 4

    def printOptions(self):
        return("0.\t SAIR\n\n"
        "1.\t Grupos com participantes acima de X\n"
        "2.\t Quantidade de amigos por perfil\n"
        "3.\t Quantidade de notícias por empresa distribuidora\n"
        "4.\t Categorias sem nenhum programa\n"
        "5.\t Programas produzidos por mais de uma empresa\n"
        "6.\t Análises positivas de programas feitas por usuários não banidos\n"
        "7.\t Quantidade de usuários que conquistaram insígnias antes de um ano, para cada insígnia\n"
        "8.\t Quantidade de itens que cada usuário possui, ordenado pelo nível dos usuários\n"
        "9.\t Itens Baús e cosméticos que podem ser obtidos neles\n"
        "10.\t Programas com um certo marcador que estiveram/estão/estarão em desconto \n\t (Com data de início e fim da promoção)\n\n"
        "Escolha uma das opções: ")

    def printResults(self, results, header):
        print("\n")
        for result in results:
            self._countMaxChars(result)
        self.printMarkers()
        print(header + "\n")
        for result in results:
            print(result)
        self.printMarkers()

    def printMarkers(self):
        return print('-'*self.maxChars)

    def printFinalOutput(self):
        return ("\nPressione Enter para continuar.\n\n")

    def _countMaxChars(self, row):
        currentMax = 0
        for string in row:
            currentMax += len(str(string))
            currentMax += self.NUMBER_OF_ADDITIONAL_CHARACTERS
        if currentMax > self.maxChars:
            self.maxChars = currentMax
