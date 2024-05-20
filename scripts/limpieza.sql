-- Normalizar los nombres de 'macroactivo' a mayúsculas
UPDATE historico_aba_macroactivos
SET macroactivo = UPPER(macroactivo);

-- Eliminar registros donde month sea menor a 1 o mayor a 12
DELETE FROM historico_aba_macroactivos
WHERE month < 1 OR month > 12;

-- Eliminar registros donde 'aba' sea menor a 0
DELETE FROM historico_aba_macroactivos
WHERE aba < 0;

-- Eliminar registros donde 'id_sistema_cliente' sea nulo
DELETE FROM historico_aba_macroactivos
WHERE id_sistema_cliente IS NULL;

-- Eliminar registros donde ingestion_month sea menor a 1 o mayor a 12
DELETE FROM historico_aba_macroactivos
WHERE ingestion_month < 1 OR ingestion_month > 12;

-- Eliminar registros donde ingestion_day sea menor a 1 o mayor a 31
DELETE FROM historico_aba_macroactivos
WHERE ingestion_day < 1 OR ingestion_day > 31;


-- Crear una vista que muestre el portafolio de cada cliente
CREATE VIEW vista_portafolio_cliente AS
SELECT 
    id_sistema_cliente,
    macroactivo,
    activo,
    SUM(aba) AS total_aba,
    SUM(aba) * 100.0 / SUM(SUM(aba)) OVER (PARTITION BY id_sistema_cliente) AS porcentaje
FROM historico_aba_macroactivos
JOIN catalogo_activos ON historico_aba_macroactivos.cod_activo = catalogo_activos.cod_activo
GROUP BY id_sistema_cliente, macroactivo, activo;

-- Crear una vista que muestre el portafolio por banca
CREATE VIEW vista_portafolio_banca AS
SELECT 
    banca,
    macroactivo,
    SUM(aba) AS total_aba,
    SUM(aba) * 100.0 / SUM(SUM(aba)) OVER (PARTITION BY banca) AS porcentaje
FROM historico_aba_macroactivos
JOIN catalogo_banca ON historico_aba_macroactivos.cod_banca = catalogo_banca.cod_banca
GROUP BY banca, macroactivo;

-- Crear una vista que muestre el portafolio por perfil de riesgo
CREATE VIEW vista_portafolio_perfil_riesgo AS
SELECT 
    perfil_riesgo,
    macroactivo,
    SUM(aba) AS total_aba,
    SUM(aba) * 100.0 / SUM(SUM(aba)) OVER (PARTITION BY perfil_riesgo) AS porcentaje
FROM historico_aba_macroactivos
JOIN cat_perfil_riesgo ON historico_aba_macroactivos.cod_perfil_riesgo = cat_perfil_riesgo.cod_perfil_riesgo
GROUP BY perfil_riesgo, macroactivo;

-- Crear una vista que muestre la evolución mes a mes del ABA promedio
CREATE VIEW vista_evolucion_aba AS
SELECT 
    year,
    month,
    AVG(aba) AS promedio_aba
FROM historico_aba_macroactivos
GROUP BY year, month
ORDER BY year, month;
