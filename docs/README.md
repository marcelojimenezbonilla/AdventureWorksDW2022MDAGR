# Documentación del Proyecto

Esta carpeta contiene la documentación técnica y funcional del Data Warehouse Adventure Works.

## Contenido

- Modelo dimensional
- Diccionario de datos
- Procesos ETL
- Guías de usuario
- Documentación técnica

## Modelo de Datos

El Data Warehouse Adventure Works implementa un esquema de estrella (star schema) con las siguientes dimensiones principales:

- **DimTime**: Dimensión temporal para análisis por periodo
- **DimCustomer**: Información de clientes
- **DimProduct**: Catálogo de productos
- **DimGeography**: Información geográfica
- **DimEmployee**: Información de empleados
- **DimReseller**: Información de revendedores

## Tablas de Hechos

- **FactInternetSales**: Ventas por internet
- **FactResellerSales**: Ventas a revendedores
- **FactFinance**: Información financiera
