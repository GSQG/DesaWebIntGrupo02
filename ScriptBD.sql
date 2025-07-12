-- Esto es para crear la BD, aunque en railway lo crea directo, asi que no estamos seguros si lo usaremos
CREATE DATABASE VentaCarros

USE VentaCarros;

Como en railway se crea la bd, solo nos conectamos desde un gestor bd y lanzamos los scripts
-- Estos son los usuarios, en caso usemos
CREATE TABLE Usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  contraseña VARCHAR(255) NOT NULL,
  celular VARCHAR(20),
  rol ENUM('ADMIN','VENTAS','LOGISTICA') NOT NULL DEFAULT 'VENTAS',
  fecha_nacimiento DATE,
  direccion VARCHAR(255),
  comentarios TEXT,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Para los clientes
CREATE TABLE Clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  celular VARCHAR(20),
  direccion TEXT,
  preferencia_contacto ENUM('EMAIL','CELULAR','NINGUNO') DEFAULT 'EMAIL',
  observaciones TEXT,
  fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Marcas de los carros
CREATE TABLE Marcas (
  id_marca INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE,
  pais_origen VARCHAR(100),
  sitio_web VARCHAR(150)
);

-- Los modelos de los carros
CREATE TABLE Modelos (
  id_modelo INT AUTO_INCREMENT PRIMARY KEY,
  id_marca INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  año_lanzamiento INT,
  segmento VARCHAR(50),
  FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Aqui va el main de los carros, es decir la data principal
CREATE TABLE Carros (
  id_carro INT AUTO_INCREMENT PRIMARY KEY,
  id_modelo INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  ano INT NOT NULL,
  color VARCHAR(50),
  precio_lista DECIMAL(12,2) NOT NULL,
  estado ENUM('NUEVO','USADO') NOT NULL DEFAULT 'NUEVO',
  descripcion TEXT,
  kilometraje INT,
  tipo_combustible VARCHAR(50),
  transmision ENUM('AUTOMATICA','MANUAL','OTRA'),
  talla_ruedas VARCHAR(20),
  comentarios TEXT,
  fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Tambien para las imagenenes, tendriamos que ver que el server tenga suficiente espacio para esto...
CREATE TABLE ImagenesCarros (
  id_imagen INT AUTO_INCREMENT PRIMARY KEY,
  id_carro INT NOT NULL,
  url VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255),
  orden TINYINT NOT NULL DEFAULT 1,
  fecha_subida DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_carro) REFERENCES Carros(id_carro)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- Detalles adicionales, en caso usemos mas campos
CREATE TABLE Caracteristicas (
  id_caracteristica INT AUTO_INCREMENT PRIMARY KEY,
  id_carro INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  valor VARCHAR(255) NOT NULL,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_carro) REFERENCES Carros(id_carro)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- Un inventario para lo carros, en caso tengamos una funcion de compra con descuento de invetario en unidades
CREATE TABLE Inventario (
  id_inventario INT AUTO_INCREMENT PRIMARY KEY,
  id_carro INT NOT NULL UNIQUE,
  cantidad INT NOT NULL DEFAULT 0,
  ubicacion VARCHAR(100),
  notas TEXT,
  fecha_ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_carro) REFERENCES Carros(id_carro)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Aqui son las ventas
CREATE TABLE Ventas (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_usuario INT NOT NULL,
  fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(12,2) NOT NULL,
  estado ENUM('PENDIENTE','CONFIRMADA','CANCELADA') NOT NULL DEFAULT 'PENDIENTE',
  comentarios TEXT,
  medio_venta ENUM('WEB','TIENDA','TELEFONO') DEFAULT 'WEB',
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Mas info por cada venta
CREATE TABLE DetallesVenta (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  id_carro INT NOT NULL,
  precio_unitario DECIMAL(12,2) NOT NULL,
  cantidad INT NOT NULL DEFAULT 1,
  subtotal DECIMAL(12,2) GENERATED ALWAYS AS (precio_unitario * cantidad) STORED,
  comentario_linea VARCHAR(255),
  talla VARCHAR(50),
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (id_carro) REFERENCES Carros(id_carro)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Umm, le puse medios de pago, no es una facturacion real, ya que es educativo esto, pero de alli puede tomar los datos tambien
CREATE TABLE MetodosPago (
  id_metodo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE,
  descripcion VARCHAR(255),
  inflacion_applicable BOOLEAN DEFAULT FALSE
);

-- Asi como hay una tabal ventas, debe haber una de pagos
CREATE TABLE Pagos (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  id_metodo INT NOT NULL,
  monto DECIMAL(12,2) NOT NULL,
  referencia_pago VARCHAR(100),
  fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado ENUM('PENDIENTE','COMPLETADO','RECHAZADO') NOT NULL DEFAULT 'PENDIENTE',
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (id_metodo) REFERENCES MetodosPago(id_metodo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Esto lo tengo a modo de log de las ventas realizadas, en caso se quiera hacer un reporte o una pantalla de ello
CREATE TABLE ConfirmacionesVenta (
  id_confirmacion INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  token VARCHAR(100) NOT NULL UNIQUE,
  canal_envio ENUM('EMAIL','SMS','LLAMADA') DEFAULT 'EMAIL',
  fecha_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_confirmacion DATETIME,
  estado ENUM('ENVIADO','CONFIRMADO','EXPIRADO') NOT NULL DEFAULT 'ENVIADO',
  notas_confirmacion TEXT,
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


--Nueva tabla para sedes
CREATE TABLE Sedes (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    horario VARCHAR(50),
    ciudad VARCHAR(50),
    estado VARCHAR(20)
);

--Otra para repuestos
CREATE TABLE Repuestos (
    id_repuesto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    material VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    descripcion TEXT,
    stock INT DEFAULT 0,
    compatibilidad VARCHAR(50)
);

CREATE TABLE RespuestasRapidas (
    idRespuesta INT AUTO_INCREMENT PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    respuesta TEXT NOT NULL
);

-- Esto es solo un trigger para actualziar los inventarios
DELIMITER $$
CREATE TRIGGER trg_actualizar_inventario
AFTER INSERT ON DetallesVenta
FOR EACH ROW
BEGIN
  UPDATE Inventario
    SET cantidad = cantidad - NEW.cantidad,
        fecha_ultima_actualizacion = NOW()
    WHERE id_carro = NEW.id_carro;
END$$
DELIMITER ;

-- Aqui los indices(Ejecutar uno por uno)
CREATE INDEX idx_carros_modelo    ON Carros(id_modelo);
CREATE INDEX idx_carros_estado    ON Carros(estado);
CREATE INDEX idx_inventario_carro ON Inventario(id_carro);
CREATE INDEX idx_ventas_cliente   ON Ventas(id_cliente);
CREATE INDEX idx_ventas_usuario   ON Ventas(id_usuario);
CREATE INDEX idx_pagos_venta      ON Pagos(id_venta);