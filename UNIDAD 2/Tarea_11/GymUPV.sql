CREATE DATABASE GymUPV;
USE GymUPV;
CREATE TABLE Membresias (
    id_membresia INT PRIMARY KEY AUTO_INCREMENT,
    nombre_membresia VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    costo DECIMAL(10,2) NOT NULL,
    duracion_dias INT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Alumnos (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellido_paterno VARCHAR(80) NOT NULL,
    apellido_materno VARCHAR(80),
    fecha_nacimiento DATE,
    sexo CHAR(1),
    carrera VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    id_membresia INT,
    FOREIGN KEY (id_membresia) REFERENCES Membresias(id_membresia)
);

CREATE TABLE Entrenadores (
    id_entrenador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    apellido_paterno VARCHAR(80) NOT NULL,
    apellido_materno VARCHAR(80),
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Clases (
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    nombre_clase VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    horario VARCHAR(100),
    capacidad INT,
    id_entrenador INT,
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

CREATE TABLE ClaseAlumnos (
    id_clase_alumno INT PRIMARY KEY AUTO_INCREMENT,
    id_clase INT NOT NULL,
    id_alumno INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estatus VARCHAR(30) DEFAULT 'Activa',
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno)
);

CREATE TABLE Rutinas (
    id_rutina INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_entrenador INT NOT NULL,
    nombre_rutina VARCHAR(100) NOT NULL,
    objetivo VARCHAR(200),
    fecha_asignacion DATE,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

CREATE TABLE Ejercicios (
    id_ejercicio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_ejercicio VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    grupo_muscular VARCHAR(100)
);

CREATE TABLE RutinaEjercicios (
    id_rutina_ejercicio INT PRIMARY KEY AUTO_INCREMENT,
    id_rutina INT NOT NULL,
    id_ejercicio INT NOT NULL,
    series INT,
    repeticiones INT,
    descanso_segundos INT,
    FOREIGN KEY (id_rutina) REFERENCES Rutinas(id_rutina),
    FOREIGN KEY (id_ejercicio) REFERENCES Ejercicios(id_ejercicio)
);

CREATE TABLE EquiposGym (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    fecha_compra DATE,
    estado VARCHAR(50),
    ubicacion VARCHAR(100),
    mantenimiento_requerido BOOLEAN DEFAULT FALSE
);

CREATE TABLE EjercicioEquipos (
    id_ejercicio_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_ejercicio INT NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_ejercicio) REFERENCES Ejercicios(id_ejercicio),
    FOREIGN KEY (id_equipo) REFERENCES EquiposGym(id_equipo)
);

CREATE TABLE Asistencias (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    fecha_entrada DATETIME NOT NULL,
    fecha_salida DATETIME,
    observaciones VARCHAR(200),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno)
);

CREATE TABLE Pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50),
    referencia VARCHAR(100),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno)
);