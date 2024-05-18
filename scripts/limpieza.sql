-- Eliminar duplicados (si los hay)
DELETE FROM cat_perfil_riesgo
WHERE cod_perfil_riesgo IN (
    SELECT cod_perfil_riesgo
    FROM cat_perfil_riesgo
    GROUP BY cod_perfil_riesgo
    HAVING COUNT(*) > 1
);

-- Convertir a mayúsculas el perfil de riesgo
UPDATE cat_perfil_riesgo
SET perfil_riesgo = UPPER(perfil_riesgo);

-- Eliminar espacios en blanco al inicio y al final del perfil de riesgo
UPDATE cat_perfil_riesgo
SET perfil_riesgo = TRIM(perfil_riesgo);


-- Eliminar duplicados (si los hay)
DELETE FROM catalogo_activos
WHERE cod_activo IN (
    SELECT cod_activo
    FROM catalogo_activos
    GROUP BY cod_activo
    HAVING COUNT(*) > 1
);

-- Convertir a mayúsculas el nombre del activo
UPDATE catalogo_activos
SET activo = UPPER(activo);

-- Eliminar espacios en blanco al inicio y al final del nombre del activo
UPDATE catalogo_activos
SET activo = TRIM(activo);


-- Eliminar duplicados (si los hay)
DELETE FROM catalogo_banca
WHERE cod_banca IN (
    SELECT cod_banca
    FROM catalogo_banca
    GROUP BY cod_banca
    HAVING COUNT(*) > 1
);

-- Convertir a mayúsculas el nombre de la banca
UPDATE catalogo_banca
SET banca = UPPER(banca);

-- Eliminar espacios en blanco al inicio y al final del nombre de la banca
UPDATE catalogo_banca
SET banca = TRIM(banca);


-- Eliminar duplicados (si los hay)
DELETE FROM cat_perfil_riesgo
WHERE cod_perfil_riesgo IN (
    SELECT cod_perfil_riesgo
    FROM cat_perfil_riesgo
    GROUP BY cod_perfil_riesgo
    HAVING COUNT(*) > 1
);

-- Convertir a mayúsculas el perfil de riesgo
UPDATE cat_perfil_riesgo
SET perfil_riesgo = UPPER(perfil_riesgo);

-- Eliminar espacios en blanco al inicio y al final del perfil de riesgo
UPDATE cat_perfil_riesgo
SET perfil_riesgo = TRIM(perfil_riesgo);
