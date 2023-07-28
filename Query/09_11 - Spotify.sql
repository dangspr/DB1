use projeto_spotify;

SELECT * FROM cancao
WHERE titulo like '%z%' ;

SELECT * FROM cancao
WHERE titulo like '_a%s' ;

SELECT * from playlist;

ALTER TABLE playlist
RENAME column idPlaylist to IdPlaylist;

ALTER TABLE playlist
RENAME column idPlaylist to Id_Playlist,
RENAME column idUsuario to Id_Usuario,
RENAME column titulo to Título,
RENAME column qtdcancoes to Qtd_Cancoes,
RENAME column idestado to Id_Estado,
RENAME column Datacriacao to Data_Criacao,
RENAME column Dataexclusao to Data_Exclusao;

SELECT Id_Playlist as 'Id Playlist', Id_Usuario as 'Id Usuário', Título as 'Título', Qtd_Cancoes as 'Quantidade de Canções', Id_Estado as 'Id Estado', Data_Criacao as 'Data de Criação', Data_Exclusao as 'Data de Exclusão'
FROM playlist;

SELECT * FROM usuario
ORDER BY data_nac DESC
LIMIT 5 OFFSET 10;

SELECT * FROM cancao
ORDER BY qtdreproducao DESC LIMIT 5;

SELECT * FROM album
ORDER BY titulo ASC;

SELECT idAlbum, titulo, imagemcapa FROM album
WHERE imagemcapa IS NULL
order by titulo ASC;

INSERT INTO usuario (idUsuario, Nomeusuario, NomeCompleto, Data_nac, sexo, Cod, senha, Pais_idPais, idTipoUsuario)
VALUES ('20', 'Novo Usuario', 'Elmer Santos', '1991-11-15', 'M', '1001', 'S4321m', '1','1');

SELECT * FROM usuario;


'4', 'MGONZALEZ', 'MARIA PAULA GONZALEZ', '1981-03-27', 'F', '118942', 'GONZALEZ!15', '2', '1'




