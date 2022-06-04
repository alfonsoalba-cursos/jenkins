### Warnings Plugin - Next Generation

Este plugin lee la salida por consola de la ejecución y busca:
* Errores de compilación
* Warnings from herramientas análisis estático como CheckStyle, StyleCop, SpotBugs, etc.

^^^^^^

#### Warnings Plugin - Next Generation

* Repeticiones de código detectadas por herramientas de detecció de copy-and-paste (CPD, Simian, etc.)
* Vulnerabilidades
* Tareas abiertas en los comentarios de los fuentes

^^^^^^

#### Warnings Plugin - Next Generation

De esta completa herramienta, configuraremos únicamente la detección de warnings como ejemplo 
en este curso

^^^^^^

#### Warnings: Instalar el plugin

![warnings_ng_plugin_installation_step_1](/slides/images/es/0050/warnings_ng_plugin_installation_step_1.png)<!-- .element: style="height: 60vh" -->

^^^^^^

#### Warnings: Instalar el plugin
En esta página vemos varios plugins que han quedado obsoletos a raiz de la publicación de
es plugin.

Esta información también podemos encontrarla en la [Página del plugin](https://plugins.jenkins.io/warnings-ng/).

^^^^^^

#### Warnings: Configuración global

Este Plugin no requiere de una configuración global como ocurría con DOxygen.

^^^^^^

#### Warnings: Añadir paso para compilar

![warnings_add_step_to_job_step_1](/slides/images/es/0050/warnings_add_step_to_job_step_1.png)

^^^^^^

#### Warnings: Añadir acción para ejecutar después

![warnings_add_step_to_job_step_2](/slides/images/es/0050/warnings_add_step_to_job_step_2-1.png)

^^^^^^

#### Warnings: Añadir acción para ejecutar después

Seleccionar el compilador gcc que es el que estamos utilizando:

![warnings_add_step_to_job_step_2-2](/slides/images/es/0050/warnings_add_step_to_job_step_2-2.png)<!-- .element: style="height: 40vh" -->

^^^^^^

#### Warnings: Añadir acción para ejecutar después

Dejamos el resto de campos vacíos para que lea el log de la ejecución:

![warnings_add_step_to_job_step_2-3](/slides/images/es/0050/warnings_add_step_to_job_step_2-3.png)<!-- .element: style="height: 40vh" -->

notes:

Para poder ver los resultados de este plugin, debemos eliminar la acción para procesar después 
correspondiente a cppcheck.

El motivo es que según está el código, esa acción hace que la ejecución falle y por lo tanto
la acción correspondiente al plugin Warnings no se ejecute:

![Warnings Post Action Not Run](/slides/images/es/0050/warnings_post_action_not_run.png)

^^^^^^

#### Warnings: Resultados

![Warnings Results: GNU C Compiler Warnings](/slides/images/es/0050/warnings_gnu_c_compiler_warnings.png)<!-- .element: style="height: 60vh" -->


^^^^^^

#### Warnings Plugin - Next Generation

[Página del Plugin](https://plugins.jenkins.io/warnings-ng/)

^^^^^^

#### 💻️ Ejercicio

1. Sustituir el plugin CppCheck por el Warnings Plugin
1. Impedir que la ejecución sea exitosa cuando se produzca un error o warning en alguna de
  las herramientas
  
notes:

Para el punto 1, basta con añadir una nueva herramienta, seleccionar CPPCheck y incluir
la ruta al xml que generamos:

![CPPCheck Tool with Warnings Plugin](/slides/images/es/0050/warnings_exercise_add_cpp_check_tool.png)
 
Para el punto 2, usaremos el botón "Avanzado" de la acción paera ejecutar después correspondiente
al Plugin Warnings Next Generation, y en la sección "Set Quality Gates" fijamos
el umbral:

![Warnings Quality Gates](/slides/images/es/0050/warnings_exercise_set_thresholds.png)

 