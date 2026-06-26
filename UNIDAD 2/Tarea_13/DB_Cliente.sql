CREATE TABLE IF NOT EXISTS `Clientes` (
	`id_cliente` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100),
	`telefono` VARCHAR(15),
	`correo` VARCHAR(100),
	PRIMARY KEY(`id_cliente`)
);


CREATE TABLE IF NOT EXISTS `Vendedores` (
	`id_vendedor` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100),
	`telefono` VARCHAR(15),
	`correo` VARCHAR(100),
	`id_sucursal` INT,
	PRIMARY KEY(`id_vendedor`)
);


CREATE TABLE IF NOT EXISTS `Sucursales` (
	`id_sucursal` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100),
	`direccion` VARCHAR(255),
	`telefono` VARCHAR(15),
	PRIMARY KEY(`id_sucursal`)
);


CREATE TABLE IF NOT EXISTS `Categorias` (
	`id_categoria` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100),
	`descripcion` VARCHAR(255),
	PRIMARY KEY(`id_categoria`)
);


CREATE TABLE IF NOT EXISTS `Proveedores` (
	`id_proveedor` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100),
	`telefono` VARCHAR(15),
	`correo` VARCHAR(100),
	PRIMARY KEY(`id_proveedor`)
);


CREATE TABLE IF NOT EXISTS `Productos` (
	`id_producto` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(100),
	`descripcion` VARCHAR(255),
	`precio` DECIMAL(10,2),
	`stock` INT,
	`id_categoria` INT,
	`id_proveedor` INT,
	PRIMARY KEY(`id_producto`)
);


CREATE TABLE IF NOT EXISTS `FormasPago` (
	`id_forma_pago` INT AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(50),
	`descripcion` VARCHAR(255),
	PRIMARY KEY(`id_forma_pago`)
);


CREATE TABLE IF NOT EXISTS `Ventas` (
	`id_venta` INT AUTO_INCREMENT UNIQUE,
	`fecha` DATE,
	`id_cliente` INT,
	`id_vendedor` INT,
	`id_forma_pago` INT,
	PRIMARY KEY(`id_venta`)
);


CREATE TABLE IF NOT EXISTS `DetalleVenta` (
	`id_detalle` INT AUTO_INCREMENT UNIQUE,
	`id_venta` INT,
	`id_producto` INT,
	`cantidad` INT,
	`precio_unitario` DECIMAL(10,2),
	`subtotal` DECIMAL(10,2),
	PRIMARY KEY(`id_detalle`)
);


CREATE TABLE IF NOT EXISTS `InventarioMovimientos` (
	`id_movimiento` INT AUTO_INCREMENT UNIQUE,
	`id_producto` INT,
	`tipo_movimiento` VARCHAR(20),
	`cantidad` INT,
	`fecha` DATETIME,
	`observaciones` VARCHAR(255),
	PRIMARY KEY(`id_movimiento`)
);


ALTER TABLE `Ventas`
ADD FOREIGN KEY(`id_cliente`) REFERENCES `Clientes`(`id_cliente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Ventas`
ADD FOREIGN KEY(`id_vendedor`) REFERENCES `Vendedores`(`id_vendedor`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Ventas`
ADD FOREIGN KEY(`id_forma_pago`) REFERENCES `FormasPago`(`id_forma_pago`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `DetalleVenta`
ADD FOREIGN KEY(`id_venta`) REFERENCES `Ventas`(`id_venta`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `DetalleVenta`
ADD FOREIGN KEY(`id_producto`) REFERENCES `Productos`(`id_producto`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Productos`
ADD FOREIGN KEY(`id_categoria`) REFERENCES `Categorias`(`id_categoria`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Productos`
ADD FOREIGN KEY(`id_proveedor`) REFERENCES `Proveedores`(`id_proveedor`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Vendedores`
ADD FOREIGN KEY(`id_sucursal`) REFERENCES `Sucursales`(`id_sucursal`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `InventarioMovimientos`
ADD FOREIGN KEY(`id_producto`) REFERENCES `Productos`(`id_producto`)
ON UPDATE NO ACTION ON DELETE NO ACTION;