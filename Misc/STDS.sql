CREATE TABLE Administrador (
  Id_Administrador INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Id_Administrador)
);

CREATE TABLE Compartilhamento (
  email_Alvo CHAR(50) NOT NULL AUTO_INCREMENT,
  Documento_id_Doc CHAR(20) NOT NULL,
  data_Share DATETIME NULL,
  PRIMARY KEY(email_Alvo),
  INDEX Compartilhamento_FKIndex1(Documento_id_Doc)
);

CREATE TABLE Documento (
  id_Doc CHAR(20) NOT NULL,
  Servidor_Id_Servidor INTEGER UNSIGNED NOT NULL,
  Usuario_Id_Usuario CHAR(20) NOT NULL,
  Upload_data_Upload DATETIME NOT NULL,
  nome_Doc CHAR(20) NOT NULL AUTO_INCREMENT,
  tipo_Doc CHAR(10) NULL,
  tamanho FLOAT NULL,
  PRIMARY KEY(id_Doc),
  INDEX Documento_FKIndex2(Upload_data_Upload),
  INDEX Documento_FKIndex2(Usuario_Id_Usuario),
  INDEX Documento_FKIndex3(Servidor_Id_Servidor)
);

CREATE TABLE Redefinir_Senha (
  link_Verificacao CHAR(50) NOT NULL AUTO_INCREMENT,
  Usuario_Id_Usuario CHAR(20) NOT NULL,
  Senha CHAR(20) NULL,
  Nova Senha CHAR(20) NULL,
  Confirmação Nova Senha CHAR(20) NULL,
  PRIMARY KEY(link_Verificacao),
  INDEX Redefinir_Senha_FKIndex1(Usuario_Id_Usuario)
);

CREATE TABLE Servidor (
  Id_Servidor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Administrador_Id_Administrador INTEGER UNSIGNED NOT NULL,
  espaco_Total FLOAT NULL,
  espaco_Backup FLOAT NULL,
  banco_Dados INTEGER UNSIGNED NULL,
  PRIMARY KEY(Id_Servidor),
  INDEX Servidor_FKIndex1(Administrador_Id_Administrador)
);

CREATE TABLE Upload (
  data_Upload DATETIME NOT NULL,
  Usuario_Id_Usuario CHAR(20) NOT NULL,
  PRIMARY KEY(data_Upload),
  INDEX Upload_FKIndex1(Usuario_Id_Usuario)
);

CREATE TABLE Usuario (
  Id_Usuario CHAR(20) NOT NULL AUTO_INCREMENT,
  nome_Usuario CHAR(20) NULL,
  email CHAR(50) NULL,
  senha CHAR(20) NULL,
  espaco_Max FLOAT() NULL,
  espaco_Livre FLOAT NULL,
  PRIMARY KEY(Id_Usuario)
);


