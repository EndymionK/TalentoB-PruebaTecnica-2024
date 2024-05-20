# Sistema Analítico para la Gerencia de Inversiones

Este repositorio contiene el proyecto desarrollado para la prueba técnica de TalentoB 2024-2.

## Pipeline de Datos

![Pipeline de Datos](pipeline_Datos.png)

## Estructura del Proyecto

- `scripts/`: Contiene los scripts de Python y SQL.
- `README.md`: Instrucciones para reproducir el proyecto.
- `video_demostracion.mp4`: Video demostrativo de la funcionalidad del sistema analítico.

## Requisitos

- PostgreSQL
- Python 3.12
- Librerías de Python: pandas, SQLAlchemy, plotly, dash

## Instrucciones

1. **Instalar PostgreSQL** y crear la base de datos `inversiones`.
2. **Ejecutar los scripts SQL** en `scripts/creación.sql` para crear las tablas necesarias.
3. **Poblar las tablas** ejecutando el script `scripts/cargar_datos.py`.
4. **Ejecutar el script de limpieza** `scripts/limpieza.sql` para limpiar los datos y crear las vistas necesarias.
5. **Ejecutar el script de visualización** `scripts/visualizacion.py` para generar las visualizaciones requeridas.

## Video de Demostración

[Ver video en YouTube](https://www.youtube.com/watch?v=example)

## Conclusiones tecnicas

- Se utilizó Python para la limpieza y visualización de los datos.
- Se utilizó SQL para la creación de las tablas y vistas.
- Se utilizó Plotly y Dash para la creación de las visualizaciones interactivas.

## Conclusiones de Negocio

- Se identificaron los sectores con mayor y menor rentabilidad.
- Se identificaron los sectores con mayor y menor riesgo.
- Se identificaron los sectores con mayor y menor liquidez.

## Areas de Mejora

- Automatizar la actualización de los datos.
- Mejorar la visualización de los datos.
- Agregar más funcionalidades al sistema analítico.

