📊 Optimización del Rendimiento - Call Center "Arcoiris"
Este proyecto consiste en un análisis integral de métricas de desempeño y calidad de un equipo de atención al cliente y ventas. El objetivo es transformar datos crudos en insights accionables para supervisores y gerencia.

📋 Contexto del Proyecto
El dataset contiene 600 registros de 50 agentes durante un periodo de 12 días. Se analizan tiempos de operación, efectividad de ventas y niveles de satisfacción del cliente.

📖 Glosario de Métricas (Diccionario de Datos)
Para garantizar la consistencia en el análisis, se definieron los siguientes conceptos clave:

min_llamada (Talk Time): Tiempo neto de conversación con el cliente. Mide la interacción directa.

min_gestion (After Call Work - ACW): Tiempo administrativo posterior a la llamada (carga de pedidos, notas en CRM). Una gestión muy alta puede indicar fricción en las herramientas internas.

min_pausa: Tiempo de descanso programado.

calificacion: Feedback del cliente en escala 1-6.

AHT (Average Handle Time): Calculado como (min_llamada + min_gestion) / llamadas. Es la métrica reina de eficiencia operativa.

🛠️ Stack Tecnológico
Python (Pandas/Seaborn): Para el Análisis Exploratorio de Datos (EDA) y detección de outliers.

Power BI: Para el modelado de datos (Star Schema) y creación de dashboards interactivos.

DAX: Creación de medidas personalizadas para KPIs de conversión y calidad.

🚀 Análisis y Hallazgos Principales
(Acá podés ir completando a medida que avances, por ejemplo:)

Outliers de Eficiencia: Se detectaron agentes con tiempos de gestión que superan el 80% del tiempo de llamada, sugiriendo necesidad de re-capacitación en sistemas.

Correlación Calidad-Venta: Análisis de si una mayor duración de llamada impacta positivamente en la calificación final.