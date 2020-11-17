CREATE TABLE Perfil (
  idPerfil INT(6) NOT NULL,
  nivel INT(3) NOT NULL,
  nome VARCHAR(20) NOT NULL,
  avatar BLOB,
  saldo NUMERIC(8,2) NOT NULL,
  email VARCHAR(30) NOT NULL UNIQUE,
  estadoOuProvincia VARCHAR(20),
  pais VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  isBanido TINYINT(1) NOT NULL,
  url VARCHAR(50) NOT NULL UNIQUE,
  nickname VARCHAR(20) NOT NULL,
  senha VARCHAR(20) NOT NULL,
  nmrCelular VARCHAR(20) NOT NULL UNIQUE,
  PRIMARY KEY (idPerfil)
);

INSERT INTO Perfil VALUES (1, 12, 'Roberto Silva', null, 5.75, 'robertinho@gmail.com', 'Rio de Janeiro', 'Brasil', 'Rio de Janeiro', 0, 'robertin', 'Grande Robertinho', 'Juracy!!!', '5521988923214');
INSERT INTO Perfil VALUES (2, 7, 'Gertrude', null, 170.50, 'gege@hotmail.com', null, 'Inglaterra', 'Washington', 1, 'gertrudestroyer', 'GeGeGameplays', 'WomanInArabia555', '447911123456');
INSERT INTO Perfil VALUES (3, 45, 'Luis Suárez', null, 37.99, 'viscabarca@yahoo.com', null, 'Uruguai', 'Salto' , 0, 'Luisito', 'El Pistolero', 'MSN2015', '5987387754651');



CREATE TABLE Promocoes (
  idPromocao INT(6) NOT NULL,
  inicio DATE NOT NULL,
  fim DATE NOT NULL,
  dsctPorcentagem INT(2) NOT NULL
);

INSERT INTO Promocoes VALUES (1, '2020-12-20', '2021-01-01', 45);
INSERT INTO Promocoes VALUES (2, '2020-10-15', '2020-11-28', 10);
INSERT INTO Promocoes VALUES (3, '2021-02-03', '2021-02-05', 80);



CREATE TABLE Programa (
  idPrograma INT(6) NOT NULL,
  idPromocao INT(6),
  nome VARCHAR(100) NOT NULL UNIQUE,
  descricao TEXT NOT NULL,
  linkDownload VARCHAR(50) NOT NULL,
  propriedades LONGTEXT NOT NULL,
  valor NUMERIC(6,2) NOT NULL,
  lancamento DATE NOT NULL,
  clasIndic VARCHAR(30) NOT NULL,
  captura LONGBLOB,
  trailer LONGBLOB,
  PRIMARY KEY(idPrograma)
);

INSERT INTO Programa VALUES (1, null, 'Team Frotress 2', 'Nove classes distintas providenciam uma enorme variação de habilidades táticas e personalidades. Constantemente atualizado com novos modos de jogo, mapas, equipamentos e o mais importante: chapéus!',
'www.steam.com/downloadTF2', 'SO: Windows® 7 (32/64-bit)/Vista/XP
Processador: 1.7 GHz Processor or better
Memória: 512 MB de RAM
DirectX: Versão 8.1
Rede: Conexão de internet banda larga
Armazenamento: 15 GB de espaço disponível', 0, '2007-10-10', 'PEGI 16', null, null);
INSERT INTO Programa VALUES (2, null, 'Counter Strike: Global Offensive', 'Counter-Strike: Global Offensive (CS: GO) expandirá na jogabilidade de ação baseada em equipes na qual foi pioneiro quando foi lançado há 12 anos. CS: GO contém novos mapas, personagens e armas, além de conter versões atualizadas de conteúdos do CS clássico (como de_dust2).',
'www.steam.com/downloadCSGO', 'SO: Windows® 7/Vista/XP
Processador: Intel® Core™ 2 Duo E6600 or AMD Phenom™ X3 8750 processor or better
Memória: 2 GB de RAM
Placa de vídeo: Video card must be 256 MB or more and should be a DirectX 9-compatible with support for Pixel Shader 3.0
DirectX: Versão 9.0c
Armazenamento: 15 GB de espaço disponível', 0, '2012-08-21', 'PEGI 16', null, null);
INSERT INTO Programa VALUES (3, 1, 'Tomb Raider', 'Tomb Raider explora a intensa história da origem de Lara Croft, e sua ascensão de uma jovem mulher a uma sobrevivente experiente.',
'www.steam.com/downloadTombRaider', 'OS:Windows XP Service Pack 3, Windows Vista,7,8 (32bit/64bit)
Processor:Dual core CPU: AMD Athlon64 X2 2.1 Ghz (4050+), Intel Core2 Duo 1.86 Ghz (E6300)
Memory:1GB Memory (2GB on Vista)

Graphics:DirectX 9 graphics card with 512Mb Video RAM: AMD Radeon HD 2600 XT, nVidia 8600
DirectX®:9.0c
Hard Drive:12 GB HD space
Other Requirements:Broadband Internet connection', 34.99, '2013-03-05', 'PEGI 18', null, null);
INSERT INTO Programa VALUES (4, 2, 'Krita', 'Krita is a powerful digital painting application, made for illustrators, game artists, concept artists, animators, comic book artists and everyone who wants to draw and paint.',
'www.steam.com/downloadKrita', 'Requer um processador e sistema operacional de 64 bits
SO: Windows 7
Processador: 1.6Ghz Dual-core CPU
Memória: 2 GB de RAM
Placa de vídeo: Modern (since 2009) graphics / Intel HD
Armazenamento: 300 MB de espaço disponível
Outras observações: 4GB System RAM.', 19.99, '2014-06-10', '' , null, null);



CREATE TABLE Item (
  idItem INT(6) NOT NULL,
  nome VARCHAR(70) NOT NULL UNIQUE,
  descricao TEXT NOT NULL,
  valorEmGemas INT(5),
  idPrograma int(6) NOT NULL,
  PRIMARY KEY(idItem),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);

INSERT INTO Item VALUES (1,'Protegido', '', 100, 2);
INSERT INTO Item VALUES (2,'Crossroads (Carta Colecionável)', 'Crossroads', 11, 3);
INSERT INTO Item VALUES (3,'O Lança-foguetes do Lamentável', 'Lança-foguetes nível 1-100
Segure o botão de disparo para carregar até três foguetes
Solte o botão de disparo para liberar o bombardeio
-20% no raio de explosão
Desvio aleatório dos projéteis de +3 graus
Sobrecarregar a câmara causará um disparo falho
Não pode coletar munição de fornecedores enquanto ativo', null, 1);
INSERT INTO Item Values (4, 'Caixa de Suprimentos da Mann Co. - Série 56',
'Uma Chave da Caixa de Suprimentos da Mann Co. é necessária para destrancar esta caixa.
Você pode pegar uma na Loja Mann Co..
 
Esta caixa contém um dos seguintes itens.
Armas terão a qualidade Estranha.
Machado de Incêndio
A Guilhotina Voadora
O Lança-foguetes do Lamentável
Peça Estranha: Medics Mortos
Peça Estranha: Tanques Destruídos
Peça Estranha: Mortes a Longa Distância
Veste do Oeste
Pilha Modesta de Chapéu
ou um Chapéu Incomum Série 2 Excessivamente Raro!', null, 1);



CREATE TABLE Empresa (
  idEmpresa INT(6) NOT NULL,
  nome VARCHAR(20) NOT NULL UNIQUE,
  logo BLOB,
  linkYoutube VARCHAR(60),
  linkTwitter VARCHAR(50),
  linkFacebook VARCHAR(70),
  website VARCHAR(100) NOT NULL,
  PRIMARY KEY (idEmpresa)
);

INSERT INTO Empresa VALUES (1, 'Square Enix', null, 'www.youtube.com/squareenixna/', 'twitter.com/SquareEnix', null, 'www.square-enix.com');
INSERT INTO Empresa VALUES (2, 'Valve', null, null, null, null, 'www.valvesoftware.com');
INSERT INTO Empresa VALUES (3, 'Eidos Montréal', null, 'www.youtube.com/user/EidosMontreal', 'twitter.com/EidosMontreal', 'www.facebook.com/EidosMontreal/', 'www.eidosmontreal.com');
INSERT INTO Empresa VALUES (4, 'Krita Team', null, null, null, null, 'www.krita.org');


CREATE TABLE Comodite (
  idItem INT(6) NOT NULL,
  imagem BLOB,
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  PRIMARY KEY(idItem)
);

INSERT INTO Comodite VALUES (4, null);



CREATE TABLE Cosmetico (
  idItem INT(6) NOT NULL,
  modelo LONGBLOB,
  miniatura BLOB,
  qualidade VARCHAR(10) NOT NULL,
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  PRIMARY KEY(idItem)
);

INSERT INTO Cosmetico VALUES (3, null, null, 'Estranho');



CREATE TABLE Marcadores (
  idMarcador INT(6) NOT NULL,
  nome VARCHAR(30) NOT NULL,
  PRIMARY KEY(idMarcador)
);

INSERT INTO Marcadores VALUES (1, 'Protagonista Mulher');
INSERT INTO Marcadores VALUES (2, 'Multijogador');
INSERT INTO Marcadores VALUES (3, 'Visão 3D');
INSERT INTO Marcadores VALUES (4, 'Furtivo');
INSERT INTO Marcadores VALUES (5, 'Primeira Pessoa');
INSERT INTO Marcadores VALUES (6, 'Terceira Pessoa');
INSERT INTO Marcadores VALUES (7, 'Um Jogador');
INSERT INTO Marcadores VALUES (8, 'Design e Ilustração');
INSERT INTO Marcadores VALUES (9, 'Animação e modelagem');
INSERT INTO Marcadores VALUES (10, 'Edição de fotos');
INSERT INTO Marcadores VALUES (11, 'Comercializável');
INSERT INTO Marcadores VALUES (12, 'Não Comercializável');
INSERT INTO Marcadores VALUES (13, 'Trocável');
INSERT INTO Marcadores VALUES (14, 'Não Trocável');
INSERT INTO Marcadores VALUES (15, 'Comum');
INSERT INTO Marcadores VALUES (16, 'Arma Primária');



CREATE TABLE Inventario (
  idInventario INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  gemas INT(9) NOT NULL,
  PRIMARY KEY(idInventario),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)
);

INSERT INTO Inventario VALUES (1, 1, 475);
INSERT INTO Inventario VALUES (2, 2, 0);
INSERT INTO Inventario VALUES (3, 3, 2019);



CREATE TABLE Analise (
  idAnalise INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  texto MEDIUMTEXT NOT NULL,
  positivaOuNegativa VARCHAR(8) NOT NULL,
  PRIMARY KEY(idAnalise),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil), 
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma),
  UNIQUE (idPerfil, idPrograma) 
);

INSERT INTO Analise VALUES (1, 1, 3, 'Lara Croft da porrada em todo mundo, muito bom', 'Positiva');
INSERT INTO Analise VALUES (2, 3, 1, 'No puedo abrir el juego, tiene un problema.', 'Negativa');
INSERT INTO Analise VALUES (3, 3, 2, 'No es de extrañar que me llamen "El Pistolero"... Mejor FPS', 'Positiva');
INSERT INTO Analise VALUES (4, 2, 4, 'Awesome for drawing!!! Just made my new book cover with it :D', 'Positiva');



CREATE TABLE Amizade (
  idPerfil1 INT(6) NOT NULL,
  idPerfil2 INT(6) NOT NULL,
  PRIMARY KEY(idPerfil1, idPerfil2),
  FOREIGN KEY(idPerfil1) REFERENCES Perfil(idPerfil), 
  FOREIGN KEY(idPerfil2) REFERENCES Perfil(idPerfil) 
);

INSERT INTO Amizade VALUES (1, 2);
INSERT INTO Amizade VALUES (2, 3);



CREATE TABLE Bau (
  idCosmetico INT(6) NOT NULL,
  idComodite INT(6) NOT NULL,
  PRIMARY KEY(idCosmetico, idComodite),
  FOREIGN KEY(idCosmetico) REFERENCES Cosmetico(iditem), 
  FOREIGN KEY(idComodite) REFERENCES Comodite(idItem) 
);

INSERT INTO Bau VALUES (3, 4);



CREATE TABLE Caracteristicas (
  idMarcador INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  PRIMARY KEY(idMarcador, idPrograma),
  FOREIGN KEY(idMarcador) REFERENCES Marcadores(idMarcador), 
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma) 
);

INSERT INTO Caracteristicas VALUES (2, 1);
INSERT INTO Caracteristicas VALUES (3, 1);
INSERT INTO Caracteristicas VALUES (5, 1);
INSERT INTO Caracteristicas VALUES (2, 2);
INSERT INTO Caracteristicas VALUES (3, 2);
INSERT INTO Caracteristicas VALUES (5, 2);
INSERT INTO Caracteristicas VALUES (1, 3);
INSERT INTO Caracteristicas VALUES (3, 3);
INSERT INTO Caracteristicas VALUES (4, 3);
INSERT INTO Caracteristicas VALUES (6, 3);
INSERT INTO Caracteristicas VALUES (7, 3);
INSERT INTO Caracteristicas VALUES (8, 4);
INSERT INTO Caracteristicas VALUES (9, 4);
INSERT INTO Caracteristicas VALUES (10, 4);



CREATE TABLE Carta (
  idItem INT(6) NOT NULL,
  imagem BLOB,
  FOREIGN KEY(idItem) REFERENCES Item(idItem) ,
  PRIMARY KEY (idItem)
);

INSERT INTO Carta VALUES (2, null);



CREATE TABLE Cartao (
  numero CHAR(16) NOT NULL,
  idPerfil INT(6) NOT NULL,
  bandeira VARCHAR(10) NOT NULL,
  cvv CHAR(3) NOT NULL,
  validade DATE NOT NULL,
  titular VARCHAR(40) NOT NULL,
  PRIMARY KEY(numero),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)  
);

INSERT INTO Cartao VALUES ('1234432112344321', 3, 'MasterCard', 411, '2023-10-09', 'Luis A Suárez Díaz');
INSERT INTO Cartao VALUES ('7452135965487845', 2, 'VISA', 999, '2025-03-15', 'Gertrude M Lowthian Bell');
INSERT INTO Cartao VALUES ('1122334455667788', 1, 'Hipercard', 101, '2020-12-01', 'Roberto Napoleão Silva');


CREATE TABLE Categoria (
  idCategoria INT(6) NOT NULL,
  nome VARCHAR(15) NOT NULL UNIQUE,
  PRIMARY KEY(idCategoria)
);

INSERT INTO categoria VALUES (1, 'Jogo');
INSERT INTO categoria VALUES (2, 'Software');
INSERT INTO categoria VALUES (3, 'Ação');
INSERT INTO categoria VALUES (4, 'Aventura');
INSERT INTO categoria VALUES (5, 'Tiro');
INSERT INTO categoria VALUES (6, 'Esportes');



CREATE TABLE Compra (
  idPerfil INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  dataCompra DATE NOT NULL,
  horasUtilizacao INT(8),
  PRIMARY KEY(idPerfil, idPrograma),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil), 
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma) 
);

INSERT INTO Compra VALUES (2, 4, '2018-03-17', 20);
INSERT INTO Compra VALUES (3, 2, '2015-01-12', 1758);
INSERT INTO Compra VALUES (3, 1, '2019-11-02', null);
INSERT INTO Compra VALUES (1, 3, '2016-06-07', 524);
INSERT INTO Compra VALUES (2, 1, '2016-06-07', 75);


CREATE TABLE Contem (
  idItem INT(6) NOT NULL,
  idInventario INT(6) NOT NULL,
  qtd INT(10) NOT NULL,
  PRIMARY KEY(idItem, idInventario),
  FOREIGN KEY(idItem) REFERENCES Item(idItem), 
  FOREIGN KEY(idInventario) REFERENCES Inventario(idInventario) 
);

INSERT INTO Contem VALUES (1, 1, 1);
INSERT INTO Contem VALUES (3, 2, 1);
INSERT INTO Contem VALUES (2, 1, 3);



CREATE TABLE Grupo (
  idGrupo INT(6) NOT NULL,
  descricao TEXT NOT NULL,
  nome VARCHAR(30) NOT NULL,
  abreviacao VARCHAR(5) NOT NULL,
  dataFundacao DATE NOT NULL,
  pais VARCHAR(20),
  url VARCHAR(50) NOT NULL UNIQUE,
  isGrupoPublico TINYINT(1) NOT NULL,
  PRIMARY KEY(idGrupo)
);

INSERT INTO Grupo VALUES(1, 'Apenas para fãs do DJ Azeitona', 'Tchama', 'DJAZ', '2019-12-29', 'Brasil', 'TchamaOGrupo', 1);
INSERT INTO Grupo VALUES(2, 'Barcelona é nossa paixão!!! A champions é nossa', 'Crias do Messi', 'R10', '2015-06-06', 'Espanha', 'MSN', 0);
INSERT INTO Grupo VALUES(3, 'Grupo destinado apenas a pessoas que trabalham com desenho, animação e design', 'Animadores & Designers', 'A&D', '2017-04-23', 'Coréia do Sul', 'Animakers', 1);



CREATE TABLE Insignia (
  idInsignia INT(6) NOT NULL,
  XP INT(6) NOT NULL,
  nome VARCHAR(60) NOT NULL UNIQUE,
  descricao TEXT NOT NULL,
  PRIMARY KEY(idInsignia)
);

INSERT INTO Insignia VALUES(1, 100, 'Criador de Gemas', 'Reciclou um ou mais itens em troca de gemas.');
INSERT INTO Insignia VALUES(2, 100, 'Pista Falsa', 'ARG?');
INSERT INTO Insignia VALUES(3, 100, 'Aventura de Férias Steam de 2014 — Equipe Rosa', 'Participou da Equipe Rosa durante a Aventura de Férias Steam de 2014.');



CREATE TABLE Midia (
  idMidia INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  arquivo LONGBLOB,
  tipo VARCHAR(10) NOT NULL,
  PRIMARY KEY(idMidia),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)
);

INSERT INTO Midia VALUES (1, 1, null, 'Vídeo');
INSERT INTO Midia VALUES (2, 2, null, 'Captura');
INSERT INTO Midia VALUES (3, 3, null, 'Arte');



CREATE TABLE Noticia (
  idNoticia INT(6) NOT NULL,
  idEmpresa INT(6) NOT NULL,
  titulo VARCHAR(120) NOT NULL,
  data DATE NOT NULL,
  texto LONGTEXT NOT NULL,
  dislikes INT(7),
  likes INT(7),
  PRIMARY KEY(idNoticia)
);

INSERT INTO Noticia VALUES (1, 1, 'SQUARE ENIX SUMMER PROMOTION', '2020-06-25', 'Get in on the action with the Square Enix Summer Promotion including titles such as Just Cause, Tomb Raider, and many more. Promotion ends on July 9th at 10am PDT.', 0, 18);
INSERT INTO Noticia VALUES (2, 2, 'Tokyo Game Show 2020', '2020-09-24', 'Tokyo Games Show 2020 is happening right now online. Check out the featured titles on Steam from September 24th to 28th.', 1, 8);
INSERT INTO Noticia VALUES (3, 4, 'Krita 3.0 Available!', '2020-05-31', "Today, the Krita project releases Krita 3.0. We've worked over a year on the port to Qt5, implementing animation support and much, much more. There is Instant Preview, which makes it possible to work on bigger canvases, there is an improved layer panel, new filters, g'mic now works reliably. It's a huge release!", 1, 8);



CREATE TABLE Obtencao (
  idInsignia INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  dataConquista DATE NOT NULL,
  PRIMARY KEY(idInsignia, idPerfil),
  FOREIGN KEY(idInsignia) REFERENCES Insignia(idInsignia),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil) 
);

INSERT INTO Obtencao VALUES(1, 3, '2016-01-07');
INSERT INTO Obtencao VALUES(2, 3, '2016-01-01');
INSERT INTO Obtencao VALUES(3, 1, '2014-06-29');



CREATE TABLE Participacao (
  idGrupo INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  PRIMARY KEY(idGrupo, idPerfil),
  FOREIGN KEY(idGrupo) REFERENCES Grupo(idGrupo), 
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil) 
);

INSERT INTO Participacao VALUES(1, 1);
INSERT INTO Participacao VALUES(1, 2);
INSERT INTO Participacao VALUES(1, 3);
INSERT INTO Participacao VALUES(2, 3);
INSERT INTO Participacao VALUES(3, 2);



CREATE TABLE PlanoDeFundo (
  idItem INT(6) NOT NULL,
  wallpaper BLOB,
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  PRIMARY KEY(idItem)
);

INSERT INTO planodefundo VALUES (1 ,null);



CREATE TABLE Producao (
  idEmpresa INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  distOrDev BIT(1) NOT NULL,
  PRIMARY KEY(idEmpresa, idPrograma, distOrDev),
  FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);

INSERT INTO Producao VALUES(2, 1, 0);
INSERT INTO Producao VALUES(2, 1, 1);
INSERT INTO Producao VALUES(2, 2, 0);
INSERT INTO Producao VALUES(2, 2, 1);
INSERT INTO Producao VALUES(1, 3, 0);
INSERT INTO Producao VALUES(3, 3, 1);
INSERT INTO Producao VALUES(4, 4, 0);
INSERT INTO Producao VALUES(4, 4, 1);



CREATE TABLE Propriedades (
  idMarcador INT(6) NOT NULL,
  idItem INT(6) NOT NULL,
  PRIMARY KEY(idMarcador, idItem),
  FOREIGN KEY(idMarcador) REFERENCES Marcadores(idMarcador), 
  FOREIGN KEY(idItem) REFERENCES Item(idItem) 
);

INSERT INTO Propriedades VALUES(11, 1);
INSERT INTO Propriedades VALUES(13, 1);
INSERT INTO Propriedades VALUES(15, 1);
INSERT INTO Propriedades VALUES(11, 2);
INSERT INTO Propriedades VALUES(13, 2);
INSERT INTO Propriedades VALUES(15, 2);
INSERT INTO Propriedades VALUES(12, 3);
INSERT INTO Propriedades VALUES(14, 3);
INSERT INTO Propriedades VALUES(15, 3);
INSERT INTO Propriedades VALUES(11, 4);
INSERT INTO Propriedades VALUES(13, 4);
INSERT INTO Propriedades VALUES(15, 4);



CREATE TABLE Tema (
  idCategoria INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  PRIMARY KEY(idCategoria, idPrograma),
  FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria), 
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma) 
);

INSERT INTO Tema VALUES(1, 1);
INSERT INTO Tema VALUES(1, 2);
INSERT INTO Tema VALUES(1, 3);
INSERT INTO Tema VALUES(2, 4);
INSERT INTO Tema VALUES(3, 3);
INSERT INTO Tema VALUES(4, 3);
INSERT INTO Tema VALUES(5, 1);
INSERT INTO Tema VALUES(5, 2);
