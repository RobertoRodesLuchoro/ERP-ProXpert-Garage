CREATE TABLE empleados (
                           empleado_id SERIAL PRIMARY KEY,
                           rol VARCHAR(50) NOT NULL,
                           username VARCHAR(50) NOT NULL UNIQUE,
                           email VARCHAR(100) NOT NULL UNIQUE,
                           hashed_password TEXT NOT NULL,
                           nombre VARCHAR(100),
                           apellidos VARCHAR(100),
                           puesto VARCHAR(100),
                           precio_hora NUMERIC(10, 2),
                           telefono_movil VARCHAR(20),
                           localidad VARCHAR(100)
);

CREATE TABLE clientes (
                          cliente_id SERIAL PRIMARY KEY,
                          nombre VARCHAR(100) NOT NULL,
                          apellidos VARCHAR(100),
                          nif CHAR(9) UNIQUE,
                          email VARCHAR(100),
                          telefono_movil VARCHAR(20),
                          localidad VARCHAR(100)
);

CREATE TABLE vehiculos (
                           vehiculo_id SERIAL PRIMARY KEY,
                           matricula VARCHAR(15) NOT NULL UNIQUE,
                           cliente_id INT REFERENCES clientes(cliente_id) ON DELETE CASCADE,
                           marca VARCHAR(50),
                           modelo VARCHAR(50),
                           anyo INT,
                           tipo_vehiculo VARCHAR(50),
                           color VARCHAR(50)
);

CREATE TABLE productos (
                           producto_id SERIAL PRIMARY KEY,
                           nombre VARCHAR(100) NOT NULL,
                           proveedor VARCHAR(100) NOT NULL,
                           categoria VARCHAR(50),
                           descripcion TEXT,
                           precio NUMERIC(10, 2) NOT NULL,
                           cantidad INT DEFAULT 0
);

CREATE TABLE presupuestos (
                              presupuesto_id SERIAL PRIMARY KEY,
                              vehiculo_id INT REFERENCES vehiculos(vehiculo_id) ON DELETE SET NULL,
                              cliente_id INT REFERENCES clientes(cliente_id) ON DELETE SET NULL,
                              fecha_creacion DATE NOT NULL DEFAULT CURRENT_DATE,
                              estado VARCHAR(50) DEFAULT 'Pendiente',
                              precio_total NUMERIC(10,2) DEFAULT 0.00
);

CREATE TABLE ordenes_trabajo (
                                 orden_id SERIAL PRIMARY KEY,
                                 presupuesto_id INT REFERENCES presupuestos(presupuesto_id) ON DELETE SET NULL,
                                 fecha_inicio DATE,
                                 fecha_fin DATE,
                                 estado VARCHAR(50) DEFAULT 'En curso',
                                 precio_total NUMERIC(10,2)
);