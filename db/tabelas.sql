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

CREATE TABLE Promocoes (
  idPromocao INT(6) NOT NULL,
  inicio DATE NOT NULL,
  fim DATE NOT NULL,
  dsctPorcentagem INT(2) NOT NULL
);

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

CREATE TABLE Item (
  idItem INT(6) NOT NULL,
  nome VARCHAR(70) NOT NULL UNIQUE,
  descricao TEXT NOT NULL,
  valorEmGemas INT(5),
  idPrograma int(6) NOT NULL,
  PRIMARY KEY(idItem),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);

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

CREATE TABLE Comodite (
  idItem INT(6) NOT NULL,
  imagem BLOB,
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  PRIMARY KEY(idItem)
);

CREATE TABLE Cosmetico (
  idItem INT(6) NOT NULL,
  modelo LONGBLOB,
  miniatura BLOB,
  qualidade VARCHAR(10) NOT NULL,
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  PRIMARY KEY(idItem)
);

CREATE TABLE Marcadores (
  idMarcador INT(6) NOT NULL,
  nome VARCHAR(30) NOT NULL,
  PRIMARY KEY(idMarcador)
);

CREATE TABLE Inventario (
  idInventario INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  gemas INT(9) NOT NULL,
  PRIMARY KEY(idInventario),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)
);

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

CREATE TABLE Amizade (
  idPerfil1 INT(6) NOT NULL,
  idPerfil2 INT(6) NOT NULL,
  PRIMARY KEY(idPerfil1, idPerfil2),
  FOREIGN KEY(idPerfil1) REFERENCES Perfil(idPerfil),
  FOREIGN KEY(idPerfil2) REFERENCES Perfil(idPerfil)
);

CREATE TABLE Bau (
  idCosmetico INT(6) NOT NULL,
  idComodite INT(6) NOT NULL,
  PRIMARY KEY(idCosmetico, idComodite),
  FOREIGN KEY(idCosmetico) REFERENCES Cosmetico(iditem),
  FOREIGN KEY(idComodite) REFERENCES Comodite(idItem)
);

CREATE TABLE Caracteristicas (
  idMarcador INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  PRIMARY KEY(idMarcador, idPrograma),
  FOREIGN KEY(idMarcador) REFERENCES Marcadores(idMarcador),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);

CREATE TABLE Carta (
  idItem INT(6) NOT NULL,
  imagem BLOB,
  FOREIGN KEY(idItem) REFERENCES Item(idItem) ,
  PRIMARY KEY (idItem)
);

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

CREATE TABLE Categoria (
  idCategoria INT(6) NOT NULL,
  nome VARCHAR(15) NOT NULL UNIQUE,
  PRIMARY KEY(idCategoria)
);

CREATE TABLE Compra (
  idPerfil INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  dataCompra DATE NOT NULL,
  horasUtilizacao INT(8),
  PRIMARY KEY(idPerfil, idPrograma),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);

CREATE TABLE Contem (
  idItem INT(6) NOT NULL,
  idInventario INT(6) NOT NULL,
  qtd INT(10) NOT NULL,
  PRIMARY KEY(idItem, idInventario),
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  FOREIGN KEY(idInventario) REFERENCES Inventario(idInventario)
);

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

CREATE TABLE Insignia (
  idInsignia INT(6) NOT NULL,
  XP INT(6) NOT NULL,
  nome VARCHAR(60) NOT NULL UNIQUE,
  descricao TEXT NOT NULL,
  PRIMARY KEY(idInsignia)
);

CREATE TABLE Midia (
  idMidia INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  arquivo LONGBLOB,
  tipo VARCHAR(10) NOT NULL,
  PRIMARY KEY(idMidia),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)
);

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

CREATE TABLE Obtencao (
  idInsignia INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  dataConquista DATE NOT NULL,
  PRIMARY KEY(idInsignia, idPerfil),
  FOREIGN KEY(idInsignia) REFERENCES Insignia(idInsignia),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)
);

CREATE TABLE Participacao (
  idGrupo INT(6) NOT NULL,
  idPerfil INT(6) NOT NULL,
  PRIMARY KEY(idGrupo, idPerfil),
  FOREIGN KEY(idGrupo) REFERENCES Grupo(idGrupo),
  FOREIGN KEY(idPerfil) REFERENCES Perfil(idPerfil)
);

CREATE TABLE PlanoDeFundo (
  idItem INT(6) NOT NULL,
  wallpaper BLOB,
  FOREIGN KEY(idItem) REFERENCES Item(idItem),
  PRIMARY KEY(idItem)
);

CREATE TABLE Producao (
  idEmpresa INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  distOrDev BIT(1) NOT NULL,
  PRIMARY KEY(idEmpresa, idPrograma, distOrDev),
  FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);

CREATE TABLE Propriedades (
  idMarcador INT(6) NOT NULL,
  idItem INT(6) NOT NULL,
  PRIMARY KEY(idMarcador, idItem),
  FOREIGN KEY(idMarcador) REFERENCES Marcadores(idMarcador),
  FOREIGN KEY(idItem) REFERENCES Item(idItem)
);

CREATE TABLE Tema (
  idCategoria INT(6) NOT NULL,
  idPrograma INT(6) NOT NULL,
  PRIMARY KEY(idCategoria, idPrograma),
  FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria),
  FOREIGN KEY(idPrograma) REFERENCES Programa(idPrograma)
);
