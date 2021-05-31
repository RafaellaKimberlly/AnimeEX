create database AnimeEX;

use animeEX;

create table usuarios(
idUsuario int primary key auto_increment,
nomeUsuario varchar(45),
email varchar(30),
senha varchar(8)
)auto_increment = 1;

insert into usuarios values(null,'Rafaella','rafaella@teste.com','12345678'),
(null,'Washington','washington@teste.com','66778899'),
(null,'Nikolas','nikolas@teste.com','12332211'),
(null,'Jonas','jonas@teste.com','11115678'),
(null,'Rafael','rafael@teste.com','12345699'),
(null,'Stefanie','stefanie@teste.com','12345888');


create table comentarios(
idComentario int primary key auto_increment,
resumo varchar(15),
descricao_comentario varchar(45),
data_comentario date,
FK_usuario int,
foreign key (FK_usuario) references usuarios(idusuario)
)auto_increment = 100;

insert into comentarios values(null,'One','Esse ultimo episodio foi demais','2021-05-05',1),
(null,'Ano','chorei muito, porque ela morreu','2021-12-25',2),
(null,'Sword','Cade a asuna nos episodios?','2021-03-30',3),
(null,'Naruto','Finalmente ele alcançou seu sonho.','2021-06-12',4),
(null,'Death','sou team kira e já era.','2021-11-01',5),
(null,'high','Esse anime ta muito heitai.','2021-02-18',6);


create table animes(
idAnimes int primary key auto_increment,
nomeAnime varchar(45),
descricao_Anime varchar(45),
tipo varchar(15),
check (tipo = 'Shounen' or tipo = 'Shoujo' or tipo = 'Magia' or tipo = 'Terror'),
quantidade int
) auto_increment = 1000;

insert into animes values(null,'One Piece','é um garoto que é de borracha','shounen',98),
(null,'Naruto','é a história de um ninja que quer ser hokage.','shounen',70),
(null,'Death note','historia sobre um livro que mata pessoas','Terror',38),
(null,'sword art online','Um cara que fica preso em um jogo','Magia',45),
(null,'high school of the death','sobre zumbis e meninas bonitinhas','Terror',18),
(null,'Ano Hana','anime sobre um menino que vê o fantasma.','Shoujo',15);


create table acessos(
FK_usuario int,
foreign key (FK_usuario) references usuarios(idUsuario),
FK_Animes int,
foreign key (FK_animes) references animes(idAnimes),
DataHora_acesso datetime default current_timestamp,
quant_episodio double
);

insert into acessos(fk_usuario,fk_animes,quant_episodio) values(1,1000,1024),
(2,1000,1024),
(3,1001,703),
(4,1002,50),
(5,1003,45),
(6,1004,12);

select * from usuarios;
select * from comentarios;
select * from animes;
select * from acessos;

select * from usuarios join comentarios on idusuario = fk_usuario;
select usuarios.nomeUsuario,comentarios.descricao_comentario,comentarios.data_comentario from usuarios join comentarios on idusuario = fk_usuario;

select usuarios.nomeUsuario,animes.nomeAnime,acessos.DataHora_acesso from usuarios join acessos on idusuario = fk_usuario
join animes on idAnimes = fk_animes;

select usuarios.nomeUsuario,animes.nomeAnime,acessos.DataHora_acesso from usuarios join acessos on idusuario = fk_usuario
join animes on idAnimes = fk_animes where nomeAnime = 'One piece';

select usuarios.nomeUsuario,acessos.DataHora_acesso from usuarios join acessos on idusuario = fk_usuario;

select usuarios.nomeUsuario,acessos.DataHora_acesso from usuarios join acessos on idusuario = fk_usuario;

select sum(quant_episodio) from acessos group by DataHora_acesso;

select max(quant_episodio) from acessos group by FK_usuario;

select min(quant_episodio) from acessos group by DataHora_acesso;

select count(quant_episodio) from acessos group by DataHora_acesso;

select truncate(sum(quant_episodio),1) from acessos group by DataHora_acesso;

select round(avg(quant_episodio),1) from acessos group by DataHora_acesso;

select * from usuarios where idusuario in (select FK_usuario from comentarios);
select * from usuarios where idusuario in (select FK_usuario from comentarios) and idusuario in (select FK_usuario from acessos);
select * from usuarios where idusuario in (select FK_usuario from comentarios) and idusuario not in (select FK_usuario from acessos);

select * from animes where idAnimes in (select FK_animes from acessos);

drop database animeEX;