CREATE TABLE IF NOT EXISTS `NivelEducativo` (
	`IdNivelEducativo` INT AUTO_INCREMENT UNIQUE,
	`Nombre` VARCHAR,
	`Descripcion` VARCHAR,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdNivelEducativo`)
);


CREATE TABLE IF NOT EXISTS `Grado` (
	`IdGrado` INT AUTO_INCREMENT UNIQUE,
	`IdNivelEducativo` INT,
	`Nombre` VARCHAR,
	`Orden` INT,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdGrado`)
);


CREATE TABLE IF NOT EXISTS `CicloEscolar` (
	`IdCicloEscolar` INT AUTO_INCREMENT UNIQUE,
	`Nombre` VARCHAR,
	`FechaInicio` DATE,
	`FechaFin` DATE,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdCicloEscolar`)
);


CREATE TABLE IF NOT EXISTS `Grupo` (
	`IdGrupo` INT AUTO_INCREMENT UNIQUE,
	`IdGrado` INT,
	`IdCicloEscolar` INT,
	`Nombre` VARCHAR,
	`Turno` VARCHAR,
	`Capacidad` INT,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdGrupo`)
);


CREATE TABLE IF NOT EXISTS `Alumno` (
	`IdAlumno` INT AUTO_INCREMENT UNIQUE,
	`Matricula` VARCHAR,
	`CURP` VARCHAR,
	`Nombre` VARCHAR,
	`ApellidoPaterno` VARCHAR,
	`ApellidoMaterno` VARCHAR,
	`FechaNacimiento` DATE,
	`Sexo` VARCHAR,
	`Telefono` VARCHAR,
	`Correo` VARCHAR,
	`Direccion` VARCHAR,
	`FechaIngreso` DATE,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdAlumno`)
);


CREATE TABLE IF NOT EXISTS `Tutor` (
	`IdTutor` INT AUTO_INCREMENT UNIQUE,
	`Nombre` VARCHAR,
	`ApellidoPaterno` VARCHAR,
	`ApellidoMaterno` VARCHAR,
	`Telefono` VARCHAR,
	`Correo` VARCHAR,
	`Direccion` VARCHAR,
	`Parentesco` VARCHAR,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdTutor`)
);


CREATE TABLE IF NOT EXISTS `AlumnoTutor` (
	`IdAlumnoTutor` INT AUTO_INCREMENT UNIQUE,
	`IdAlumno` INT,
	`IdTutor` INT,
	`EsPrincipal` BOOLEAN,
	`PuedeRecoger` BOOLEAN,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdAlumnoTutor`)
);


CREATE TABLE IF NOT EXISTS `Docente` (
	`IdDocente` INT AUTO_INCREMENT UNIQUE,
	`NumeroEmpleado` VARCHAR,
	`Nombre` VARCHAR,
	`ApellidoPaterno` VARCHAR,
	`ApellidoMaterno` VARCHAR,
	`Telefono` VARCHAR,
	`Correo` VARCHAR,
	`Especialidad` VARCHAR,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdDocente`)
);


CREATE TABLE IF NOT EXISTS `Materia` (
	`IdMateria` INT AUTO_INCREMENT UNIQUE,
	`Clave` VARCHAR,
	`Nombre` VARCHAR,
	`Descripcion` VARCHAR,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdMateria`)
);


CREATE TABLE IF NOT EXISTS `GradoMateria` (
	`IdGradoMateria` INT AUTO_INCREMENT UNIQUE,
	`IdGrado` INT,
	`IdMateria` INT,
	`HorasSemana` INT,
	`Orden` INT,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdGradoMateria`)
);


CREATE TABLE IF NOT EXISTS `GrupoMateriaDocente` (
	`IdGrupoMateriaDocente` INT AUTO_INCREMENT UNIQUE,
	`IdGrupo` INT,
	`IdMateria` INT,
	`IdDocente` INT,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdGrupoMateriaDocente`)
);


CREATE TABLE IF NOT EXISTS `Inscripcion` (
	`IdInscripcion` INT AUTO_INCREMENT UNIQUE,
	`IdAlumno` INT,
	`IdGrupo` INT,
	`IdCicloEscolar` INT,
	`FechaInscripcion` DATE,
	`Estatus` VARCHAR,
	`Observaciones` TEXT,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdInscripcion`)
);


CREATE TABLE IF NOT EXISTS `PeriodoEvaluacion` (
	`IdPeriodoEvaluacion` INT AUTO_INCREMENT UNIQUE,
	`IdCicloEscolar` INT,
	`Nombre` VARCHAR,
	`FechaInicio` DATE,
	`FechaFin` DATE,
	`Orden` INT,
	`Activo` BOOLEAN,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdPeriodoEvaluacion`)
);


CREATE TABLE IF NOT EXISTS `Calificacion` (
	`IdCalificacion` INT AUTO_INCREMENT UNIQUE,
	`IdInscripcion` INT,
	`IdMateria` INT,
	`IdPeriodoEvaluacion` INT,
	`Calificacion` DECIMAL,
	`Faltas` INT,
	`Observaciones` TEXT,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdCalificacion`)
);


CREATE TABLE IF NOT EXISTS `Asistencia` (
	`IdAsistencia` INT AUTO_INCREMENT UNIQUE,
	`IdInscripcion` INT,
	`Fecha` DATE,
	`Estatus` VARCHAR,
	`Observaciones` TEXT,
	`FechaRegistro` DATETIME,
	`FechaModificacion` DATETIME,
	PRIMARY KEY(`IdAsistencia`)
);


ALTER TABLE `Grado`
ADD FOREIGN KEY(`IdNivelEducativo`) REFERENCES `NivelEducativo`(`IdNivelEducativo`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Grupo`
ADD FOREIGN KEY(`IdGrado`) REFERENCES `Grado`(`IdGrado`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Grupo`
ADD FOREIGN KEY(`IdCicloEscolar`) REFERENCES `CicloEscolar`(`IdCicloEscolar`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `AlumnoTutor`
ADD FOREIGN KEY(`IdAlumno`) REFERENCES `Alumno`(`IdAlumno`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `AlumnoTutor`
ADD FOREIGN KEY(`IdTutor`) REFERENCES `Tutor`(`IdTutor`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GradoMateria`
ADD FOREIGN KEY(`IdGrado`) REFERENCES `Grado`(`IdGrado`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GradoMateria`
ADD FOREIGN KEY(`IdMateria`) REFERENCES `Materia`(`IdMateria`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GrupoMateriaDocente`
ADD FOREIGN KEY(`IdGrupo`) REFERENCES `Grupo`(`IdGrupo`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GrupoMateriaDocente`
ADD FOREIGN KEY(`IdMateria`) REFERENCES `Materia`(`IdMateria`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GrupoMateriaDocente`
ADD FOREIGN KEY(`IdDocente`) REFERENCES `Docente`(`IdDocente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Inscripcion`
ADD FOREIGN KEY(`IdAlumno`) REFERENCES `Alumno`(`IdAlumno`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Inscripcion`
ADD FOREIGN KEY(`IdGrupo`) REFERENCES `Grupo`(`IdGrupo`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Inscripcion`
ADD FOREIGN KEY(`IdCicloEscolar`) REFERENCES `CicloEscolar`(`IdCicloEscolar`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `PeriodoEvaluacion`
ADD FOREIGN KEY(`IdCicloEscolar`) REFERENCES `CicloEscolar`(`IdCicloEscolar`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Calificacion`
ADD FOREIGN KEY(`IdInscripcion`) REFERENCES `Inscripcion`(`IdInscripcion`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Calificacion`
ADD FOREIGN KEY(`IdMateria`) REFERENCES `Materia`(`IdMateria`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Calificacion`
ADD FOREIGN KEY(`IdPeriodoEvaluacion`) REFERENCES `PeriodoEvaluacion`(`IdPeriodoEvaluacion`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Asistencia`
ADD FOREIGN KEY(`IdInscripcion`) REFERENCES `Inscripcion`(`IdInscripcion`)
ON UPDATE NO ACTION ON DELETE NO ACTION;