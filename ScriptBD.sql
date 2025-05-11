USE b8ro93vd0ut4z7efwbni;

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




    INSERT INTO Usuarios (nombres, apellidos, email, contraseña, celular, rol, fecha_nacimiento, direccion, comentarios)
    VALUES
        ('Giovanni', 'Quispe', 'giovanni.quispe@cursoDWI.com', 'clave123', '999999999', 'ADMIN', '1998-07-13', 'AV MI CASA', 'Usuario administrador principal'),
        ('Luis', 'Perez', 'luis.perez@cursoDWI.com', 'clave456', '988888888', 'VENTAS', '1992-05-10', 'Av. Los Laureles 456', 'Vendedor del área de carros'),
        ('Ana', 'Gomez', 'ana.gomez@cursoDWI.com', 'clave789', '977777777', 'LOGISTICA', '1985-11-23', 'Calle de la Rosa 789', 'Encargada de logística'),
        ('Carlos', 'Martínez', 'carlos.martinez@cursoDWI.com', 'clave012', '966666666', 'VENTAS', '1990-02-19', 'Calle Luna 101', 'Vendedor de carros deportivos'),
        ('Maria', 'Diaz', 'maria.diaz@cursoDWI.com', 'clave345', '955555555', 'LOGISTICA', '1993-09-05', 'Calle Sol 202', 'Logística y manejo de inventario');

    INSERT INTO Marcas (nombre, pais_origen, sitio_web)
    VALUES
        ('AstroCars', 'Alemania', 'https://www.astrocars.de'),
        ('NovaDrive', 'Japón', 'https://www.novadrive.jp'),
        ('Titan Motors', 'EE.UU.', 'https://www.titanmotors.com');

    INSERT INTO Modelos (id_marca, nombre, descripcion, año_lanzamiento, segmento)
    VALUES
        (1, 'Meteor X', 'Modelo deportivo con gran aceleración', 2021, 'Deportivo'),
        (2, 'Zenith Eco', 'Modelo híbrido eficiente para ciudad', 2022, 'Sedán'),
        (3, 'Colossus TRX', 'SUV familiar con gran espacio interior', 2023, 'SUV');


    INSERT INTO Carros (id_modelo, ano, color, precio_lista, estado, descripcion, kilometraje, tipo_combustible, transmision, talla_ruedas, comentarios)
    VALUES
        (1, 2023, 'Rojo', 35000.00, 'NUEVO', 'Versión premium con tecnología de punta', 0, 'Gasolina', 'AUTOMATICA', '18"', 'Disponible para entrega inmediata'),
        (2, 2022, 'Azul', 28000.00, 'NUEVO', 'Diseñado para ciudad y consumo eficiente', 0, 'Híbrido', 'AUTOMATICA', '17"', ''),
        (3, 2021, 'Negro', 45000.00, 'USADO', 'Gran capacidad de carga y espacio', 15000, 'Diesel', 'MANUAL', '20"', 'Vehículo de prueba');


