class Reader:
    def __init__(self):
        pass

    def getGroupsWithOverXParticipants(self, minimumNumberOfParticipants):
        return f"SELECT g.nomeGrupo, COUNT(x.nomePerfil) as \"Número de Participantes\" FROM steam.grupo as g JOIN participacao as p on p.idGrupo=g.idGrupo JOIN perfil as x on x.idPerfil=p.idPerfil group by g.nomeGrupo having COUNT(x.nomePerfil)>{minimumNumberOfParticipants}"

    def getNumberOfFriendsByProfile(self):
        return "SELECT a.nomePerfil, (SELECT COUNT(d.nomePerfil) FROM perfil as b JOIN amizade as c on c.idPerfil1=b.idPerfil JOIN perfil as d on c.idPerfil2=d.idPerfil where b.nomePerfil=a.nomePerfil)+(SELECT COUNT(d.nomePerfil) FROM perfil as b JOIN amizade as c on c.idPerfil2=b.idPerfil JOIN perfil as d on c.idPerfil1=d.idPerfil where b.nomePerfil=a.nomePerfil) as \"Quantidade de amigos\" FROM perfil as a group by a.nomePerfil"

    def getNumberOfNewsByPublisher(self):
        return "SELECT e.nomeEmp, (SELECT COUNT(x.idNoticia) FROM noticia as x JOIN empresa as y on x.idEmpresa = y.idEmpresa where e.nomeEmp=y.nomeEmp) as \"Número de Notícias\" FROM noticia  as n JOIN empresa as e on n.idEmpresa = e.idEmpresa JOIN producao as p on p.idEmpresa = e.idEmpresa where distOrDev = 1 group by e.nomeEmp"

    def getCategoriesWithoutProgram(self):
        return "SELECT DISTINCT c.nomeCat FROM categoria as c WHERE NOT EXISTS (SELECT * FROM programa as p JOIN tema as t on p.idPrograma=t.idPrograma JOIN categoria as a on t.idCategoria=a.idCategoria WHERE c.nomeCat=a.nomeCat )"

    def getProgramsByMoreThanOneCompany(self):
        return "SELECT p.nomeProg, e.nomeEmp FROM programa as p JOIN producao as x on x.idPrograma=p.idPrograma JOIN empresa as e on e.idEmpresa=x.idEmpresa WHERE p.idPrograma IN (SELECT a.idPrograma FROM programa as a JOIN producao as b on b.idPrograma=a.idPrograma JOIN empresa as c on c.idEmpresa=b.idEmpresa WHERE e.nomeEmp!=c.nomeEmp)"

    def getPositiveReviewsByNonBanned(self):
        return "SELECT nomePerfil, nomeProg, horasUtilizacao, texto FROM analiseusernaobanido WHERE (positivaOuNegativa='Positiva' AND horasUtilizacao>0)"

    def getNumberOfUserForEachInsigniasBeforeYear(self, year):
        return f"SELECT nomeInsig, (SELECT COUNT(c.nomePerfil) FROM insignia as a JOIN obtencao as b ON a.idInsignia=b.idInsignia JOIN perfil as c on b.idPerfil=c.idPerfil where dataconquista<'{year}-01-01' and i.nomeInsig=a.nomeInsig ) as \"Quantidade de usuários que adquiriram\" FROM insignia as i LEFT JOIN obtencao as o ON i.idInsignia=o.idInsignia group by nomeInsig"

    def getNumberOfItemsByUserOrderedByLevel(self):
        return "SELECT nomePerfil, nivel, COALESCE((SELECT SUM(z.qtd) FROM perfil as x JOIN inventario as y on y.idPerfil=x.idPerfil JOIN contem as z on z.idInventario=y.idInventario WHERE x.idPerfil = p.idPerfil), 0) as \"Quantidade de itens no inventário\" FROM perfil as p group by nomePerfil order by nivel desc "

    def getCosmeticsByChest(self):
        return "SELECT itcomo.nomeItem as \"Baú\", itcosme.nomeItem as \"Cosmético\", qualidade FROM Item as itcomo JOIN comodite as como ON itcomo.idItem=como.idItem JOIN bau ON como.idItem=bau.idComodite JOIN cosmetico as cosme ON bau.idCosmetico=cosme.idItem JOIN Item as itcosme on itcosme.idItem=cosme.idItem "

    def getProgramsWithMarkerAndDiscount(self, marker):
        return f"SELECT DISTINCT NomeProg, dsctPorcentagem, inicio, fim FROM promocoes as prom JOIN programa as prog ON prog.idPromocao=prom.idPromocao JOIN caracteristicas as c ON c.idPrograma=prog.idPrograma JOIN marcadores as m ON m.idMarcador=c.idMarcador where nomeMarc='{marker}'"

    def exitCall(self):
        return exit()

    def callFailed(self):
        choice = input("\n\nEntrada inválida. Aperte Enter para tentar novamente.")
        print("\n\n")
        return 'INVALID'
