CREATE TABLE Estado_Paciente(
id int not null,
nombre varchar(20),
PRIMARY KEY(id)
);

CREATE TABLE Municipio(
id int not null,
nombre varchar(30),
PRIMARY KEY(id)
);

CREATE TABLE Tipo_Id(
id int not null,
nombre varchar(20),
PRIMARY KEY(id)
);

CREATE TABLE Paciente(
id int not null,
nombre varchar(30),
apellido varchar(30),
password varchar(30),
fecha_nto date,
direccion varchar(50),
id_municipio int,
id_tipo_id int,
id_estado int,
PRIMARY KEY(id),
FOREIGN KEY(id_municipio) REFERENCES Municipio(id),
FOREIGN KEY(id_tipo_id) REFERENCES Tipo_Id(id),
FOREIGN KEY(id_estado) REFERENCES Estado_Paciente(id)
)
;

CREATE TABLE Telefono_Paciente(
id  int not null,
telefono  int not null,
PRIMARY KEY(id,telefono),
FOREIGN KEY(id) REFERENCES Paciente(id)
);




CREATE TABLE Sucursal_Hospital_Cita(
id  int not null,
direccion varchar(50),
id_municipio int,
PRIMARY KEY(id),
FOREIGN KEY(id_municipio) REFERENCES Municipio(id)
);
 


CREATE TABLE Telefono_Sucursal_Cita(
id  int not null,
telefono  int not null,
PRIMARY KEY(id,telefono),
FOREIGN KEY(id) REFERENCES Sucursal_Hospital_Cita(id)
);

CREATE TABLE Estado_Cita(
id int not null,
nombre varchar(20),
PRIMARY KEY(id)
);

CREATE TABLE Especialidad_Medico(
id int not null,
nombre varchar(30),
PRIMARY KEY(id)
);

CREATE TABLE Especialidad_Habitacion(
id int not null,
nombre varchar(30),
PRIMARY KEY(id)
);

CREATE TABLE Medico(
id int not null,
nombre varchar(30),
apellido varchar(30),
password varchar(30),
id_especialidad int,
direccion varchar(50),
id_municipio int,
id_tipo_id int,
PRIMARY KEY(id),
FOREIGN KEY(id_municipio) REFERENCES Municipio(id),
FOREIGN KEY(id_tipo_id) REFERENCES Tipo_Id(id),
FOREIGN KEY(id_especialidad) REFERENCES Especialidad_Medico(id)
)
;


CREATE TABLE Telefono_Medico(
id  int not null,
telefono  int not null,
PRIMARY KEY(id,telefono),
FOREIGN KEY(id) REFERENCES Medico(id)
);

CREATE TABLE Cita_Medica(
id int not null,
id_paciente int,
id_shc int,
id_medico int,
valor int,
fecha date,
hora time,
id_estado int,
PRIMARY KEY(id),
FOREIGN KEY(id_paciente) REFERENCES Paciente(id),
FOREIGN KEY(id_shc) REFERENCES Sucursal_Hospital_Cita(id),
FOREIGN KEY(id_medico) REFERENCES Medico(id),
FOREIGN KEY(id_estado) REFERENCES Estado_Cita(id)
)
;



CREATE TABLE Sucursal_Hospital_Hospitalizacion(
id int not null,
id_municipio int,
direccion varchar(50),
PRIMARY KEY(id),
FOREIGN KEY(id_municipio) REFERENCES Municipio(id)

);




CREATE TABLE Telefono_SHH(
id  int not null,
telefono  int not null,
PRIMARY KEY(id,telefono),
FOREIGN KEY(id) REFERENCES Sucursal_Hospital_Hospitalizacion(id)
);


CREATE TABLE Habitacion(
id int not null,
id_shh int,
id_especialidad int,
PRIMARY KEY(id),
FOREIGN KEY(id_especialidad) REFERENCES Especialidad_Habitacion(id),
FOREIGN KEY(id_shh) REFERENCES Sucursal_Hospital_Hospitalizacion(id)
);


CREATE TABLE Enfermera(
id int not null,
nombre varchar(30),
apellido varchar(30),
PRIMARY KEY(id)
);


CREATE TABLE Telefono_Enfermera(
id  int not null,
telefono  int not null,
PRIMARY KEY(id,telefono),
FOREIGN KEY(id) REFERENCES Enfermera(id)
);


CREATE TABLE Estado_Hospitalizacion(
id int not null,
nombre varchar(20),
PRIMARY KEY(id)
);



CREATE TABLE Hospitalizacion(
id int not null,
id_enfermera int,
id_habitacion int,
id_estado int,
valor int,
fecha_entrada date,
fecha_salida date,
hora_entrada time,
hora_salida time,
PRIMARY KEY(id),
FOREIGN KEY(id_enfermera) REFERENCES Enfermera(id),
FOREIGN KEY(id_habitacion) REFERENCES habitacion(id),
FOREIGN KEY(id_estado) REFERENCES Estado_Hospitalizacion(id)
)
;


CREATE TABLE Visitante(
id int not null,
nombre varchar(30),
apellido varchar(30),
PRIMARY KEY(id)
);


CREATE TABLE Telefono_Visitante(
id  int not null,
telefono  int not null,
PRIMARY KEY(id,telefono),
FOREIGN KEY(id) REFERENCES Visitante(id)
);


CREATE TABLE Visita_Ver(
id_visitante  int not null,
id_hospitalizacion  int not null,
fecha date not null,
hora time,
PRIMARY KEY(id_visitante,id_hospitalizacion,fecha),
FOREIGN KEY(id_visitante) REFERENCES Visitante(id),
FOREIGN KEY(id_hospitalizacion) REFERENCES Hospitalizacion(id)
);

CREATE TABLE Cita_Hospitalizacion(
id_hospitalizacion int not null,
id_cita_medica int not null UNIQUE,
PRIMARY KEY(id_hospitalizacion),
FOREIGN KEY(id_hospitalizacion) REFERENCES Hospitalizacion(id),
FOREIGN KEY(id_cita_medica) REFERENCES Cita_Medica(id)
);


drop table Cita_Hospitalizacion;
drop table Visita_Ver;
drop table Telefono_Visitante;
drop table Visitante;
drop table Hospitalizacion;
drop table Estado_Hospitalizacion;
drop table Telefono_Enfermera;
drop table Enfermera;
drop table Habitacion;
drop table Telefono_SHH;
drop table Sucursal_Hospital_Hospitalizacion;
drop table Cita_Medica;
drop table Telefono_Medico;
drop table Medico;
drop table Especialidad_Habitacion;
drop table Especialidad_Medico;
drop table Estado_Cita;
drop table Telefono_Sucursal_Cita;
drop table Sucursal_Hospital_Cita;
drop table Telefono_Paciente;
drop table Paciente;
drop table Tipo_Id;
drop table Municipio;
drop table Estado_Paciente;










