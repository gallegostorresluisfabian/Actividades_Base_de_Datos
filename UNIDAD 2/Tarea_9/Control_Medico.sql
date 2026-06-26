CREATE TABLE IF NOT EXISTS `Pacientes` (
	`id_paciente` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100) NOT NULL,
	`apellido_paterno` VARCHAR(100) NOT NULL,
	`apellido_materno` VARCHAR(100),
	`fecha_nacimiento` DATE,
	`sexo` VARCHAR(20),
	`telefono` VARCHAR(20),
	`correo` VARCHAR(100),
	`direccion` VARCHAR(200),
	PRIMARY KEY(`id_paciente`)
);


CREATE TABLE IF NOT EXISTS `Especialidades` (
	`id_especialidad` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100) NOT NULL,
	`descripcion` VARCHAR(200),
	PRIMARY KEY(`id_especialidad`)
);


CREATE TABLE IF NOT EXISTS `Medicos` (
	`id_medico` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100) NOT NULL,
	`apellido_paterno` VARCHAR(100) NOT NULL,
	`apellido_materno` VARCHAR(100),
	`telefono` VARCHAR(20),
	`correo` VARCHAR(100),
	`id_especialidad` INT NOT NULL,
	PRIMARY KEY(`id_medico`)
);


CREATE TABLE IF NOT EXISTS `Citas` (
	`id_cita` INT AUTO_INCREMENT UNIQUE,
	`fecha` DATE NOT NULL,
	`hora` TIME NOT NULL,
	`motivo_consulta` VARCHAR(200),
	`estado` VARCHAR(50),
	`id_paciente` INT NOT NULL,
	`id_medico` INT NOT NULL,
	PRIMARY KEY(`id_cita`)
);


CREATE TABLE IF NOT EXISTS `Diagnosticos` (
	`id_diagnostico` INT AUTO_INCREMENT UNIQUE,
	`descripcion` TEXT NOT NULL,
	`fecha_diagnostico` DATE,
	`id_cita` INT NOT NULL,
	PRIMARY KEY(`id_diagnostico`)
);


CREATE TABLE IF NOT EXISTS `Tratamientos` (
	`id_tratamiento` INT AUTO_INCREMENT UNIQUE,
	`descripcion` TEXT NOT NULL,
	`fecha_inicio` DATE,
	`fecha_fin` DATE,
	`id_diagnostico` INT NOT NULL,
	PRIMARY KEY(`id_tratamiento`)
);


CREATE TABLE IF NOT EXISTS `Medicamentos` (
	`id_medicamento` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100) NOT NULL,
	`descripcion` VARCHAR(200),
	`dosis` VARCHAR(100),
	PRIMARY KEY(`id_medicamento`)
);


CREATE TABLE IF NOT EXISTS `Recetas` (
	`id_receta` INT AUTO_INCREMENT UNIQUE,
	`fecha_receta` DATE NOT NULL,
	`indicaciones` TEXT,
	`id_cita` INT NOT NULL,
	PRIMARY KEY(`id_receta`)
);


CREATE TABLE IF NOT EXISTS `Receta_Medicamento` (
	`id_receta` INT NOT NULL,
	`id_medicamento` INT NOT NULL,
	`cantidad` VARCHAR(50),
	`frecuencia` VARCHAR(100)
);


CREATE INDEX `Receta_Medicamento_index_0`
ON `Receta_Medicamento` (`id_receta`, `id_medicamento`);
CREATE TABLE IF NOT EXISTS `Signos_Vitales` (
	`id_signo` INT AUTO_INCREMENT UNIQUE,
	`fecha_registro` DATETIME NOT NULL,
	`peso` DECIMAL(5,2),
	`estatura` DECIMAL(5,2),
	`temperatura` DECIMAL(4,2),
	`presion_arterial` VARCHAR(20),
	`frecuencia_cardiaca` INT,
	`id_paciente` INT NOT NULL,
	PRIMARY KEY(`id_signo`)
);


ALTER TABLE `Medicos`
ADD FOREIGN KEY(`id_especialidad`) REFERENCES `Especialidades`(`id_especialidad`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Citas`
ADD FOREIGN KEY(`id_paciente`) REFERENCES `Pacientes`(`id_paciente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Citas`
ADD FOREIGN KEY(`id_medico`) REFERENCES `Medicos`(`id_medico`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Diagnosticos`
ADD FOREIGN KEY(`id_cita`) REFERENCES `Citas`(`id_cita`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Tratamientos`
ADD FOREIGN KEY(`id_diagnostico`) REFERENCES `Diagnosticos`(`id_diagnostico`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Recetas`
ADD FOREIGN KEY(`id_cita`) REFERENCES `Citas`(`id_cita`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Receta_Medicamento`
ADD FOREIGN KEY(`id_receta`) REFERENCES `Recetas`(`id_receta`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Receta_Medicamento`
ADD FOREIGN KEY(`id_medicamento`) REFERENCES `Medicamentos`(`id_medicamento`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Signos_Vitales`
ADD FOREIGN KEY(`id_paciente`) REFERENCES `Pacientes`(`id_paciente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;