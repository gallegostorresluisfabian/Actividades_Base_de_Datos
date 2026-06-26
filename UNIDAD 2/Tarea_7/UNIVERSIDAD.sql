CREATE TABLE IF NOT EXISTS `Alumnos` (
	`id_alumno` INT AUTO_INCREMENT UNIQUE,
	`matricula` VARCHAR(20),
	`nombre` VARCHAR(80),
	`apellido_paterno` VARCHAR(80),
	`apellido_materno` VARCHAR(80),
	`carrera` VARCHAR(100),
	`cuatrimestre` INT,
	`correo` VARCHAR(100),
	`telefono` VARCHAR(20),
	PRIMARY KEY(`id_alumno`)
);


CREATE TABLE IF NOT EXISTS `Docentes` (
	`id_docente` INT AUTO_INCREMENT UNIQUE,
	`numero_empleado` VARCHAR(20),
	`nombre` VARCHAR(80),
	`apellido_paterno` VARCHAR(80),
	`apellido_materno` VARCHAR(80),
	`correo` VARCHAR(100),
	`especialidad` VARCHAR(100),
	PRIMARY KEY(`id_docente`)
);


CREATE TABLE IF NOT EXISTS `Materias` (
	`id_materia` INT AUTO_INCREMENT UNIQUE,
	`clave_materia` VARCHAR(20),
	`nombre_materia` VARCHAR(100),
	`creditos` INT,
	`horas_semana` INT,
	PRIMARY KEY(`id_materia`)
);


CREATE TABLE IF NOT EXISTS `Grupos` (
	`id_grupo` INT AUTO_INCREMENT UNIQUE,
	`clave_grupo` VARCHAR(20),
	`periodo` VARCHAR(30),
	`aula` VARCHAR(30),
	`horario` VARCHAR(100),
	`id_docente` INT,
	`id_materia` INT,
	PRIMARY KEY(`id_grupo`)
);


CREATE TABLE IF NOT EXISTS `Inscripciones` (
	`id_inscripcion` INT AUTO_INCREMENT UNIQUE,
	`id_alumno` INT,
	`id_grupo` INT,
	`fecha_inscripcion` DATE,
	`estatus` VARCHAR(30),
	`calificacion_final` DECIMAL(5,2),
	PRIMARY KEY(`id_inscripcion`)
);


ALTER TABLE `Grupos`
ADD FOREIGN KEY(`id_docente`) REFERENCES `Docentes`(`id_docente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Grupos`
ADD FOREIGN KEY(`id_materia`) REFERENCES `Materias`(`id_materia`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Inscripciones`
ADD FOREIGN KEY(`id_alumno`) REFERENCES `Alumnos`(`id_alumno`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Inscripciones`
ADD FOREIGN KEY(`id_grupo`) REFERENCES `Grupos`(`id_grupo`)
ON UPDATE NO ACTION ON DELETE NO ACTION;