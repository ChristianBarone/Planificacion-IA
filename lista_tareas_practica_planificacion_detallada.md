# Guía detallada de tareas — Práctica de Planificación

## Objetivo real de la práctica
Construir en **PDDL** un dominio y varios problemas para que un planificador genere planes de viaje a partir de ciudades, vuelos, hoteles y restricciones.

La práctica no consiste solo en que el planificador saque un plan, sino en que:

- el modelado del dominio sea correcto;
- los operadores estén bien pensados y justificados;
- los juegos de prueba sean buenos y no triviales;
- la documentación explique claramente lo que habéis hecho y por qué.

---

## 1. Qué entregar
Tienes que preparar **tres bloques de entrega**:

### 1.1. Memoria / informe
Debe explicar de forma razonada:

- cómo habéis modelado el dominio;
- cómo habéis modelado los problemas;
- cómo habéis desarrollado el trabajo, por iteraciones o prototipos;
- qué juegos de prueba habéis diseñado;
- qué intenta comprobar cada prueba;
- qué resultado produce cada prueba;
- qué efecto tienen las ponderaciones si hacéis optimización con varios criterios.

### 1.2. Código PDDL
Debes incluir:

- el archivo o archivos de dominio;
- los problemas de prueba;
- una versión por cada nivel/extensión que realmente hayáis implementado.

### 1.3. Traza de ejecución
Debes incluir un fichero con la salida del planificador al resolver los juegos de prueba.

---

## 2. Herramientas que necesitas

### 2.1. Fast Forward v2.3
La práctica indica que se debe desarrollar con **Fast Forward v2.3**. Si en laboratorio os dan el ejecutable o una versión concreta, usa esa como referencia principal.

### 2.2. metric-ff
El enunciado deja claro que necesitarás **metric-ff**, porque como mínimo habrá atributos numéricos y comparaciones que no son solo igualdad.

#### Dónde descargarlo
Usa la URL indicada en el enunciado:

- [metric-ff](http://fai.cs.uni-saarland.de/hoffmann/metric-ff.html)

#### Qué hacer con metric-ff
- Descargar el código fuente o paquete disponible.
- Compilarlo para tu sistema operativo.
- Verificar que el ejecutable funciona desde terminal.
- Probarlo con un ejemplo mínimo antes de empezar tu dominio real.

#### Comprobaciones mínimas
- Que el ejecutable arranca sin errores.
- Que acepta un `domain.pddl` y un `problem.pddl`.
- Que devuelve un plan para un ejemplo pequeño.

---

## 3. Idea general del problema
El planificador debe construir un **plan de viaje**.

Suposiciones importantes del enunciado:

- el planificador elige la ciudad de inicio;
- no hace falta fijar esa ciudad de antemano;
- el recorrido conecta varias ciudades mediante vuelos;
- no se puede repetir ciudad;
- los vuelos entre la ciudad de origen del cliente y la ciudad inicial/final del recorrido no forman parte del problema.

Esto significa que tu modelo debe representar un **camino por ciudades**, no un tour arbitrario sin restricciones.

---

## 4. Qué implementar sí o sí

## 4.1. Nivel básico
En el nivel básico, el planificador debe ser capaz de:

- escoger varias ciudades a visitar;
- respetar un mínimo de ciudades;
- seleccionar un hotel en cada ciudad visitada;
- seleccionar los vuelos necesarios entre ciudades.

### Qué entidades vas a necesitar
Como mínimo:

- ciudades;
- hoteles;
- vuelos.

### Qué debes representar en el dominio
Ideas razonables de representación:

- qué ciudades existen;
- qué hotel pertenece a qué ciudad;
- qué vuelo conecta una ciudad origen con una destino;
- qué ciudad está visitada;
- en qué ciudad está actualmente el recorrido;
- cuántas ciudades se han visitado.

### Qué acciones probablemente necesitas
No tienen por qué llamarse así, pero una solución razonable suele requerir acciones del estilo:

- iniciar el recorrido en una ciudad;
- viajar de una ciudad a otra;
- alojarse en un hotel de la ciudad actual;
- marcar una ciudad como visitada;
- finalizar el recorrido cuando se cumplan las restricciones.

### Cosas que debes vigilar
- No permitir repetir ciudades.
- No meter predicados redundantes si puedes deducirlos de otros.
- No crear acciones que hagan dos cosas conceptualmente distintas si luego te complican la explicación.

---

## 5. Extensiones y qué implica cada una

## 5.1. Extensión 1 — Días
Aquí añades restricciones temporales simples.

### Debes implementar
- mínimo de días por ciudad;
- máximo de días por ciudad;
- mínimo de días totales del viaje;
- salida del plan indicando cuántos días se pasa en cada ciudad.

### Qué cambia en el modelo
Necesitarás fluentes numéricos para representar cosas como:

- días en cada ciudad;
- días totales acumulados;
- límites mínimo y máximo.

### Idea práctica
Una forma cómoda es usar una acción que incremente días de estancia en la ciudad actual, y otra que permita salir de la ciudad solo cuando la estancia local cumpla el mínimo.

---

## 5.2. Extensión 2 — Interés de las ciudades
Cada ciudad tiene un valor de interés entero. El ejemplo del enunciado dice que **1 es el máximo interés**, así que realmente optimizas minimizando ese valor.

### Debes implementar
- un valor de interés por ciudad;
- una métrica que favorezca visitar ciudades “mejores”; 
- pruebas donde se vea que el plan cambia según el interés disponible.

### Qué escribir en el modelo
- un fluente o mecanismo para asociar interés a cada ciudad;
- una forma de acumular el interés total del recorrido;
- una métrica final de minimización.

### Ideas de pruebas
- Dos rutas con el mismo número de ciudades, pero distinta calidad de interés.
- Un caso donde una ruta más corta no sea la mejor según el interés.

---

## 5.3. Extensión 3 — Precio
Aquí ya no basta con que existan vuelos y hoteles: deben tener **precios distintos**.

### Debes implementar
- precio de cada vuelo;
- precio de cada hotel;
- coste total del viaje;
- restricción de precio mínimo y precio máximo total;
- métrica para minimizar el coste.

### Qué cambia respecto a las extensiones anteriores
- Necesitas modelar costes de forma acumulativa.
- Debes ser coherente con el rango de precios para no crear problemas sin solución.

### Ideas de pruebas
- Un caso donde varias rutas cumplen el objetivo, pero una es claramente más barata.
- Un caso donde el máximo precio fuerza al sistema a descartar una ruta “natural”.
- Un caso donde el mínimo precio evita una solución demasiado corta o demasiado barata.

---

## 5.4. Extensión 4 — Interés + precio con ponderaciones
Es la extensión más completa y la que permite llegar a la nota máxima.

### Debes implementar
- optimización conjunta de interés y precio;
- una métrica ponderada;
- experimentos variando los pesos.

### Qué tienes que demostrar
No basta con poner una fórmula: tienes que enseñar que **cambiar las ponderaciones cambia el plan**, o al menos cambia la preferencia entre soluciones.

### Ideas de pruebas recomendables
- Mismo problema, varias ejecuciones con pesos distintos.
- Un caso donde una ruta sea barata pero poco interesante, y otra más cara pero más interesante.
- Una tabla breve comparando pesos usados y plan obtenido.

---

## 6. Qué nivel te conviene hacer
Según el enunciado, la nota máxima depende del alcance:

- nivel básico: 5;
- extensión 1: 6;
- extensión 2 o 3: 7;
- extensiones 2 y 3: 8.5;
- extensión 4: 10.

### Recomendación práctica
Si vais justos de tiempo, tened muy sólido:

- nivel básico;
- documentación clara;
- juegos de prueba bien explicados.

Un modelo simple pero bien justificado suele valer más que intentar demasiadas extensiones mal cerradas.

---

## 7. Cómo organizar el desarrollo

## 7.1. Primera fase — prototipo mínimo
Objetivo: conseguir un caso básico que funcione.

### Tareas
- Leer el enunciado completo.
- Revisar ejemplos de PDDL y Fast Forward.
- Hacer un primer diseño en papel o texto antes de programar.
- Crear un `domain.pddl` mínimo.
- Crear un `problem.pddl` muy pequeño.
- Verificar que el planificador devuelve un plan válido.

### Consejo
Empieza con pocas ciudades, por ejemplo 3 o 4, y muy pocas acciones. Si el dominio base no funciona, añadir extensiones encima te va a romper todo.

---

## 7.2. Segunda fase — consolidar el nivel básico
Objetivo: dejar limpio el modelo base.

### Tareas
- Revisar predicados innecesarios.
- Revisar si los operadores tienen precondiciones correctas.
- Revisar si los efectos impiden comportamientos no deseados.
- Comprobar que no se repiten ciudades.
- Comprobar que siempre se asigna hotel en las ciudades visitadas.
- Comprobar que el objetivo realmente obliga a visitar el número mínimo pedido.

### Qué debes preguntarte
- ¿Hay acciones aplicables cuando no deberían?
- ¿Hay estados absurdos que el dominio permite?
- ¿Estoy usando predicados porque los necesito, o porque me ayudan a pensar como en un lenguaje imperativo?

---

## 7.3. Tercera fase — añadir extensiones por capas
Hazlo de forma incremental.

### Orden recomendable
1. Nivel básico estable.
2. Extensión 1.
3. Extensión 2 o 3.
4. Extensión 4 solo cuando lo anterior ya esté bien.

### Por qué este orden
La extensión 1 introduce numéricos y restricciones útiles. Luego puedes montar interés o precio encima con menos riesgo.

---

## 8. Cómo diseñar buenos juegos de prueba
El enunciado exige **mínimo 2 problemas no triviales por cada extensión** que implementes.

## 8.1. Qué significa “no trivial” aquí
Un caso no trivial no debería ser algo como:

- dos ciudades y un único vuelo obvio;
- un problema donde solo existe una solución sin ninguna decisión real;
- un caso donde todas las opciones son equivalentes y no se prueba nada.

## 8.2. Qué debe probar cada caso
Cada prueba debe tener una intención clara. Por ejemplo:

- comprobar que no se repiten ciudades;
- comprobar que se cumple el mínimo de ciudades;
- comprobar que se respeta el mínimo y máximo de días;
- comprobar que la optimización por interés cambia la ruta;
- comprobar que el presupuesto descarta ciertas soluciones;
- comprobar que las ponderaciones modifican el resultado.

## 8.3. Ideas de baterías de pruebas

### Para nivel básico
- Caso pequeño totalmente conexo.
- Caso con conexiones parciales donde algunas rutas no son posibles.
- Caso donde una ciudad no debe repetirse aunque facilite conectar otras.

### Para extensión 1
- Caso donde una ciudad obliga a quedarse varios días.
- Caso donde el viaje total no cumple el mínimo si se intenta una ruta corta.

### Para extensión 2
- Caso con dos rutas posibles y diferente interés total.
- Caso donde la mejor ruta por interés no coincide con la más directa.

### Para extensión 3
- Caso con hoteles baratos y caros.
- Caso con vuelos caros que hacen inviable una ruta por presupuesto.

### Para extensión 4
- Caso comparativo con varios pesos.
- Caso donde interés y precio tiran en direcciones opuestas.

---

## 9. Qué escribir exactamente en la memoria
Aquí es donde suele perderse nota. La memoria no debe ser un volcado de código, sino una explicación razonada.

## 9.1. Estructura recomendada de la memoria

### 1. Introducción
Explica brevemente:

- qué problema resuelve la práctica;
- qué niveles/extensiones habéis implementado;
- con qué planificador habéis trabajado.

### 2. Diseño del dominio
Describe:

- tipos usados, si los hay;
- predicados;
- funciones o fluentes numéricos;
- significado de cada elemento;
- por qué es necesario.

#### Qué debes explicar bien aquí
No basta con poner una lista. Tienes que justificar decisiones como:

- por qué existe un predicado y no otro;
- por qué una restricción está en precondiciones y no en el objetivo;
- por qué has separado acciones en lugar de fusionarlas.

### 3. Operadores / acciones
Para cada acción, explica:

- qué hace;
- cuándo puede ejecutarse;
- qué cambia en el estado;
- por qué es necesaria.

#### Plantilla útil para cada operador
```md
#### Acción: viajar
- Propósito: mover el recorrido desde una ciudad origen a una destino.
- Precondiciones: existe un vuelo, la ciudad destino no ha sido visitada, el viajero está en la ciudad origen.
- Efectos: cambia la ciudad actual, marca la nueva ciudad como visitada, actualiza contadores o costes si corresponde.
- Justificación: es la acción central para construir el camino entre ciudades sin repeticiones.
```

### 4. Modelado de problemas
Explica cómo se construyen los `problem.pddl`:

- objetos;
- estado inicial;
- objetivo;
- valores numéricos iniciales;
- restricciones particulares del caso.

### 5. Proceso de desarrollo
Aquí debes contar la evolución real del trabajo:

- primer prototipo;
- problemas detectados;
- cambios hechos;
- por qué refinasteis el modelo.

#### Cosas que sí merece la pena contar
- que al principio faltaba una restricción y el plan repetía ciudades;
- que una acción generaba estados imposibles y hubo que separarla;
- que la optimización no reflejaba bien el criterio y se cambió la métrica.

### 6. Juegos de prueba
Para cada prueba, documenta:

- nombre del caso;
- objetivo del caso;
- datos relevantes del escenario;
- extensión que valida;
- resultado obtenido;
- interpretación del resultado.

#### Plantilla útil para cada prueba
```md
#### Prueba 1 — Ruta básica con mínimo de 3 ciudades
- Objetivo: comprobar que el sistema genera un plan válido visitando al menos 3 ciudades sin repetir ninguna.
- Escenario: 4 ciudades, 1 hotel por ciudad, vuelos bidireccionales entre ciertas parejas.
- Resultado: el plan visita 3 ciudades, selecciona un hotel en cada una y no repite destinos.
- Interpretación: el dominio satisface correctamente las restricciones del nivel básico.
```

### 7. Resultados de optimización
Solo si haces extensiones 2, 3 o 4.

Incluye:

- qué métrica usas;
- qué valores o pesos has probado;
- cómo cambian los planes;
- qué conclusiones sacas.

### 8. Conclusiones técnicas
Cierra con algo corto y útil:

- qué partes están implementadas;
- qué limitaciones tiene el modelo;
- qué mejorarías si tuvieras más tiempo.

---

## 10. Cómo alinearte con la rúbrica
La rúbrica valora cuatro bloques: dominio, operadores, juegos de prueba y completado de niveles.

## 10.1. Para sacar buena nota en dominio
Haz esto:

- definir solo los predicados necesarios;
- explicar el significado de cada predicado;
- justificar por qué representa bien el problema.

Evita esto:

- predicados duplicados;
- predicados “de apoyo mental” que no aportan nada al planificador;
- explicaciones genéricas del tipo “esto se usa para controlar cosas”.

## 10.2. Para sacar buena nota en operadores
Haz esto:

- describir cada operador individualmente;
- justificar por qué existe;
- explicar precondiciones y efectos.

Evita esto:

- listar acciones sin explicar su función;
- meter muchas restricciones en una sola acción si luego no puedes justificarla bien;
- dejar acciones demasiado permisivas.

## 10.3. Para sacar buena nota en juegos de prueba
Haz esto:

- usar casos variados;
- justificar por qué has elegido cada uno;
- explicar la solución obtenida.

Evita esto:

- poner pruebas que solo cambian nombres de ciudades;
- no explicar qué demuestra cada caso;
- no guardar la salida del planificador.

## 10.4. Para sacar buena nota en completado de niveles
Haz esto:

- cerrar bien cada nivel antes de pasar al siguiente;
- indicar claramente qué extensiones están completas;
- evitar prometer más de lo que realmente funciona.

---

## 11. Estructura de archivos recomendada
```text
practica-planificacion/
├── dominio-basico.pddl
├── problema-basico-1.pddl
├── problema-basico-2.pddl
├── dominio-ext1.pddl
├── problema-ext1-1.pddl
├── problema-ext1-2.pddl
├── dominio-ext2.pddl
├── problema-ext2-1.pddl
├── problema-ext2-2.pddl
├── dominio-ext3.pddl
├── problema-ext3-1.pddl
├── problema-ext3-2.pddl
├── dominio-ext4.pddl
├── problema-ext4-1.pddl
├── problema-ext4-2.pddl
├── trazas.txt
└── memoria.md
```

Si reutilizas dominio entre extensiones, también es válido tener menos ficheros, pero debe quedar claro qué versión resuelve qué.

---

## 12. Lista operativa de tareas

## 12.1. Preparación
- [ ] Leer completo el enunciado.
- [ ] Decidir si vais a trabajar en grupo de 3.
- [ ] Revisar requisitos de entrega.
- [ ] Confirmar fecha límite: 8 de junio.
- [ ] Preparar terminal y editor para trabajar con PDDL.

## 12.2. Herramientas
- [ ] Conseguir Fast Forward v2.3.
- [ ] Descargar metric-ff desde la URL del enunciado.
- [ ] Compilar metric-ff.
- [ ] Ejecutar un ejemplo mínimo.
- [ ] Guardar el comando exacto de ejecución para reutilizarlo.

## 12.3. Primer prototipo
- [ ] Diseñar predicados del nivel básico.
- [ ] Diseñar acciones del nivel básico.
- [ ] Crear un problema mínimo.
- [ ] Ejecutarlo.
- [ ] Corregir errores sintácticos y semánticos.

## 12.4. Consolidación del básico
- [ ] Verificar que no se repiten ciudades.
- [ ] Verificar que se visita el mínimo exigido.
- [ ] Verificar que hay hotel en cada ciudad visitada.
- [ ] Revisar si sobran predicados.
- [ ] Revisar si sobran acciones.

## 12.5. Extensiones
- [ ] Elegir pronto qué extensiones vais a hacer.
- [ ] Implementar Extensión 1 si queréis trabajar ya con restricciones numéricas.
- [ ] Implementar Extensión 2 si queréis optimización por interés.
- [ ] Implementar Extensión 3 si queréis optimización por coste.
- [ ] Implementar Extensión 4 solo si podéis demostrar el efecto de las ponderaciones.

## 12.6. Juegos de prueba
- [ ] Crear al menos 2 pruebas no triviales por extensión implementada.
- [ ] Definir el objetivo de cada prueba.
- [ ] Ejecutar todas las pruebas.
- [ ] Guardar todas las trazas.
- [ ] Revisar si alguna prueba realmente no demuestra nada y sustituirla.

## 12.7. Memoria
- [ ] Escribir introducción.
- [ ] Escribir diseño del dominio.
- [ ] Explicar todos los predicados.
- [ ] Explicar todas las acciones.
- [ ] Explicar cómo se modelan los problemas.
- [ ] Explicar el proceso iterativo de desarrollo.
- [ ] Documentar cada juego de prueba.
- [ ] Añadir análisis de resultados.
- [ ] Añadir análisis de ponderaciones si aplica.
- [ ] Revisar redacción para que esté razonada y no solo descriptiva.

## 12.8. Entrega
- [ ] Revisar que están los `.pddl`.
- [ ] Revisar que está la memoria.
- [ ] Revisar que está el fichero de trazas.
- [ ] Revisar nombres de archivos.
- [ ] Entregar en formato electrónico.

---

## 13. Consejos finales útiles
- Empieza por algo muy pequeño que funcione.
- No intentes modelar todo a la vez.
- Cada extensión debe apoyarse en un básico estable.
- Guarda trazas desde el principio, no al final.
- Escribe la memoria mientras desarrollas, no solo al terminar.
- Si una extensión no está bien cerrada, es mejor dejar clara su limitación que venderla como completa.

---

## 14. Mini plantilla de memoria en Markdown
```md
# Memoria — Práctica de Planificación

## 1. Introducción
Breve descripción del problema y de las extensiones implementadas.

## 2. Dominio
### 2.1. Predicados
### 2.2. Fluentes numéricos
### 2.3. Justificación del modelado

## 3. Operadores
### 3.1. Acción 1
### 3.2. Acción 2
### 3.3. Acción 3

## 4. Modelado de problemas
### 4.1. Objetos
### 4.2. Estado inicial
### 4.3. Objetivo

## 5. Desarrollo iterativo
Descripción de prototipos, errores encontrados y refinamientos.

## 6. Juegos de prueba
### 6.1. Prueba 1
### 6.2. Prueba 2
### 6.3. ...

## 7. Resultados
Análisis de soluciones y, si aplica, de métricas y ponderaciones.

## 8. Conclusiones
Resumen técnico breve.
```
