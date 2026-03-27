# 📊 Análisis de Cartera y Riesgo Crediticio (SQL)
Este proyecto simula el entorno de base de datos de una entidad financiera para gestionar usuarios, préstamos y cuotas, con un enfoque en la detección de morosidad y el análisis de scoring crediticio. 

## 📋 Contexto del proyecto
El análisis se realizó sobre un conjunto de datos capturado entre el 5 de enero de 2025 (fecha de la primera alta) y el 21 de marzo de 2026 (fecha del último desembolso), compuesto por:

* **30 Usuarios únicos con perfiles de riesgo y límites crediticios diversos.**
* **30 Préstamos otorgados con integridad referencial completa.**
* **208 Cuotas que conforman el historial detallado de pagos y mora.**

## 🚀 Tecnologías Utilizadas
* **Motor de DB:** PostgreSQL 
* **Entorno:** Docker (para asegurar la portabilidad) 
* **Herramientas:** DBeaver 
* **Lenguaje:** SQL (Agregaciones, Joins, Case When)

## 🛠️ Estructura del Proyecto
* **Usuarios:** Información personal y scoring inicial. 
* **Préstamos:** Condiciones financieras (monto, tasa, cuotas). 
* **Cuotas:** Detalle de vencimientos y estados (Pagado, Pendiente, Mora).

## 📈 Análisis Realizados (KPIs)
El script incluye consultas estratégicas para responder preguntas de negocio:
* **Validación de Scoring vs. Estado de Pago** : Se analiza la relación entre el scoring crediticio promedio y el estado real de los préstamos (Finalizado, Activo, En Mora). Al incluir el volumen total de casos por grupo, logramos confirmar estadísticamente si el puntaje inicial realmente predice la mora real.
* **Salud Financiera**: Cálculo de la Cartera Pendiente (monto total a cobrar) y segmentación de préstamos activos vs. atrasados. 
* **Gestión de Mora**: Identificación de deudores críticos con deuda consolidada mayor a $\$50.000$. 
* **Segmentación de Riesgo**: Clasificación automática de clientes en niveles Bajo, Medio y Alto según su puntaje crediticio. 

## 💡 Insights y Hallazgos de Negocio
* **Efectividad del Modelo**: El 66,67% de la mora se concentra en el segmento de Scoring Bajo, lo que demuestra que el filtro de riesgo inicial es preciso para detectar la mayoría de los perfiles críticos, aunque existe un margen de mejora en el segmento medio.
* **Detección de "Diamantes en Bruto"**: El análisis identificó usuarios con scoring bajo que, a pesar de su perfil de riesgo inicial, cumplieron con el pago de su monto maximo permitido satisfactoriamente ($170.000). Esto sugiere que el límite actual les queda "chico" y representa una oportunidad para ajustar los límites de crédito y ofrecerles mejores condiciones en sus próximos préstamos para que sigan eligiendo la empresa.
* **Prioridad en Cobranzas**: Al identificar deudores con montos altos (más de $50.000), el equipo puede enfocarse primero en los casos que más afectan económicamente a la empresa, ahorrando tiempo y esfuerzo.

## 🛠️ Cómo ejecutar el proyecto

### 🐳 1. Configuración del Entorno con Docker
Para asegurar que el proyecto corra en un entorno profesional y aislado, seguí estos pasos para configurar tu base de datos:

-Levantar el contenedor (PostgreSQL):
Ejecutá este comando en tu terminal para crear la instancia:

Bash
docker run --name cartero-db -e POSTGRES_PASSWORD=admin123 -p 5432:5432 -d postgres

### 📥 2. Carga de Datos y Análisis
Conectar desde DBeaver:
Crea una nueva conexión de tipo PostgreSQL
Host: localhost | Puerto: 5432 | Usuario: postgres | Contraseña: admin123 (la que definimos en el paso anterior).

Una vez conectada, tenés dos formas de correr este análisis según tu preferencia:

### Opción A: Ejecución Directa

Abrí el archivo principal analisis_cartera_creditos.sql, que incluye sentencias INSERT INTO con todos los datos necesarios, y descomentá esa parte del codigo y corré todo el script.

### Opción B: Pasos para la Importación Manual

Al no usar los INSERT automáticos y optar cargar los archivos .csv a mano, seguí este orden:

Ejecutar la Estructura: Corré solo los comandos CREATE TABLE (para usuarios, prestamos y cuotas)

Verificación: Asegurate de que las tablas aparezcan en el panel izquierdo (Database Navigator) dentro de Public -> Tables.

Importación:
Hacé clic derecho sobre la tabla recién creada (ej: usuarios).
Seleccioná "Import Data".
Cargá el archivo usuarios.csv correspondiente.
Repetí el proceso para todas el resto de las tablas (prestamos y cuotas).

