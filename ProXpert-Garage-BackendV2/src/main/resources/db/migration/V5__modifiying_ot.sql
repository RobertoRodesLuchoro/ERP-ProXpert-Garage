BEGIN;

-- Borrar todos los registros existentes
DELETE FROM ordenes_trabajo;

-- Añadir restricción de unicidad sobre matricula
ALTER TABLE ordenes_trabajo
    ADD CONSTRAINT unique_matricula UNIQUE (matricula);

COMMIT;
