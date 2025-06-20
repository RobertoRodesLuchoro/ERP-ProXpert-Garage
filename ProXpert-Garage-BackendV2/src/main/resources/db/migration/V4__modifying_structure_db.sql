-- 1. Eliminar la restricción FK si existe
ALTER TABLE ordenes_trabajo
    DROP CONSTRAINT IF EXISTS fk_ordenes_trabajo_presupuesto;

-- 2. Eliminar la columna presupuesto_id
ALTER TABLE ordenes_trabajo
    DROP COLUMN IF EXISTS presupuesto_id;

-- 3. Añadir columnas nuevas
ALTER TABLE ordenes_trabajo
    ADD COLUMN cliente VARCHAR(100),
    ADD COLUMN vehiculo VARCHAR(100),
    ADD COLUMN matricula CHAR(7);
