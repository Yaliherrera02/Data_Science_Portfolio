/* =============================================================================
PROYECTO: ANÁLISIS DE CARTERA Y RIESGO CREDITICIO
AUTORA: ALISON HERRERA
FECHA DE CORTE: 21 DE MARZO DE 2026
DESCRIPCIÓN: Script integral de creación, limpieza y análisis de KPIs 
financieros para la gestión de morosidad y scoring.
=============================================================================
*/
-- 1. DEFINICIÓN DE ESTRUCTURA 
-- =============================================================================
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
-- CARGA DE DATOS: TABLA USUARIOS
INSERT INTO Usuarios (id_usuario, nombre, apellido, fecha_alta, scoring_crediticio, limite_disponible) VALUES
(1, 'Juan ', 'Perez', '2025-01-05', 720, 730000.00),
(2, 'Martina', 'Alvarez', '2025-01-19', 820, 700000.00),
(3, 'Rocio', 'Sanchez', '2025-02-11', 800, 650000.00),
(4, 'Francisco', 'Gomez', '2025-02-18', 970, 1400000.00),
(5, 'Martin', 'Lopez', '2025-03-06', 850, 400000.00),
(6, 'Ezequiel', 'Rodriguez', '2025-04-24', 780, 700000.00),
(7, 'Ana', 'Diaz', '2025-05-16', 840, 500000.00),
(8, 'Lara', 'Grecco', '2025-05-27', 740, 580000.00),
(9, 'Marcos', 'Ruiz', '2025-06-01', 960, 1300000.00),
(10, 'Ramiro', 'Martinez', '2025-06-14', 950, 750000.00),
(11, 'Melanie', 'Dominguez', '2025-07-13', 600, 400000.00),
(12, 'Diego', 'Acosta', '2025-07-27', 730, 530000.00),
(13, 'Marcela', 'Velazquez', '2025-08-13', 660, 480000.00),
(14, 'Juana', 'Torres', '2025-08-21', 790, 450000.00),
(15, 'Maria', 'Gimenez', '2025-08-30', 690, 350000.00),
(16, 'Lautaro', 'Gonzalez', '2025-09-21', 640, 600000.00),
(17, 'Yanina', 'Vasquez', '2025-09-22', 750, 520000.00),
(18, 'Nicolas', 'Garcia', '2025-09-26', 760, 620000.00),
(19, 'Tamara', 'Luna', '2025-10-04', 410, 170000.00),
(20, 'Dario', 'Mansilla', '2025-10-24', 630, 390000.00),
(21, 'Abigail', 'Benitez', '2025-11-11', 280, 170000.00),
(22, 'Felipe', 'Carrizo', '2025-11-28', 490, 400000.00),
(23, 'Ariana', 'Flores', '2025-12-17', 280, 200000.00),
(24, 'Catalina', 'Godoy', '2025-12-29', 510, 180000.00),
(25, 'Carlos', 'Rojas', '2026-01-12', 420, 250000.00),
(26, 'Joaquin', 'Ponce', '2026-01-30', 580, 730000.00),
(27, 'Bruno', 'Ledesma', '2026-02-19', 770, 660000.00),
(28, 'Brenda', 'Quiroga', '2026-02-26', 550, 100000.00),
(29, 'Dante', 'Sosa', '2026-03-01', 880, 800000.00),
(30, 'Sebastian', 'Acosta', '2026-03-20', 600, 500000.00);

-- CARGA DE DATOS: TABLA PRESTAMOS
INSERT INTO Prestamos (id_prestamo, id_usuario, monto_solicitado, cantidad_cuotas, tasa_interes, estado, fecha_solicitud, fecha_desembolso) VALUES
(101, 1, 600000.00, 3, 0.07, 'Finalizado', '2025-01-05', '2025-01-06'),
(102, 2, 700000.00, 6, 0.05, 'Finalizado', '2025-01-20', '2025-01-21'),
(103, 3, 450000.00, 3, 0.05, 'Finalizado', '2025-02-11', '2025-02-12'),
(104, 4, 1200000.00, 3, 0.04, 'Finalizado', '2025-02-18', '2025-02-19'),
(105, 5, 350000.00, 6, 0.05, 'Finalizado', '2025-03-07', '2025-03-08'),
(106, 6, 400000.00, 6, 0.07, 'Finalizado', '2025-04-24', '2025-04-25'),
(107, 7, 500000.00, 3, 0.05, 'Finalizado', '2025-05-17', '2025-05-18'),
(108, 8, 550000.00, 12, 0.07, 'Activo', '2025-05-28', '2025-05-29'),
(109, 9, 1000000.00, 3, 0.04, 'Finalizado', '2025-06-01', '2025-06-02'),
(110, 10, 600000.00, 6, 0.04, 'Finalizado', '2025-06-14', '2025-06-15'),
(111, 11, 200000.00, 3, 0.08, 'Finalizado', '2025-07-13', '2025-07-14'),
(112, 12, 520000.00, 12, 0.07, 'Activo', '2025-07-28', '2025-07-29'),
(113, 13, 400000.00, 6, 0.08, 'Finalizado', '2025-08-13', '2025-08-14'),
(114, 14, 400000.00, 10, 0.07, 'Finalizado', '2025-08-21', '2025-08-22'),
(115, 15, 350000.00, 3, 0.08, 'Finalizado', '2025-08-31', '2025-09-01'),
(116, 16, 550000.00, 18, 0.08, 'En Mora', '2025-09-22', '2025-09-23'),
(117, 17, 500000.00, 12, 0.07, 'Activo', '2025-09-22', '2025-09-23'),
(118, 18, 600000.00, 18, 0.07, 'Activo', '2025-09-26', '2025-09-27'),
(119, 19, 600000.00, 3, 0.12, 'Finalizado', '2025-10-04', '2025-10-06'),
(120, 20, 350000.00, 6, 0.08, 'Activo', '2025-10-24', '2025-10-25'),
(121, 21, 150000.00, 6, 0.14, 'En Mora', '2025-11-12', '2025-11-14'),
(122, 22, 350000.00, 12, 0.12, 'En Mora', '2025-11-28', '2025-12-01'),
(123, 23, 200000.00, 6, 0.12, 'En Mora', '2025-12-19', '2025-12-21'),
(124, 24, 150000.00, 3, 0.09, 'En Mora', '2025-12-29', '2025-12-30'),
(125, 25, 250000.00, 3, 0.14, 'En Mora', '2026-01-12', '2026-01-14'),
(126, 26, 700000.00, 10, 0.09, 'Activo', '2026-01-30', '2026-01-31'),
(127, 27, 650000.00, 10, 0.07, 'Activo', '2026-02-20', '2026-02-21'),
(128, 28, 100000.00, 3, 0.09, 'Activo', '2026-02-26', '2026-02-27'),
(129, 29, 700000.00, 6, 0.05, 'Activo', '2026-03-02', '2026-03-03'),
(130, 30, 450000.00, 3, 0.09, 'Activo', '2026-03-20', '2026-03-21');

-- CARGA DE DATOS: TABLA CUOTAS
INSERT INTO Cuotas (id_cuota, id_prestamo, nro_cuota, fecha_vencimiento, monto_cuota, estado_pago) VALUES
(1001, 101, 1, '2025-02-06', 214000.00, 'pagado'),
(1002, 101, 2, '2025-03-06', 214000.00, 'pagado'),
(1003, 101, 3, '2025-04-06', 214000.00, 'pagado'),
(1004, 102, 1, '2025-02-21', 122500.00, 'pagado'),
(1005, 102, 2, '2025-03-21', 122500.00, 'pagado'),
(1006, 102, 3, '2025-04-21', 122500.00, 'pagado'),
(1007, 102, 4, '2025-05-21', 122500.00, 'pagado'),
(1008, 102, 5, '2025-06-21', 122500.00, 'pagado'),
(1009, 102, 6, '2025-07-21', 122500.00, 'pagado'),
(1010, 103, 1, '2025-03-12', 157500.00, 'pagado'),
(1011, 103, 2, '2025-04-12', 157500.00, 'pagado'),
(1012, 103, 3, '2025-05-12', 157500.00, 'pagado'),
(1013, 104, 1, '2025-03-12', 416000.00, 'pagado'),
(1014, 104, 2, '2025-04-12', 416000.00, 'pagado'),
(1015, 104, 3, '2025-05-12', 416000.00, 'pagado'),
(1016, 105, 1, '2025-04-08', 61250.00, 'pagado'),
(1017, 105, 2, '2025-05-08', 61250.00, 'pagado'),
(1018, 105, 3, '2025-06-08', 61250.00, 'pagado'),
(1019, 105, 4, '2025-07-08', 61250.00, 'pagado'),
(1020, 105, 5, '2025-08-08', 61250.00, 'pagado'),
(1021, 105, 6, '2025-09-08', 61250.00, 'pagado'),
(1022, 106, 1, '2025-05-25', 71333.33, 'pagado'),
(1023, 106, 2, '2025-06-25', 71333.33, 'pagado'),
(1024, 106, 3, '2025-07-25', 71333.33, 'pagado'),
(1025, 106, 4, '2025-08-25', 71333.33, 'pagado'),
(1026, 106, 5, '2025-09-25', 71333.33, 'pagado'),
(1027, 106, 6, '2025-10-25', 71333.33, 'pagado'),
(1028, 107, 1, '2025-06-18', 175000.00, 'pagado'),
(1029, 107, 2, '2025-07-18', 175000.00, 'pagado'),
(1030, 107, 3, '2025-08-18', 175000.00, 'pagado'),
(1031, 108, 1, '2025-06-29', 49041.67, 'pagado'),
(1032, 108, 2, '2025-07-29', 49041.67, 'pagado'),
(1033, 108, 3, '2025-08-29', 49041.67, 'pagado'),
(1034, 108, 4, '2025-09-29', 49041.67, 'pagado'),
(1035, 108, 5, '2025-10-29', 49041.67, 'pagado'),
(1036, 108, 6, '2025-11-29', 49041.67, 'pagado'),
(1037, 108, 7, '2025-12-29', 49041.67, 'pagado'),
(1038, 108, 8, '2026-01-29', 49041.67, 'pagado'),
(1039, 108, 9, '2026-02-28', 49041.67, 'pagado'),
(1040, 108, 10, '2026-03-29', 49041.67, 'pendiente'),
(1041, 108, 11, '2026-04-29', 49041.67, 'pendiente'),
(1042, 108, 12, '2026-05-29', 49041.67, 'pendiente'),
(1043, 109, 1, '2025-07-02', 346666.67, 'pagado'),
(1044, 109, 2, '2025-08-02', 346666.67, 'pagado'),
(1045, 109, 3, '2025-09-02', 346666.67, 'pagado'),
(1046, 110, 1, '2025-07-15', 104000.00, 'pagado'),
(1047, 110, 2, '2025-08-15', 104000.00, 'pagado'),
(1048, 110, 3, '2025-09-15', 104000.00, 'pagado'),
(1049, 110, 4, '2025-10-15', 104000.00, 'pagado'),
(1050, 110, 5, '2025-11-15', 104000.00, 'pagado'),
(1051, 110, 6, '2025-12-15', 104000.00, 'pagado'),
(1052, 111, 1, '2025-08-14', 72000.00, 'pagado'),
(1053, 111, 2, '2025-09-14', 72000.00, 'pagado'),
(1054, 111, 3, '2025-10-14', 72000.00, 'pagado'),
(1055, 112, 1, '2025-08-29', 46366.67, 'pagado'),
(1056, 112, 2, '2025-09-29', 46366.67, 'pagado'),
(1057, 112, 3, '2025-10-29', 46366.67, 'pagado'),
(1058, 112, 4, '2025-11-29', 46366.67, 'pagado'),
(1059, 112, 5, '2025-12-29', 46366.67, 'pagado'),
(1060, 112, 6, '2026-01-29', 46366.67, 'pagado'),
(1061, 112, 7, '2026-02-28', 46366.67, 'pagado'),
(1062, 112, 8, '2026-03-29', 46366.67, 'pendiente'),
(1063, 112, 9, '2026-04-29', 46366.67, 'pendiente'),
(1064, 112, 10, '2026-05-29', 46366.67, 'pendiente'),
(1065, 112, 11, '2026-06-29', 46366.67, 'pendiente'),
(1066, 112, 12, '2026-07-29', 46366.67, 'pendiente'),
(1067, 113, 1, '2025-08-14', 72000.00, 'pagado'),
(1068, 113, 2, '2025-09-14', 72000.00, 'pagado'),
(1069, 113, 3, '2025-10-14', 72000.00, 'pagado'),
(1070, 113, 4, '2025-11-14', 72000.00, 'pagado'),
(1071, 113, 5, '2025-12-14', 72000.00, 'pagado'),
(1072, 113, 6, '2026-01-14', 72000.00, 'pagado'),
(1073, 114, 1, '2025-09-22', 42800.00, 'pagado'),
(1074, 114, 2, '2025-10-22', 42800.00, 'pagado'),
(1075, 114, 3, '2025-11-22', 42800.00, 'pagado'),
(1076, 114, 4, '2025-12-22', 42800.00, 'pagado'),
(1077, 114, 5, '2026-01-22', 42800.00, 'pagado'),
(1078, 114, 6, '2026-02-22', 42800.00, 'pagado'),
(1079, 114, 7, '2026-03-22', 42800.00, 'pagado'),
(1080, 114, 8, '2025-04-22', 42800.00, 'pendiente'),
(1081, 114, 9, '2025-05-22', 42800.00, 'pendiente'),
(1082, 114, 10, '2025-06-22', 42800.00, 'pendiente'),
(1083, 115, 1, '2025-10-01', 126000.00, 'pagado'),
(1084, 115, 2, '2025-11-01', 126000.00, 'pagado'),
(1085, 115, 3, '2025-12-01', 126000.00, 'pagado'),
(1086, 116, 1, '2025-10-23', 33000.00, 'pagado'),
(1087, 116, 2, '2025-11-23', 33000.00, 'pagado'),
(1088, 116, 3, '2025-12-23', 33000.00, 'pagado'),
(1089, 116, 4, '2026-01-23', 33000.00, 'pagado'),
(1090, 116, 5, '2026-02-23', 33000.00, 'mora'),
(1091, 116, 6, '2026-03-23', 33000.00, 'pendiente'),
(1092, 116, 7, '2026-04-23', 33000.00, 'pendiente'),
(1093, 116, 8, '2026-05-23', 33000.00, 'pendiente'),
(1094, 116, 9, '2026-06-23', 33000.00, 'pendiente'),
(1095, 116, 10, '2026-07-23', 33000.00, 'pendiente'),
(1096, 116, 11, '2026-08-23', 33000.00, 'pendiente'),
(1097, 116, 12, '2026-09-23', 33000.00, 'pendiente'),
(1098, 116, 13, '2026-10-23', 33000.00, 'pendiente'),
(1099, 116, 14, '2026-11-23', 33000.00, 'pendiente'),
(1100, 116, 15, '2026-12-23', 33000.00, 'pendiente'),
(1101, 116, 16, '2027-01-23', 33000.00, 'pendiente'),
(1102, 116, 17, '2027-02-23', 33000.00, 'pendiente'),
(1103, 116, 18, '2027-03-23', 33000.00, 'pendiente'),
(1104, 117, 1, '2025-10-23', 44583.33, 'pagado'),
(1105, 117, 2, '2025-11-23', 44583.33, 'pagado'),
(1106, 117, 3, '2025-12-23', 44583.33, 'pagado'),
(1107, 117, 4, '2026-01-23', 44583.33, 'pagado'),
(1108, 117, 5, '2026-02-23', 44583.33, 'pagado'),
(1109, 117, 6, '2026-03-23', 44583.33, 'pendiente'),
(1110, 117, 7, '2026-04-23', 44583.33, 'pendiente'),
(1111, 117, 8, '2026-05-23', 44583.33, 'pendiente'),
(1112, 117, 9, '2026-06-23', 44583.33, 'pendiente'),
(1113, 117, 10, '2026-07-23', 44583.33, 'pendiente'),
(1114, 117, 11, '2026-08-23', 44583.33, 'pendiente'),
(1115, 117, 12, '2026-09-23', 44583.33, 'pendiente'),
(1116, 118, 1, '2025-10-27', 35666.67, 'pagado'),
(1117, 118, 2, '2025-11-27', 35666.67, 'pagado'),
(1118, 118, 3, '2025-12-27', 35666.67, 'pagado'),
(1119, 118, 4, '2026-01-27', 35666.67, 'pagado'),
(1120, 118, 5, '2026-02-27', 35666.67, 'pagado'),
(1121, 118, 6, '2026-03-27', 35666.67, 'pagado'),
(1122, 118, 7, '2026-04-27', 35666.67, 'pendiente'),
(1123, 118, 8, '2026-05-27', 35666.67, 'pendiente'),
(1124, 118, 9, '2026-06-27', 35666.67, 'pendiente'),
(1125, 118, 10, '2026-07-27', 35666.67, 'pendiente'),
(1126, 118, 11, '2026-08-27', 35666.67, 'pendiente'),
(1127, 118, 12, '2026-09-27', 35666.67, 'pendiente'),
(1128, 118, 13, '2026-10-27', 35666.67, 'pendiente'),
(1129, 118, 14, '2026-11-27', 35666.67, 'pendiente'),
(1130, 118, 15, '2026-12-27', 35666.67, 'pendiente'),
(1131, 118, 16, '2027-01-27', 35666.67, 'pendiente'),
(1132, 118, 17, '2027-02-27', 35666.67, 'pendiente'),
(1133, 118, 18, '2027-03-27', 35666.67, 'pendiente'),
(1134, 119, 1, '2025-11-06', 224000.00, 'pagado'),
(1135, 119, 2, '2025-12-06', 224000.00, 'pagado'),
(1136, 119, 3, '2026-01-06', 224000.00, 'pagado'),
(1137, 120, 1, '2025-11-25', 63000.00, 'pagado'),
(1138, 120, 2, '2025-12-25', 63000.00, 'pagado'),
(1139, 120, 3, '2026-01-25', 63000.00, 'pagado'),
(1140, 120, 4, '2026-02-25', 63000.00, 'pagado'),
(1141, 120, 5, '2026-03-25', 63000.00, 'pendiente'),
(1142, 120, 6, '2026-04-25', 63000.00, 'pendiente'),
(1143, 121, 1, '2025-12-14', 28500.00, 'pagado'),
(1144, 121, 2, '2026-01-14', 28500.00, 'pagado'),
(1145, 121, 3, '2026-02-14', 28500.00, 'pagado'),
(1146, 121, 4, '2026-03-14', 28500.00, 'mora'),
(1147, 121, 5, '2026-04-14', 28500.00, 'pendiente'),
(1148, 121, 6, '2026-05-14', 28500.00, 'pendiente'),
(1149, 122, 1, '2026-01-01', 32666.67, 'pagado'),
(1150, 122, 2, '2026-02-01', 32666.67, 'mora'),
(1151, 122, 3, '2026-03-01', 32666.67, 'mora'),
(1152, 122, 4, '2026-04-01', 32666.67, 'pendiente'),
(1153, 122, 5, '2026-05-01', 32666.67, 'pendiente'),
(1154, 122, 6, '2026-06-01', 32666.67, 'pendiente'),
(1155, 122, 7, '2026-07-01', 32666.67, 'pendiente'),
(1156, 122, 8, '2026-08-01', 32666.67, 'pendiente'),
(1157, 122, 9, '2026-09-01', 32666.67, 'pendiente'),
(1158, 122, 10, '2026-10-01', 32666.67, 'pendiente'),
(1159, 122, 11, '2026-11-01', 32666.67, 'pendiente'),
(1160, 122, 12, '2026-12-01', 32666.67, 'pendiente'),
(1161, 123, 1, '2026-01-21', 37333.33, 'pagado'),
(1162, 123, 2, '2026-02-21', 37333.33, 'mora'),
(1163, 123, 3, '2026-03-21', 37333.33, 'pendiente'),
(1164, 123, 4, '2026-04-21', 37333.33, 'pendiente'),
(1165, 123, 5, '2026-05-21', 37333.33, 'pendiente'),
(1166, 123, 6, '2026-06-21', 37333.33, 'pendiente'),
(1167, 124, 1, '2026-01-30', 54500.00, 'pagado'),
(1168, 124, 2, '2026-03-01', 54500.00, 'mora'),
(1169, 124, 3, '2026-03-30', 54500.00, 'pendiente'),
(1170, 125, 1, '2026-02-14', 95000.00, 'mora'),
(1171, 125, 2, '2026-03-14', 95000.00, 'mora'),
(1172, 125, 3, '2026-04-14', 95000.00, 'pendiente'),
(1173, 126, 1, '2026-02-01', 76300.00, 'pagado'),
(1174, 126, 2, '2026-03-01', 76300.00, 'pagado'),
(1175, 126, 3, '2026-04-01', 76300.00, 'pendiente'),
(1176, 126, 4, '2026-05-01', 76300.00, 'pendiente'),
(1177, 126, 5, '2026-06-01', 76300.00, 'pendiente'),
(1178, 126, 6, '2026-07-01', 76300.00, 'pendiente'),
(1179, 126, 7, '2026-08-01', 76300.00, 'pendiente'),
(1180, 126, 8, '2026-09-01', 76300.00, 'pendiente'),
(1181, 126, 9, '2026-10-01', 76300.00, 'pendiente'),
(1182, 126, 10, '2026-11-01', 76300.00, 'pendiente'),
(1183, 127, 1, '2026-03-21', 69550.00, 'pagado'),
(1184, 127, 2, '2026-04-21', 69550.00, 'pendiente'),
(1185, 127, 3, '2026-05-21', 69550.00, 'pendiente'),
(1186, 127, 1, '2026-06-21', 69550.00, 'pendiente'),
(1187, 127, 2, '2026-07-21', 69550.00, 'pendiente'),
(1188, 127, 3, '2026-08-21', 69550.00, 'pendiente'),
(1189, 127, 4, '2026-09-21', 69550.00, 'pendiente'),
(1190, 127, 5, '2026-10-21', 69550.00, 'pendiente'),
(1191, 127, 6, '2026-11-21', 69550.00, 'pendiente'),
(1192, 127, 7, '2026-12-21', 69550.00, 'pendiente'),
(1193, 127, 8, '2027-01-21', 69550.00, 'pendiente'),
(1194, 127, 9, '2027-02-21', 69550.00, 'pendiente'),
(1195, 127, 10, '2027-03-21', 69550.00, 'pendiente'),
(1196, 128, 1, '2026-03-26', 36333.33, 'pagado'),
(1197, 128, 2, '2026-04-26', 36333.33, 'pendiente'),
(1198, 128, 3, '2026-05-26', 36333.33, 'pendiente'),
(1199, 129, 1, '2026-04-03', 122500.00, 'pendiente'),
(1200, 129, 2, '2026-05-03', 122500.00, 'pendiente'),
(1201, 129, 3, '2026-06-03', 122500.00, 'pendiente'),
(1202, 129, 4, '2026-07-03', 122500.00, 'pendiente'),
(1203, 129, 5, '2026-08-03', 122500.00, 'pendiente'),
(1204, 129, 6, '2026-09-03', 122500.00, 'pendiente'),
(1205, 130, 1, '2026-04-21', 163500.00, 'pendiente'),
(1206, 130, 2, '2026-05-21', 163500.00, 'pendiente'),
(1207, 130, 3, '2026-06-21', 163500.00, 'pendiente');


-- 2. ANÁLISIS EXPLORATORIO - SEGMENTACIÓN DE CLIENTES
-- =============================================================================
--Lista usuarios
select distinct id_usuario
from usuarios
ORDER BY id_usuario ASC; 

-- Conteo total de base de usuarios
select count(*) as Cantidad_usuarios
from usuarios u 

--Nombre y apellido de los usuarios con scoring bajo (<500)
Select distinct nombre, apellido
from usuarios
where scoring_crediticio<500
;
--Nombre y apellido de los usuarios con scoring medio (entre 500 y 800)
Select distinct nombre, apellido
from usuarios
where scoring_crediticio>=500 and scoring_crediticio<=800
;
--Nombre y apellido de los usuarios con scoring alto (>800)
Select distinct nombre, apellido
from usuarios
where scoring_crediticio>800 
;

-- Distribución de Scoring 
SELECT 
    COUNT(CASE WHEN scoring_crediticio <500 THEN 1 END) AS cantidad_personas_scoring_bajo,
    COUNT(CASE WHEN scoring_crediticio BETWEEN 500 AND 800 THEN 1 END) AS cantidad_personas_scoring_medio,
	COUNT(CASE WHEN scoring_crediticio  > 800 THEN 1 END) AS cantidad_personas_scoring_alto
    FROM usuarios;


--Clientes con scoring mayor a 700 ordenados de manera descendente
SELECT DISTINCT nombre, apellido, scoring_crediticio
FROM usuarios
WHERE scoring_crediticio>700
ORDER BY scoring_crediticio desc;

-- Top 10 Clientes con mejor Scoring
SELECT DISTINCT nombre, apellido, scoring_crediticio
FROM usuarios
ORDER BY scoring_crediticio DESC
limit 10;

--Objetivo: Unir la tabla usuarios con la tabla prestamos. Mostrar el nombre del usuario y el monto_solicitado.
select distinct nombre, monto_solicitado
from usuarios u
inner join prestamos on u.id_usuario = prestamos.id_usuario; 

--Objetivo: ver cuanta plata hay pendiente que ingrese 
SELECT SUM(monto_cuota) AS monto_total_pendiente
from cuotas
where estado_pago='pendiente'
;
--El Reporte de Cobranzas
--Necesitamos una lista que muestre: El nombre del usuario, El monto_cuota, La fecha_vencimiento.
--pero solo de las cuotas que están en 'mora'.

select u.nombre, p.monto_solicitado, c.monto_cuota, c.fecha_vencimiento
from ((usuarios u 
inner join prestamos as p
on u.id_usuario = p.id_usuario )
inner join cuotas as c
on c.id_prestamo= p.id_prestamo)
where estado_pago='mora'
;


-- 3. ANÁLISIS DE OPERACIONES Y SALUD FINANCIERA
-- =============================================================================

-- Resumen de estados de préstamos activos y morosos
select COUNT(CASE WHEN estado='Activo' THEN 1 END) AS Prestamos_activos,
       COUNT(CASE WHEN estado='Finalizado' THEN 1 END) AS Prestamos_finalizados,
	   COUNT(CASE WHEN estado= 'En Mora' THEN 1 END) AS Prestamos_atrasados
FROM prestamos;

-- Monto total proyectado (Cartera Pendiente)
SELECT SUM(monto_cuota) AS Monto_total_pendiente
FROM cuotas
WHERE estado_pago = 'Pendiente';

-- 4. REPORTES DE MOROSIDAD (CORTE AL 21/03/2026)
-- =============================================================================

--Cantidad de cuotas en 'mora' 
select count(*)
from cuotas 
where estado_pago='mora' 

-- Deuda total en mora (Capital en riesgo)
select SUM(monto_cuota)
from cuotas 
where estado_pago='mora'
;


select id_cuota, monto_cuota
from cuotas 
where estado_pago='mora' and monto_cuota>5000;

-- Ranking de deudores críticos (Deuda > $50.000)
select u.id_usuario, SUM(c.monto_cuota) AS deuda
from ((usuarios u 
inner join prestamos as p
on u.id_usuario =p.id_usuario)
inner join cuotas as c
on p.id_prestamo = c.id_prestamo )
where estado_pago ='mora'
group by u.id_usuario
having SUM(c.monto_cuota)>50000
order by deuda desc;


-- ANALISIS CORRELACIÓN SCORING VS. PAGO: ¿El scoring inicial predice la mora real?
SELECT 
    p.estado AS estado_prestamo,
    AVG(u.scoring_crediticio) AS promedio_scoring,
    COUNT(u.id_usuario) AS total_casos
FROM usuarios u
INNER JOIN prestamos p ON u.id_usuario = p.id_usuario
GROUP BY p.estado
ORDER BY promedio_scoring DESC;










