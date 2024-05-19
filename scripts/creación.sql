-- Active: 1716050314423@@127.0.0.1@5432@inversiones
CREATE DATABASE inversiones;

-- Tabla para cat_perfil_riesgo.csv
CREATE TABLE cat_perfil_riesgo (
    cod_perfil_riesgo INTEGER PRIMARY KEY,
    perfil_riesgo VARCHAR(50)
);

-- Tabla para historico_aba_macroactivos.csv
CREATE TABLE historico_aba_macroactivos (
    ingestion_year INTEGER,
    ingestion_month INTEGER,
    ingestion_day INTEGER,
    id_sistema_cliente FLOAT,
    macroactivo VARCHAR(50),
    cod_activo INTEGER,
    aba INTEGER,
    cod_perfil_riesgo INTEGER,
    cod_banca VARCHAR(2),
    year INTEGER,
    month INTEGER
);

