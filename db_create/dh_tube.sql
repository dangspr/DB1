create database dh_tube;
use dh_tube;

create table avatar(
idAvatar int not null auto_increment primary key,
nome varchar(45),
urlimagem varchar(100)
);

create table pais(
idPais int not null auto_increment primary key,
nome varchar(100)
);

create table usuario(
idUsuario int not null auto_increment primary key,
nome varchar(45),
email varchar(45),
senha varchar(45),
dataNascimento datetime,
cep varchar(45),
Pais_idPais int,
Avatar_idAvatar int,
constraint fk_pais_usuario
foreign key (Pais_idPais) references pais(idPais),
constraint fk_avatar_idavatar
foreign key (Avatar_idAvatar) references avatar(idAvatar)
); 
 
create table canal(
idCanal int not null auto_increment primary key,
nome varchar(45),
descricao text,
dataCriacao datetime,
Usuario_idUsuario int,
constraint fk_usuario_canal
foreign key (Usuario_idUsuario) references usuario(idUsuario)
);

create table playlist (
idPlaylist int not null auto_increment primary key,
nome varchar(45),
dataCriacao datetime,
privado smallint,
Usuario_idUsuario int,
constraint fk_usuario_playList
foreign key (Usuario_idUsuario) references usuario(idUsuario)
);

create table video(
idVideo int not null auto_increment primary key,
Usuario_idUsuario int,
titulo varchar(100),
descricao text,
tamanho double,
nomeArquivo varchar(100),
duracao double,
imagem varchar(100),
qutdReproducoes int,
qtdLikes int,
qtdDislikes int,
privado smallint,
dataPublicacao datetime,
constraint fk_usuario_video
foreign key (Usuario_idUsuario) references usuario(idUsuario)
);

create table playlist_video (
Video_idVideo int,
Playlist_idPlaylist int,
constraint fk_video_playListVideo
foreign key (Video_idVideo) references video(idVideo),
constraint fk_playlist_playlist_video
foreign key (Playlist_idPlaylist) references playlist(idPlaylist)
);

