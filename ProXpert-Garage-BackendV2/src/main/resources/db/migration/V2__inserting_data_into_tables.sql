INSERT INTO clientes (nombre, apellidos, nif, email, telefono_movil, localidad) VALUES
('Carlos', 'Gómez', '12345678A', 'carlos@example.com', '611111111', 'Elche'),
('Marta', 'Sánchez', '23456789B', 'marta@example.com', '622222222', 'Alicante'),
('David', 'Ruiz', '34567890C', 'david@example.com', '633333333', 'Benidorm'),
('Lucía', 'Navarro', '45678901D', 'lucia@example.com', '644444444', 'Alcoy');

INSERT INTO vehiculos (matricula, cliente_id, marca, modelo, anyo, tipo_vehiculo, color) VALUES
('1234ABC', 1, 'SEAT', 'Ibiza', 2015, 'Turismo', 'Rojo'),
('5678DEF', 2, 'Renault', 'Clio', 2018, 'Turismo', 'Negro'),
('9101GHI', 3, 'Peugeot', '208', 2020, 'Compacto', 'Gris'),
('1213JKL', 4, 'Volkswagen', 'Golf', 2021, 'Hatchback', 'Blanco');

INSERT INTO productos (nombre, proveedor, categoria, descripcion, precio, cantidad) VALUES
('Aceite 5W30', 'Repsol', 'Lubricantes', 'Aceite sintético para motores diésel y gasolina', 29.99, 20),
('Filtro de aceite', 'Bosch', 'Filtros', 'Filtro compatible con mayoría de turismos', 9.50, 50),
('Pastillas de freno', 'Brembo', 'Frenos', 'Juego de pastillas de freno delanteras', 45.00, 15),
('Batería 60Ah', 'Varta', 'Baterías', 'Batería de arranque estándar 12V', 79.99, 10);

INSERT INTO presupuestos (vehiculo_id, cliente_id, fecha_creacion, estado, precio_total) VALUES
(1, 1, CURRENT_DATE, 'Pendiente', 89.49),
(2, 2, CURRENT_DATE, 'Aceptado', 125.00),
(3, 3, CURRENT_DATE, 'Rechazado', 67.90),
(4, 4, CURRENT_DATE, 'Pendiente', 153.20);

INSERT INTO ordenes_trabajo (presupuesto_id, fecha_inicio, fecha_fin, estado, precio_total) VALUES
(1, CURRENT_DATE, CURRENT_DATE + INTERVAL '1 day', 'En curso', 89.49),
(2, CURRENT_DATE, CURRENT_DATE + INTERVAL '2 days', 'Completada', 125.00),
(3, CURRENT_DATE, NULL, 'Pendiente', 67.90),
(4, CURRENT_DATE, NULL, 'En curso', 153.20);

INSERT INTO empleados (rol, username, email, hashed_password, nombre, apellidos, puesto, precio_hora, telefono_movil, localidad) VALUES
('ADMINISTRATIVO', 'jadmin', 'admin@example.com', 'hashed1', 'Juan', 'Administrador', 'Administrador', 20.50, '600000001', 'Alicante'),
('JEFE_TALLER', 'rramos', 'ramos@example.com', 'hashed2', 'Ramón', 'Ramos', 'Jefe de taller', 22.00, '600000002', 'Elche'),
('MECÁNICO', 'lalonso', 'laura@example.com', 'hashed3', 'Laura', 'Alonso', 'Mecánica general', 18.75, '600000003', 'Alicante'),
('ADMINISTRADOR', 'rrodes', 'roberto@gmail.com', 'hashed4', 'Roberto', 'Rodes', 'Atención al cliente', 16.00, '600000004', 'Santa Pola');
