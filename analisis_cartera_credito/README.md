# 📊 Análisis de Cartera y Riesgo Crediticio (SQL)
Este proyecto simula el entorno de base de datos de una entidad financiera para gestionar usuarios, préstamos y cuotas, con un enfoque en la detección de morosidad y el análisis de scoring crediticio. 

# 🚀 Tecnologías UtilizadasMotor de DB: PostgreSQL 
Entorno: Docker (para asegurar la portabilidad del proyecto) 
Herramientas de Gestión: DBeaver 
Lenguaje: SQL (Agregaciones, Joins, Case When) 
# 🛠️ Estructura del Proyecto
El modelo relacional incluye tres entidades principales con integridad referencial: Usuarios: Información personal y scoring crediticio inicial. 
Préstamos: Condiciones financieras (monto, tasa, cantidad de cuotas). 
Cuotas: Detalle de vencimientos y estados de pago (Pagado, Pendiente, Mora).

# 📈 Análisis Realizados (KPIs)
El script incluye consultas estratégicas para responder preguntas de negocio:
Análisis de Correlación: ¿El scoring inicial predice la mora real? (Comparación de promedio de scoring por estado de préstamo).
Salud Financiera: Cálculo de la Cartera Pendiente (monto total a cobrar) y segmentación de préstamos activos vs. atrasados. 
Gestión de Mora: Identificación de deudores críticos con deuda consolidada mayor a $\$50.000$. 
Segmentación de Riesgo: Clasificación automática de clientes en niveles Bajo, Medio y Alto según su puntaje crediticio. 



##🛠️ Cómo ejecutar el proyecto

## 🐳 1. Configuración del Entorno con Docker
Para asegurar que el proyecto corra en un entorno profesional y aislado, seguí estos pasos para configurar tu base de datos:

-Levantar el contenedor (PostgreSQL):
Ejecutá este comando en tu terminal para crear la instancia:

Bash
docker run --name cartero-db -e POSTGRES_PASSWORD=admin123 -p 5432:5432 -d postgres

## 📥 2. Carga de Datos y Análisis
Una vez conectada, tenés dos formas de correr este análisis según tu preferencia:

### Opción A: Ejecución Directa (Recomendado)

El script .sql principal ya incluye sentencias INSERT INTO con todos los datos necesarios. Asi que simplemente tenes que descomentar esa parte del codigo y correr todo el script.

### Pasos para la Importación Manual (Opción B)

Conectar desde DBeaver:
Host: localhost.
Puerto: 5432.
Usuario: postgres.
Contraseña: admin123 (la que definimos en el paso anterior).

Al no usar los INSERT automáticos y optar cargar los archivos .csv a mano, seguí este orden:

Ejecutar la Estructura: Primero, seleccioná y ejecutá únicamente la parte del script .sql que contiene los comandos CREATE TABLE para usuarios, prestamos y cuotas.

Verificación: Asegurate de que las tablas aparezcan en el panel izquierdo (Database Navigator) dentro de Public -> Tables.

Importación:

Hacé clic derecho sobre la tabla recién creada (ej: usuarios).

Seleccioná "Import Data".

Cargá el archivo usuarios.csv correspondiente.

Repetí el proceso para todas las tablas (usuarios, prestamos y cuotas).

