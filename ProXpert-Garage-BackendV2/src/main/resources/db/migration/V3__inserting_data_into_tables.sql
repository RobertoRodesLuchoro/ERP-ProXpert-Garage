INSERT INTO clientes (cliente_id, nombre, apellidos, nif, email, telefono_movil, localidad) VALUES
    (5, 'Laura', 'Martínez', '56789012E', 'laura@example.com', '655555555', 'San Vicente');


INSERT INTO vehiculos (vehiculo_id, matricula, cliente_id, marca, modelo, anyo, tipo_vehiculo, color) VALUES
    (5, '1415MNO', 5, 'Ford', 'Focus', 2019, 'Sedán', 'Gris');

INSERT INTO presupuestos (vehiculo_id, cliente_id, fecha_creacion, estado, precio_total) VALUES
(1, 1, '2025-06-01', 'Pendiente', 150.00),
( 2, 1, '2025-06-02', 'Aceptado', 245.00),
( 1, 2, '2025-06-02', 'Rechazado', 180.00),
( 3, 2, '2025-06-03', 'Pendiente', 390.00),
( 4, 3, '2025-06-03', 'Aceptado', 95.00),
( 5, 3, '2025-06-04', 'Rechazado', 225.50),
( 2, 4, '2025-06-04', 'Pendiente', 410.00),
( 3, 4, '2025-06-05', 'Aceptado', 320.00),
( 5, 5, '2025-06-05', 'Rechazado', 510.00),
( 4, 5, '2025-06-06', 'Pendiente', 185.00),
( 1, 1, '2025-06-06', 'Aceptado', 305.00),
( 2, 1, '2025-06-07', 'Rechazado', 135.00),
( 3, 2, '2025-06-07', 'Pendiente', 88.00),
( 5, 2, '2025-06-08', 'Aceptado', 450.00),
( 4, 3, '2025-06-08', 'Rechazado', 175.00),
( 1, 3, '2025-06-09', 'Pendiente', 212.00),
( 2, 4, '2025-06-09', 'Aceptado', 330.00),
(3, 4, '2025-06-10', 'Rechazado', 97.00),
( 5, 5, '2025-06-10', 'Pendiente', 190.00),
( 4, 5, '2025-06-11', 'Aceptado', 660.00);


INSERT INTO ordenes_trabajo (presupuesto_id, fecha_inicio, fecha_fin, estado, precio_total) VALUES
(2, '2024-06-01', '2024-06-03', 'En curso', 250.00),
(3, '2024-06-02', '2024-06-05', 'Completada', 750.00),
(4, '2024-06-03', '2024-06-04', 'Cancelada', 180.50),
(5, '2024-06-04', '2024-06-07', 'Pendiente', 320.00),
(6, '2024-06-05', '2024-06-10', 'En curso', 1200.00),
(7, '2024-06-06', '2024-06-08', 'Completada', 985.75),
(8, '2024-06-07', '2024-06-11', 'Pendiente', 450.25),
(9, '2024-06-08', '2024-06-12', 'Completada', 610.00),
(10, '2024-06-09', '2024-06-10', 'Cancelada', 199.99),
(11, '2024-06-10', '2024-06-14', 'Pendiente', 1340.00),
(12, '2024-06-11', '2024-06-15', 'Completada', 875.00),
(13, '2024-06-12', '2024-06-16', 'En curso', 495.00),
(14, '2024-06-13', '2024-06-17', 'Completada', 1020.50),
(15, '2024-06-14', '2024-06-18', 'Cancelada', 300.00),
(16, '2024-06-15', '2024-06-19', 'Pendiente', 615.25),
(17, '2024-06-16', '2024-06-20', 'En curso', 780.90),
(18, '2024-06-17', '2024-06-21', 'Completada', 1450.00),
(19, '2024-06-18', '2024-06-22', 'Pendiente', 510.00),
(20, '2024-06-19', '2024-06-23', 'Cancelada', 220.00);


INSERT INTO productos (nombre, proveedor, categoria, descripcion, precio, cantidad) VALUES
('Filtro de aceite Bosch', 'Bosch España', 'Filtros', 'Filtro de aceite para motores gasolina y diésel', 8.50, 25),
('Pastillas de freno Brembo', 'Brembo', 'Frenos', 'Pastillas de freno delanteras para vehículos turismo', 45.00, 15),
('Aceite 5W30 Repsol Elite', 'Repsol', 'Lubricantes', 'Aceite sintético 5W30 para motores modernos', 32.99, 40),
('Batería Varta 70Ah', 'Varta', 'Electricidad', 'Batería de coche con 12V y 70Ah de capacidad', 89.95, 10),
('Juego de limpiaparabrisas Bosch', 'Bosch España', 'Accesorios', 'Limpiaparabrisas delanteros con tecnología AeroTwin', 22.90, 30),
('Filtro de aire Mann', 'MANN+HUMMEL', 'Filtros', 'Filtro de aire para admisión en motores gasolina', 14.00, 20),
('Kit de distribución Dayco', 'Dayco', 'Transmisión', 'Kit completo con correa y rodillos tensores', 120.00, 5),
('Amortiguador Monroe delantero', 'Monroe', 'Suspensión', 'Amortiguador hidráulico compatible con varios modelos', 65.00, 12),
('Sensor de oxígeno Denso', 'Denso', 'Sensores', 'Sensor lambda universal para motores gasolina', 38.99, 18),
('Juego de bujías NGK', 'NGK España', 'Encendido', 'Conjunto de 4 bujías de iridio', 28.75, 16),
('Alternador Bosch 120A', 'Bosch España', 'Electricidad', 'Alternador para vehículos diésel 1.9 TDI', 145.50, 7),
('Radiador NRF', 'NRF', 'Refrigeración', 'Radiador de aluminio con depósito lateral', 89.00, 9),
('Discos de freno delanteros TRW', 'TRW', 'Frenos', 'Discos ventilados de 280 mm', 60.25, 13),
('Termostato Vernet', 'Calorstat by Vernet', 'Refrigeración', 'Termostato para sistema de refrigeración', 18.40, 22),
('Correa auxiliar Gates', 'Gates', 'Transmisión', 'Correa poly-v para accesorios de motor', 16.90, 28),
('Espejo retrovisor izquierdo', 'Valeo', 'Carrocería', 'Espejo eléctrico compatible con varios modelos Renault', 49.99, 6),
('Sensor ABS Bosch', 'Bosch España', 'Sensores', 'Sensor de rueda para sistema antibloqueo', 35.80, 14),
('Kit embrague Luk', 'LuK', 'Transmisión', 'Kit completo de embrague con plato y cojinete', 170.00, 4),
('Tubo de escape central Walker', 'Walker', 'Escape', 'Tubo intermedio con silenciador para diésel', 84.60, 5),
('Bombilla H7 Philips', 'Philips Automotive', 'Iluminación', 'Bombilla halógena para faro delantero', 6.99, 50);
