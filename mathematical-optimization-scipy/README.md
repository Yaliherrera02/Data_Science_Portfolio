# Optimización y Modelado Matemático con SciPy
Este repositorio contiene la resolución de problemas de optimización logística y de producción utilizando Programación Lineal y Entera. El objetivo principal es traducir restricciones de negocio complejas en modelos matemáticos para maximizar la eficiencia operativa y la rentabilidad.
## 🚀 Tecnologías Utilizadas
Python 3.9
SciPy (Módulo optimize.milp para programación lineal entera mixta)
NumPy (Gestión de matrices y vectores)
Matplotlib (Visualización de regiones de factibilidad)
## 📋 Casos de Estudio
1. Optimización de Producción en Imprenta
Problema: Determinar la combinación óptima de folletos y afiches bajo restricciones de stock de papel, presupuesto de producción y límites de capacidad.
Logro: Implementé un modelo que identifica el punto de máxima ganancia ($2.900) cumpliendo con 3 restricciones multivariable.
Insight hallado: Se cumplieron todas las restricciones, generando un total de 90 impresos entre folletos y afiches, utilizando 412 hojas (256 hojas para folletos y 156 para afiches) y obteniendo un costo total de $2000.
Visualización: Generé un gráfico de la Región de Factibilidad para validar visualmente la intersección de las restricciones.

2. Maximización de Ganancias en Fábrica de Cajas
Problema: Asignación de recursos limitados (cartón y cinta) para tres líneas de producto con diferentes márgenes de contribución.
Logro: Implementé un modelo que determinó una ganancia máxima de mediante la producción exclusiva de 8 cajas chicas.
Insight hallado: Identifiqué que el cartón es el factor limitante (recurso agotado al 100%), ya que su escasez es lo único que impide incrementar la producción, a pesar de existir excedentes en cinta y capacidad instalada.
## 🛠️ Instalación y Uso
Para ejecutar los notebooks localmente, se recomienda crear un entorno virtual:
Bash python -m venv .venv
source .venv/bin/activate  # En Mac/Linux
Y descargar las sigueintes librerias:
pip install numpy scipy matplotlib
Nota: Si utilizas VS Code o Jupyter Lab, asegurate de seleccionar el intérprete de Python correcto para ejecutar las celdas del notebook.
## 📈 Próximos Pasos
[ ] Resolución de Ejercicios 3 y 4 (Modelos con mayor complejidad de restricciones).
