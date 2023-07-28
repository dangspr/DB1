create database saude_dh;
use saude_dh;
create table pacientes (
paciente_id int not null auto_increment primary key,
paciente_idSaude int,
paciente_nome varchar(50),
paciente_sobrenome varchar(100)
);

create table especialidades(
especialidade_id int not null auto_increment primary key,
especialidade_nome varchar(100)
);

create table medicos(
medico_id int not null auto_increment primary key,
medico_nome varchar(50),
medico_sobrenome varchar(100),
medico_especialidade int,
foreign key (medico_especialidade)
references especialidades (especialidade_id)
);

create table consultas(
consulta_id int not null auto_increment primary key,
paciente_id int,
medico_id int,
data_consulta date,
hora_consulta time,
foreign key (paciente_id) references pacientes (paciente_id),
foreign key (medico_id) references medicos (medico_id)
);
