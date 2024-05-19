-- Asegurarse de que los datos en 'historico_aba' sean consistentes
-- Eliminar filas con 'None' en 'cod_activo'
DELETE FROM historico_aba_macroactivos
WHERE cod_activo IS NULL;


-- Normalizar los nombres de 'macroactivo' a mayúsculas
UPDATE historico_aba_macroactivos
SET macroactivo = UPPER(macroactivo);


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
