USE master;
IF DB_ID('Cinema') IS NOT NULL
   DROP DATABASE Cinema;
CREATE DATABASE Cinema;
GO
USE Cinema;
---------------------------------------------------------------------------------------------------------
CREATE TABLE Distribuidora(
       Id_Distribuidora         INTEGER         IDENTITY        PRIMARY KEY,    
       Nome                     VARCHAR(50)     NOT NULL
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE Genero (
       Id_Genero                INTEGER         IDENTITY        PRIMARY KEY,
       Descricao                VARCHAR(30)     NOT NULL
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE Titulo (
       Id_Titulo                INTEGER         IDENTITY        PRIMARY KEY,
       Nome                     VARCHAR(50)     NOT NULL,    
       NomeOriginal             VARCHAR(50)     NOT NULL,   
       AnoProducao              INTEGER         NOT NULL,    
       Id_Distribuidora         INTEGER         NOT NULL        REFERENCES Distribuidora(Id_Distribuidora),   
       Id_Genero                INTEGER         NOT NULL        REFERENCES Genero(Id_Genero),
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE Sala (
       Id_Sala                  INTEGER         IDENTITY        PRIMARY KEY,
       Nome                     VARCHAR(20)     NOT NULL,    
       Situacao                 CHAR(1)         NOT NULL        CHECK(Situacao IN ('D','I'))
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE Assento (
       Id_Assento               INTEGER         IDENTITY        PRIMARY KEY,
       Cadeira                  VARCHAR(5)      NOT NULL,
       Situacao                 CHAR(1)         NOT NULL        CHECK(Situacao IN ('D','I')),
       Id_Sala                  INTEGER         NOT NULL        REFERENCES Sala(Id_Sala)
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE Sessao (    
       Id_Sessao                INTEGER         IDENTITY        PRIMARY KEY,    
       HoraInicio               TIME(0)         NOT NULL,  
       HoraTermino              TIME(0)         NOT NULL,
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE Ingresso (
       Id_Ingresso              INTEGER         IDENTITY        PRIMARY KEY, 
       Id_Titulo                INTEGER         NOT NULL        REFERENCES Titulo (Id_Titulo),    
       Id_Sessao                INTEGER         NOT NULL        REFERENCES Sessao (Id_Sessao),    
       Id_Assento               INTEGER         NOT NULL        REFERENCES Assento(Id_Assento),
	   Situacao                 CHAR(1)         NOT NULL        CHECK(Situacao IN ('D','V')) 
);
---------------------------------------------------------------------------------------------------------


insert into Distribuidora (Nome) values
	('Sony Pictures'),
	('Paris Filmes'),
	('Universal Pictures Brasil'),
	('Warner Bros');

insert into Genero (Descricao) values
	('Ação'),
	('Aventura'),
	('Terror'),
	('Épico'),
	('Animação');

insert into Sala (Nome, Situacao) values
	('Sala 1', 'D'),
	('Sala 2', 'I'),
	('Sala 3', 'D'),
	('Sala 4', 'I'),
	('Sala 5', 'D');

insert into Titulo (Nome, NomeOriginal, AnoProducao, Id_Distribuidora, Id_Genero) values
	('Contra o Mundo', 'Boy Kills World', 2024, 2, 1),
	('Ghostbusrters: Apocalipse do Gelo', 'Ghostbusrters: Frozen Empire', 2024, 1, 2),
	('Abigail', 'Abigail', 2024, 3, 3),
	('Jorge da Capadócia', 'Jorge da Capadócia', 2024, 2, 4),
	('Garfield - Fora de Casa', 'The Garfield Movie', 2024, 1, 5),
	('Godzilla X Kong: O novo império', 'Godzilla X Kong: The New Empire', 2024, 4, 1);

insert into Sessao (HoraInicio, HoraTermino) values
	('18:30', '20:11'),
	('21:10', '22:51'),
	('15:20', '17:14'),
	('18:00', '19:54'),
	('20:50', '22:44'),
	('18:40', '18:40'),
	('21:30', '21:30');



insert into Assento(Cadeira, Situacao, Id_Sala) values
	(1, 'D', 1),
	(2, 'D', 1),
	(3, 'I', 1),
	(4, 'D', 1),
	(5, 'D', 1),
	(6, 'I', 1),
	(7, 'D', 1),
	(8, 'D', 1),
	(9, 'I', 1),
	(10, 'D', 1),
	(1, 'D', 2),
	(2, 'D', 2),
	(3, 'D', 2),
	(4, 'D', 2),
	(5, 'D', 2),
	(1, 'I', 3),
	(2, 'D', 3),
	(3, 'I', 3),
	(4, 'D', 3),
	(5, 'I', 3),
	(6, 'D', 3),
	(7, 'I', 3),
	(8, 'D', 3),
	(9, 'I', 3),
	(10, 'D', 3),
	(1, 'D', 4),
	(2, 'D', 4),
	(3, 'D', 4),
	(4, 'D', 4),
	(5, 'D', 4),
	(6, 'D', 4),
	(1, 'D', 5),
	(2, 'D', 5),
	(3, 'D', 5),
	(4, 'D', 5),
	(5, 'I', 5),
	(6, 'D', 5),
	(7, 'D', 5),
	(8, 'D', 5);

insert into Ingresso (Id_Titulo, Id_Sessao, Id_Assento, Situacao) values
	(1, 1, 1, 'D'),
	(1, 1, 2, 'V'),
	(1, 1, 4, 'D'),
	(1, 1, 5, 'V'),
	(1, 1, 7, 'D'),
	(1, 1, 8, 'V'),
	(1, 1, 10, 'D'),
	(1, 2, 1, 'V'),
	(1, 2, 2, 'D'),
	(1, 2, 4, 'V'),
	(1, 2, 5, 'D'),
	(1, 2, 7, 'V'),
	(1, 2, 8, 'D'),
	(1, 2, 10, 'V'),
	(3, 5, 11, 'D'),
	(3, 5, 12, 'V'),
	(3, 5, 13, 'D'),
	(3, 5, 14, 'V'),
	(3, 5, 15, 'D'),
	(5, 1, 26, 'V'),
	(5, 1, 27, 'D'),
	(5, 1, 28, 'V'),
	(5, 1, 29, 'D'),
	(5, 1, 30, 'V'),
	(5, 1, 31, 'D');

