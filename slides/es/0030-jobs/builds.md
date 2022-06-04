### Ejecuciones (`builds`)

Cada vez que se ejecuta una tarea, se genera una **ejecución** (`build`) en el log de la tarea.

<img src="/slides/images/es/0030/builds.png" alt="builds" class="r-stretch">


^^^^^^

#### Ejecuciones (`builds`)

* Quién lanzó el build
* Cuándo se ejecutó
* Cuánto tardó

<img src="/slides/images/es/0030/build_page.png" alt="build page" class="r-stretch">


^^^^^^

#### Ejecuciones (`builds`)

* Cambios

<img src="/slides/images/es/0030/build_changes.png" alt="builds changes" class="r-stretch">


notes:

En esta página se muestran los cambios que ha habido en el código.

Cuando conenctemos nuestro codigo con el repositorio, aquí aparecerán los mensajes de los commits 
que han tenido lugar desde la última ejecución.


^^^^^^

#### Ejecuciones (`builds`)

* Captura de la salida por consola de la ejecución

<img src="/slides/images/es/0030/build_console_output.png" alt="build_console_output" class="r-stretch">

notes:

En esta captura vemos que se muestra a la izquierda de cada línea de la consola 
la fecha y hora de cada comando. Esto es así porque se 
ha marcado la opción "Add timestamps to the Console Output" de la sección 
"Entorno de ejecución" en la configuración de la tarea.

^^^^^^

#### Ejecuciones (`builds`)

* Borrar la tarea
* Ver recursos bloqueados

<img src="/slides/images/es/0030/build_page_2.png" alt="build page" class="r-stretch">

notes:

En esta captura vemos que se muestra a la izquierda un enlace para borrar la ejecución
y otro para ver los recursos bloqueados. Este último enlace sale porque se 
ha marcado la opción "This build requires lockable resources" de la sección 
"General" en la configuración de la tarea.


^^^^^^

#### Ejecuciones (`builds`): un par de trucos

Si haces click sobre el indicador de estado te lleva directamente a la salida de consola

<img src="/slides/images/es/0030/builds_click_on_status.png" alt="builds_click_on_status" class="r-stretch">

^^^^^^

#### Ejecuciones (`builds`): un par de trucos

Junto al número de ejecución se puede desplegar un menú

<img src="/slides/images/es/0030/builds_click_on_build_id.png" alt="builds_click_on_build_id" class="r-stretch">
