CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_alta DATE,
    scoring_crediticio FLOAT,
    limite_disponible FLOAT
);
CREATE TABLE Prestamos (
    id_prestamo INT PRIMARY KEY,
    id_usuario INT,
    monto_solicitado FLOAT,
    cantidad_cuotas INT,
    tasa_interes FLOAT,
    estado VARCHAR(20), -- 'Activo', 'Pagado' o en 'Mora'
    fecha_solicitud DATE,
    fecha_desembolso DATE,  
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)

);
CREATE TABLE Cuotas (
    id_cuota INT PRIMARY KEY,
    id_prestamo INT,
    nro_cuota INT,
    fecha_vencimiento DATE,
    monto_cuota FLOAT,
    estado_pago VARCHAR(20), -- 'Pagado', 'Pendiente', 'Mora'
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo)
);
select distinct id_usuario
from usuarios
ORDER BY id_usuario ASC; 

-- Esto vacía todas las tablas respetando las relaciones entre ellas
-- TRUNCATE TABLE cuotas, prestamos, usuarios CASCADE;