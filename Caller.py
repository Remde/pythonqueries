from Reader import Reader

class Caller:
    def __init__(self):
        self.reader = Reader()

    def retrieveQuery(self, choice):
        query = {}
        if choice == '1':
            minimumNumberOfParticipants = input("Qual o número mínimo de participantes? ")
            query["call"] = self.reader.getGroupsWithOverXParticipants(minimumNumberOfParticipants)
            query["header"] = "GRUPO, PARTICIPANTE"
            return query
        elif choice == '2':
            query["call"] = self.reader.getNumberOfFriendsByProfile()
            query["header"] = "NOME, AMIGOS"
            return query
        elif choice == '3':
            query["call"] = self.reader.getNumberOfNewsByPublisher()
            query["header"] = "PUBLISHER, NEWS"
            return query
        elif choice == '4':
            query["call"] = self.reader.getCategoriesWithoutProgram()
            query["header"] = "CATEGORIA"
            return query
        elif choice == '5':
            query["call"] = self.reader.getProgramsByMoreThanOneCompany()
            query["header"] = "PROGRAMA, EMPRESA"
            return query
        elif choice == '6':
            query["call"] = self.reader.getPositiveReviewsByNonBanned()
            query["header"] = "PERFIL, PROGRAMA, HORAS, TEXTO"
            return query
        elif choice == '7':
            year = input("Antes de qual ano? ")
            query["call"] = self.reader.getNumberOfUserForEachInsigniasBeforeYear(year)
            query["header"] = "INSIGNIA, USUARIOS"
            return query
        elif choice == '8':
            query["call"] = self.reader.getNumberOfItemsByUserOrderedByLevel()
            query["header"] = "USUARIO, NIVEL, ITENS"
            return query
        elif choice == '9':
            query["call"] = self.reader.getCosmeticsByChest()
            query["header"] = "BAU, COSMETICO, QUALIDADE"
            return query
        elif choice == '10':
            marker = input("Qual marcador você deseja? ")
            query["call"] = self.reader.getProgramsWithMarkerAndDiscount(marker)
            query["header"] = "JOGO, DESCONTO, DATA DE INICIO, DATA DE FIM"
            return query
        elif choice == '0':
            return self.reader.exitCall()
        else:
            return self.reader.callFailed()
